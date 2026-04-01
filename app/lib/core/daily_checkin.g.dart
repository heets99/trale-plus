// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: public_member_api_docs

part of 'daily_checkin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyCheckInAdapter extends TypeAdapter<DailyCheckIn> {
  @override
  final int typeId = 1;

  @override
  DailyCheckIn read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyCheckIn(
      date: fields[0] as DateTime,
      weight: fields[1] as double?,
      height: fields[2] as double?,
      neck: fields[3] as double?,
      waist: fields[4] as double?,
      hip: fields[5] as double?,
      photosPaths: (fields[6] as List?)?.cast<String>() ?? [],
      thoughts: fields[7] as String? ?? '',
      workouts: (fields[8] as List?)?.cast<WorkoutEntry>() ?? [],
      workoutDurationMinutes: fields[9] as int?,
      isCompleted: fields[10] as bool? ?? false,
    );
  }

  @override
  void write(BinaryWriter writer, DailyCheckIn obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.neck)
      ..writeByte(4)
      ..write(obj.waist)
      ..writeByte(5)
      ..write(obj.hip)
      ..writeByte(6)
      ..write(obj.photosPaths)
      ..writeByte(7)
      ..write(obj.thoughts)
      ..writeByte(8)
      ..write(obj.workouts)
      ..writeByte(9)
      ..write(obj.workoutDurationMinutes)
      ..writeByte(10)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyCheckInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkoutEntryAdapter extends TypeAdapter<WorkoutEntry> {
  @override
  final int typeId = 2;

  @override
  WorkoutEntry read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutEntry(
      type: fields[0] as String,
      setMeasure: fields[1] as String,
      reps: fields[2] as int,
      sets: fields[3] as int,
      isOutdoor: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.setMeasure)
      ..writeByte(2)
      ..write(obj.reps)
      ..writeByte(3)
      ..write(obj.sets)
      ..writeByte(4)
      ..write(obj.isOutdoor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}