import 'dart:async';
import 'dart:convert';

import 'package:trale/core/db/app_database.dart';
import 'package:trale/core/measurement.dart';
import 'package:trale/core/measurementInterpolation.dart';
import 'package:trale/core/measurementStats.dart';
import 'package:trale/core/traleNotifier.dart';

/// Extend DateTime for faster comparison
extension DateTimeExtension on DateTime {
  /// check if two integers corresponds to same day
  bool sameDay(DateTime? other) {
    if (other == null) {
      return false;
    }
    return year == other.year && month == other.month && day == other.day;
  }
}

/// check if day is in list
bool dayInMeasurements(DateTime date, List<Measurement> measurements) => <bool>[
  for (final Measurement m in measurements) date.sameDay(m.date),
].reduce((bool value, bool element) => value || element);

/// Base class for measurement database
class MeasurementDatabaseBaseclass {
  MeasurementDatabaseBaseclass();

  /// broadcast stream to track change of db
  final StreamController<List<Measurement>> _streamController =
      StreamController<List<Measurement>>.broadcast();

  /// get broadcast stream to track change of db
  StreamController<List<Measurement>> get streamController => _streamController;

  List<Measurement>? _measurements;

  /// get sorted measurements
  List<Measurement> get measurements =>
      _measurements == null ? <Measurement>[] : _measurements!
        ..sort((Measurement a, Measurement b) => b.compareTo(a));

  /// fire stream
  void fireStream() {
    streamController.add(measurements);
  }

  /// get mean measurements
  List<Measurement> averageMeasurements(List<Measurement> ms) {
    if (ms.isEmpty) {
      return ms;
    }

    final double meanWeight =
        ms.fold(0.0, (double sum, Measurement m) => sum + m.weight) / ms.length;
    return <Measurement>[
      for (final Measurement m in ms) m.apply(weight: meanWeight),
    ];
  }

  /// get number of measurements
  int get nMeasurements => measurements.length;

  /// date of latest measurement
  DateTime get lastDate => measurements.first.date;

  /// date of first measurement
  DateTime get firstDate => measurements.last.date;

  /// get largest measurement
  Measurement? get max {
    if (measurements.isEmpty) {
      return null;
    }
    return measurements.reduce(
      (Measurement current, Measurement next) =>
          current.weight > next.weight ? current : next,
    );
  }

  /// get lowest measurement
  Measurement? get min {
    if (measurements.isEmpty) {
      return null;
    }
    return measurements.reduce(
      (Measurement current, Measurement next) =>
          current.weight < next.weight ? current : next,
    );
  }
}

/// class providing an API to handle measurements stored in SQLite via Drift
class MeasurementDatabase extends MeasurementDatabaseBaseclass {
  /// singleton constructor
  factory MeasurementDatabase() => _instance;

  /// single instance creation
  MeasurementDatabase._internal();

  /// singleton instance
  static final MeasurementDatabase _instance = MeasurementDatabase._internal();

  /// Drift database instance
  AppDatabase? _db;
  AppDatabase get db => _db ??= AppDatabase();

  /// Completer to track when measurements are loaded
  Completer<void>? _loadCompleter;

  /// check if measurement exists
  bool containsMeasurement(Measurement m) {
    final List<bool> isMeasurement = <bool>[
      for (final Measurement measurement in measurements)
        measurement.isIdentical(m),
    ];
    return isMeasurement.contains(true);
  }

  /// Triggers a refresh of measurements after data has been persisted elsewhere.
  /// 
  /// NOTE: This method does NOT persist the measurement to the database.
  /// Data persistence should be handled via app_database.dart (Drift) before
  /// calling this method. This method only triggers a UI refresh by calling
  /// reinit() to reload measurements from the database and update listeners.
  /// 
  /// Returns true to maintain backward compatibility with the existing API.
  bool insertMeasurement(Measurement m) {
    // Data is already persisted via app_database.dart (Drift)
    // This just triggers refresh for charts/stats
    reinit();
    return true;
  }

