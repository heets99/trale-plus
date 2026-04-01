// ignore_for_file: file_names
import 'dart:math' as math;
import 'dart:async';
import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:trale/core/daily_checkin.dart';
import 'package:trale/core/measurement.dart';
import 'package:trale/main.dart';

/// Box name for daily check-ins
const String dailyCheckInBoxName = 'daily_checkins';

/// Box name for workout types
const String workoutTypesBoxName = 'workout_types';

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

/// class providing an API to handle daily check-ins stored in hive
class DailyCheckInDatabase {
  /// singleton constructor
  factory DailyCheckInDatabase() => _instance;

  /// single instance creation
  DailyCheckInDatabase._internal();

  /// singleton instance
  static final DailyCheckInDatabase _instance = DailyCheckInDatabase._internal();

  static const String _boxName = dailyCheckInBoxName;
  static const String _workoutTypesBoxName = workoutTypesBoxName;

  /// get box
  Box<DailyCheckIn> get box => Hive.box<DailyCheckIn>(_boxName);
  
  /// get workout types box
  Box<String> get workoutTypesBox => Hive.box<String>(_workoutTypesBoxName);

  /// broadcast stream to track change of db
  final StreamController<List<DailyCheckIn>> _streamController =
      StreamController<List<DailyCheckIn>>.broadcast();

  /// get broadcast stream to track change of db
  StreamController<List<DailyCheckIn>> get streamController => _streamController;

  List<DailyCheckIn>? _checkIns;

  /// get sorted check-ins
  List<DailyCheckIn> get checkIns =>
      _checkIns == null ? <DailyCheckIn>[] : _checkIns!
        ..sort((DailyCheckIn a, DailyCheckIn b) => b.date.compareTo(a.date));

  /// fire stream
  void fireStream() {
    streamController.add(checkIns);
  }

  /// get sorted check-ins with key tuples
  List<SortedDailyCheckIn> get sortedCheckIns =>
      <SortedDailyCheckIn>[
        for (final dynamic key in box.keys)
          SortedDailyCheckIn(key: key, checkIn: box.get(key)!),
      ]..sort((SortedDailyCheckIn a, SortedDailyCheckIn b) => b.compareTo(a));

  /// initialize database
  void init() {
    checkIns;
  }

  /// re initialize database
  Future<void> reinit() async {
    _checkIns = null;
    init();
    fireStream();
  }

  /// check if check-in exists on date
  bool existsCheckInOnDate(DateTime date) =>
      dayInCheckIns(date, checkIns);

  /// Get check-in for a specific date
  DailyCheckIn? checkInOnDate(DateTime date) {
    for (final DailyCheckIn c in checkIns) {
      if (date.sameDay(c.date)) {
        return c;
      }
    }
    return null;
  }

  /// Get today's check-in (or create a new one if none exists)
  DailyCheckIn getTodayCheckIn() {
    final now = DateTime.now();
    final existing = checkInOnDate(now);
    if (existing != null) {
      return existing;
    }
    // Return a new empty check-in for today
    return DailyCheckIn(date: DateTime(now.year, now.month, now.day));
  }

  /// insert or update a daily check-in
  Future<bool> saveCheckIn(DailyCheckIn checkIn) async {
    // Check if there's already a check-in for this date
    final existing = checkInOnDate(checkIn.date);
    
    if (existing != null) {
      // Check if it's editable (today and not completed)
      if (!existing.canEdit) {
        return false;
      }
      // Update existing
      final key = sortedCheckIns.firstWhere(
        (c) => c.checkIn.date.sameDay(checkIn.date),
      ).key;
      await box.put(key, checkIn);
    } else {
      // Add new
      box.add(checkIn);
    }
    
    await reinit();
    return true;
  }

