// ignore_for_file: file_names
import 'dart:math' as math;
import 'package:hive_ce/hive.dart';

part 'daily_checkin.g.dart';

/// Class for daily check-in data
@HiveType(typeId: 1)
class DailyCheckIn {
  /// constructor
  DailyCheckIn({
    required this.date,
    this.weight,
    this.height,
    this.neck,
    this.waist,
    this.hip, // Used for body-fat calculation
    this.photosPaths = const [],
    this.thoughts = '',
    this.workouts = const [],
    this.workoutDurationMinutes,
    this.isCompleted = false,
  });

  /// Date of the check-in (day only, no time)
  @HiveField(0)
  final DateTime date;

  /// Weight in kg
  @HiveField(1)
  final double? weight;

  /// Height in cm
  @HiveField(2)
  final double? height;

  /// Neck circumference in cm
  @HiveField(3)
  final double? neck;

  /// Waist circumference in cm
  @HiveField(4)
  final double? waist;

  /// Hip circumference in cm (used for body-fat calculation)
  @HiveField(5)
  final double? hip;

  /// List of photo file paths
  @HiveField(6)
  final List<String> photosPaths;

  /// User's thoughts for the day
  @HiveField(7)
  final String thoughts;

  /// List of workout entries
  @HiveField(8)
  final List<WorkoutEntry> workouts;

  /// Total workout duration in minutes (optional)
  @HiveField(9)
  final int? workoutDurationMinutes;

  /// Whether the check-in is completed and immutable
  @HiveField(10)
  final bool isCompleted;

  /// Calculate BMI (weight in kg / height in m^2)
  double? get bmi {
    if (weight == null || height == null || height == 0) {
      return null;
    }
    return weight! / ((height! / 100) * (height! / 100));
  }

  /// Calculate estimated body-fat % using US Navy method
  /// For men: 495 / (1.0324 - 0.19077 * log10(waist - neck) + 0.15456 * log10(height)) - 450
  /// Note: This is a simplified version and assumes male by default
  /// A more complete implementation would need gender parameter
  double? get bodyFatPercentage {
    if (waist == null || neck == null || height == null) {
      return null;
    }
    if (waist! <= neck!) {
      return null;
    }
    try {
      // US Navy method for men
      final double logWaistNeck = math.log(waist! - neck!) / math.ln10;
      final double logHeight = math.log(height!) / math.ln10;
      final double denominator = 1.0324 - 0.19077 * logWaistNeck + 0.15456 * logHeight;
      if (denominator <= 0) {
        return null;
      }
      return 495 / denominator - 450;
    } catch (e) {
      return null;
    }
  }

  /// Check if this check-in is for today
  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }

  /// Check if this check-in can still be edited (not end of day)
  bool get canEdit {
    if (isCompleted) return false;
    return isToday;
  }

  /// Create a copy with modifications
  DailyCheckIn copyWith({
    DateTime? date,
    double? weight,
    double? height,
    double? neck,
    double? waist,
    double? hip,
    List<String>? photosPaths,
    String? thoughts,
    List<WorkoutEntry>? workouts,
    int? workoutDurationMinutes,
    bool? isCompleted,
  }) {
    return DailyCheckIn(
      date: date ?? this.date,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      neck: neck ?? this.neck,
      waist: waist ?? this.waist,
      hip: hip ?? this.hip,
      photosPaths: photosPaths ?? this.photosPaths,
      thoughts: thoughts ?? this.thoughts,
      workouts: workouts ?? this.workouts,
      workoutDurationMinutes: workoutDurationMinutes ?? this.workoutDurationMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

/// Class for workout entry
@HiveType(typeId: 2)
class WorkoutEntry {
  /// constructor
  WorkoutEntry({
    required this.type,
    required this.setMeasure,
    required this.reps,
    required this.sets,
    required this.isOutdoor,
  });

  /// Type of workout (e.g., "Push-ups", "Squats", "Running")
  @HiveField(0)
  final String type;

  /// The measure unit for sets (e.g., "kg", "lbs", "minutes")
  @HiveField(1)
  final String setMeasure;

  /// Number of reps or minutes
  @HiveField(2)
  final int reps;

  /// Number of sets
  @HiveField(3)
  final int sets;

  /// Whether the workout was done outdoors
  @HiveField(4)
  final bool isOutdoor;

  /// Create a copy with modifications
  WorkoutEntry copyWith({
    String? type,
    String? setMeasure,
    int? reps,
    int? sets,
    bool? isOutdoor,
  }) {
    return WorkoutEntry(
      type: type ?? this.type,
      setMeasure: setMeasure ?? this.setMeasure,
      reps: reps ?? this.reps,
      sets: sets ?? this.sets,
      isOutdoor: isOutdoor ?? this.isOutdoor,
    );
  }
}

/// Class wrapping daily check-in with its hive key
class SortedDailyCheckIn {
  /// constructor
  SortedDailyCheckIn({required this.key, required this.checkIn});

  /// DailyCheckIn object
  final DailyCheckIn checkIn;

  /// Hive key
  final dynamic key;

  /// implement sorting entries by date
  /// comparator method
  int compareTo(SortedDailyCheckIn other) =>
      checkIn.date.compareTo(other.checkIn.date);

  /// compare method to use default sort method on list
  static int compare(SortedDailyCheckIn a, SortedDailyCheckIn b) =>
      a.compareTo(b);
}