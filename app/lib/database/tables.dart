import 'package:drift/drift.dart';

class CheckIns extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get weight => real().nullable()();
  RealColumn get height => real().nullable()();
  TextColumn get thoughts => text().nullable()();
  TextColumn get workout => text().nullable()();
}

class CheckInPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get checkInId => integer().references(CheckIns, #id, onDelete: KeyAction.cascade)();
  TextColumn get photoPath => text()();
  BoolColumn get nsfw => boolean().withDefault(const Constant(true))();
  DateTimeColumn get capturedAt => dateTime()();
}

class CheckInColors extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get checkInId => integer().references(CheckIns, #id, onDelete: KeyAction.cascade)();
  TextColumn get timestamp => text()();
  TextColumn get colorHex => text()();
  TextColumn get message => text().nullable()();
  BoolColumn get immutable => boolean().withDefault(const Constant(true))();
}

class WorkoutTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

class CheckInWorkoutTags extends Table {
  IntColumn get checkInId => integer().references(CheckIns, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId => integer().references(WorkoutTags, #id, onDelete: KeyAction.cascade)();
  
  @override
  Set<Column> get primaryKey => {checkInId, tagId};
}