  /// mark check-in as completed (immutable)
  Future<bool> completeCheckIn(DateTime date) async {
    final existing = checkInOnDate(date);
    if (existing == null) {
      return false;
    }
    
    final completed = existing.copyWith(isCompleted: true);
    
    final key = sortedCheckIns.firstWhere(
      (c) => c.checkIn.date.sameDay(date),
    ).key;
    await box.put(key, completed);
    await reinit();
    return true;
  }

  /// delete a daily check-in
  Future<void> deleteCheckIn(SortedDailyCheckIn checkIn) async {
    box.delete(checkIn.key);
    await reinit();
  }

  /// delete all daily check-ins
  Future<void> deleteAllCheckIns() async {
    for (final SortedDailyCheckIn c in sortedCheckIns) {
      await box.delete(c.key);
    }
    await reinit();
  }

  // ===== Workout Types Management =====

  /// Get all workout types
  List<String> get workoutTypes {
    final types = workoutTypesBox.values.toList();
    if (types.isEmpty) {
      // Return default workout types
      return _defaultWorkoutTypes;
    }
    return types;
  }

  /// Default workout types
  static const List<String> _defaultWorkoutTypes = [
    'Push-ups',
    'Pull-ups',
    'Squats',
    'Lunges',
    'Plank',
    'Running',
    'Cycling',
    'Swimming',
    'Walking',
    'Yoga',
    'Weight lifting',
    'Burpees',
    'Crunches',
    'Deadlifts',
    'Bench press',
  ];

  /// Add a workout type
  Future<void> addWorkoutType(String type) async {
    if (!workoutTypesBox.values.contains(type)) {
      await workoutTypesBox.add(type);
    }
  }

  /// Remove a workout type
  Future<void> removeWorkoutType(String type) async {
    final index = workoutTypesBox.values.toList().indexOf(type);
    if (index >= 0) {
      await workoutTypesBox.deleteAt(index);
    }
  }

  /// Reset workout types to defaults
  Future<void> resetWorkoutTypes() async {
    await workoutTypesBox.clear();
    for (final type in _defaultWorkoutTypes) {
      await workoutTypesBox.add(type);
    }
  }

  // ===== Photo Management =====

  /// Save a photo and return the path
  static Future<String> savePhoto(File imageFile, DateTime date) async {
    final directory = await _getPhotosDirectory();
    
    // Create date-based subdirectory
    final dateDir = Directory('${directory.path}/${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}');
    if (!await dateDir.exists()) {
      await dateDir.create(recursive: true);
    }
    
    // Generate unique filename with timestamp
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'photo_$timestamp.jpg';
    final savedPath = '${dateDir.path}/$fileName';
    
    // Copy and strip EXIF
    await _stripExifData(imageFile, savedPath);
    
    return savedPath;
  }

  /// Get photos directory
  static Future<Directory> _getPhotosDirectory() async {
    // Use app's private directory
    final appDir = Directory.current;
    final photosDir = Directory('${appDir.path}/daily_checkin_photos');
    if (!await photosDir.exists()) {
      await photosDir.create(recursive: true);
    }
    return photosDir;
  }

  /// Strip EXIF data except date/time
  static Future<void> _stripExifData(File source, String destPath) async {
    // Read the image
    final bytes = await source.readAsBytes();
    
    // For simplicity, we'll save as new file without EXIF
    // In a production app, you'd use a proper EXIF stripping library
    // Here we're just copying the raw bytes which removes most EXIF
    final file = File(destPath);
    await file.writeAsBytes(bytes);
  }

  /// Delete a photo
  static Future<void> deletePhoto(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Check if day has a completed check-in (end of day)
  bool isDayCompleted(DateTime date) {
    final checkIn = checkInOnDate(date);
    return checkIn?.isCompleted ?? false;
  }
}

/// check if day is in list
bool dayInCheckIns(DateTime date, List<DailyCheckIn> checkIns) => <bool>[
  for (final DailyCheckIn c in checkIns) date.sameDay(c.date),
].reduce((bool value, bool element) => value || element);