  /// insert a list of measurements into the box
  int insertMeasurementList(List<Measurement> ms) {
    // Data is already persisted via app_database.dart (Drift)
    // This just triggers refresh for charts/stats
    reinit();
    return ms.length;
  }

  /// delete Measurements from box
  void deleteMeasurement(Measurement m) {
    // Data is already deleted via app_database.dart (Drift)
    // This just triggers refresh for charts/stats
    reinit();
  }

  /// delete all Measurements from box
  Future<void> deleteAllMeasurements() async {
    // Data is already deleted via app_database.dart (Drift)
    // This just triggers refresh for charts/stats
    reinit();
  }

  /// re initialize database
  void reinit() {
    // If a load is already in progress, reuse the existing completer
    // instead of starting a new overlapping load
    if (_loadCompleter != null && !_loadCompleter!.isCompleted) {
      // Load already in progress, don't start a new one
      // Just trigger updates and return
      MeasurementInterpolation().reinit();
      MeasurementStats().reinit();
      TraleNotifier().notify();
      return;
    }
    
    // No load in progress, start a new one
    _measurements = null;
    _loadCompleter = null;

    // Start async load and fire stream when done
    _initAsync();

    // update interpolation and stats immediately
    // (they will get updated data when measurements are loaded)
    MeasurementInterpolation().reinit();
    MeasurementStats().reinit();
    
    TraleNotifier().notify();
  }

  /// Internal async initialization
  Future<void> _initAsync() async {
    await init();
    // fire stream only once after load completes
    fireStream();
  }

  /// initialize database
  Future<void> init() async {
    // Wait for measurements to load
    await _ensureMeasurementsLoaded();
  }

  @override
  List<Measurement>? _measurements;

  /// Ensure measurements are loaded, using Completer to prevent duplicate loads
  Future<void> _ensureMeasurementsLoaded() async {
    if (_measurements != null) return;
    
    // If already loading, wait for that to complete
    if (_loadCompleter != null) {
      return _loadCompleter!.future;
    }
    
    // Start a new load
    _loadCompleter = Completer<void>();
    await _loadMeasurementsFromDatabase();
    _loadCompleter!.complete();
  }

  /// Load measurements from Drift database
  /// 
  /// Returns normally with an empty list if the database query fails.
  /// Errors are logged but not rethrown to maintain application stability.
  Future<void> _loadMeasurementsFromDatabase() async {
    try {
      final List<CheckIn> checkIns = await db.getAllCheckIns();
      _measurements = checkIns
          .where((CheckIn c) => c.weight != null)
          .map((CheckIn c) => Measurement(
                date: DateTime.parse(c.checkInDate),
                weight: c.weight!,
                isMeasured: true,
              ))
          .toList()
        ..sort((Measurement a, Measurement b) => b.compareTo(a));
    } catch (e, stackTrace) {
      // Log the exception and stack trace so database issues are visible
      // ignore: avoid_print
      print('Error loading measurements from database: $e');
      // ignore: avoid_print
      print('Stack trace: $stackTrace');
      // Return empty list on error to maintain application stability
      _measurements = <Measurement>[];
    }
  }

  /// get sorted measurements
  @override
  List<Measurement> get measurements {
    // Return current measurements or empty list if not loaded yet
    return _measurements ?? <Measurement>[];
  }

  /// date of latest measurement
  @override
  DateTime get lastDate => measurements.isNotEmpty ? measurements.first.date : DateTime.now();

  /// date of first measurement
  @override
  DateTime get firstDate => measurements.isNotEmpty ? measurements.last.date : DateTime.now();

  /// return string for export
  String get exportString {
    const String header =
        '# This file was created with trale.\n'
        '#Date weight[kg]\n';
    final String body = <String>[
      for (final Measurement m in measurements) m.exportString,
    ].join('\n');
    return header + body;
  }

  /// parse list of measurements from export string
  List<Measurement> parseString({required String exportString}) {
    final List<String> lines = const LineSplitter().convert(exportString);
    lines.removeWhere((String element) => element.startsWith('#'));

    return <Measurement>[
      for (final String line in lines)
        Measurement.fromString(exportString: line),
    ];
  }
}
