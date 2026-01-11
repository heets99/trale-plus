// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CheckInsTable extends CheckIns with TableInfo<$CheckInsTable, CheckIn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thoughtsMeta = const VerificationMeta(
    'thoughts',
  );
  @override
  late final GeneratedColumn<String> thoughts = GeneratedColumn<String>(
    'thoughts',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workoutMeta = const VerificationMeta(
    'workout',
  );
  @override
  late final GeneratedColumn<String> workout = GeneratedColumn<String>(
    'workout',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    weight,
    height,
    thoughts,
    workout,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_ins';
  @override
  VerificationContext validateIntegrity(
    Insertable<CheckIn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('thoughts')) {
      context.handle(
        _thoughtsMeta,
        thoughts.isAcceptableOrUnknown(data['thoughts']!, _thoughtsMeta),
      );
    }
    if (data.containsKey('workout')) {
      context.handle(
        _workoutMeta,
        workout.isAcceptableOrUnknown(data['workout']!, _workoutMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckIn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckIn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      thoughts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thoughts'],
      ),
      workout: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout'],
      ),
    );
  }

  @override
  $CheckInsTable createAlias(String alias) {
    return $CheckInsTable(attachedDatabase, alias);
  }
}

class CheckIn extends DataClass implements Insertable<CheckIn> {
  final int id;
  final DateTime date;
  final double? weight;
  final double? height;
  final String? thoughts;
  final String? workout;
  const CheckIn({
    required this.id,
    required this.date,
    this.weight,
    this.height,
    this.thoughts,
    this.workout,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || thoughts != null) {
      map['thoughts'] = Variable<String>(thoughts);
    }
    if (!nullToAbsent || workout != null) {
      map['workout'] = Variable<String>(workout);
    }
    return map;
  }

  CheckInsCompanion toCompanion(bool nullToAbsent) {
    return CheckInsCompanion(
      id: Value(id),
      date: Value(date),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      thoughts: thoughts == null && nullToAbsent
          ? const Value.absent()
          : Value(thoughts),
      workout: workout == null && nullToAbsent
          ? const Value.absent()
          : Value(workout),
    );
  }

  factory CheckIn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckIn(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      weight: serializer.fromJson<double?>(json['weight']),
      height: serializer.fromJson<double?>(json['height']),
      thoughts: serializer.fromJson<String?>(json['thoughts']),
      workout: serializer.fromJson<String?>(json['workout']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'weight': serializer.toJson<double?>(weight),
      'height': serializer.toJson<double?>(height),
      'thoughts': serializer.toJson<String?>(thoughts),
      'workout': serializer.toJson<String?>(workout),
    };
  }

  CheckIn copyWith({
    int? id,
    DateTime? date,
    Value<double?> weight = const Value.absent(),
    Value<double?> height = const Value.absent(),
    Value<String?> thoughts = const Value.absent(),
    Value<String?> workout = const Value.absent(),
  }) => CheckIn(
    id: id ?? this.id,
    date: date ?? this.date,
    weight: weight.present ? weight.value : this.weight,
    height: height.present ? height.value : this.height,
    thoughts: thoughts.present ? thoughts.value : this.thoughts,
    workout: workout.present ? workout.value : this.workout,
  );
  CheckIn copyWithCompanion(CheckInsCompanion data) {
    return CheckIn(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      weight: data.weight.present ? data.weight.value : this.weight,
      height: data.height.present ? data.height.value : this.height,
      thoughts: data.thoughts.present ? data.thoughts.value : this.thoughts,
      workout: data.workout.present ? data.workout.value : this.workout,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckIn(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('thoughts: $thoughts, ')
          ..write('workout: $workout')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, weight, height, thoughts, workout);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckIn &&
          other.id == this.id &&
          other.date == this.date &&
          other.weight == this.weight &&
          other.height == this.height &&
          other.thoughts == this.thoughts &&
          other.workout == this.workout);
}

class CheckInsCompanion extends UpdateCompanion<CheckIn> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double?> weight;
  final Value<double?> height;
  final Value<String?> thoughts;
  final Value<String?> workout;
  const CheckInsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.thoughts = const Value.absent(),
    this.workout = const Value.absent(),
  });
  CheckInsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.thoughts = const Value.absent(),
    this.workout = const Value.absent(),
  }) : date = Value(date);
  static Insertable<CheckIn> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<String>? thoughts,
    Expression<String>? workout,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (thoughts != null) 'thoughts': thoughts,
      if (workout != null) 'workout': workout,
    });
  }

  CheckInsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double?>? weight,
    Value<double?>? height,
    Value<String?>? thoughts,
    Value<String?>? workout,
  }) {
    return CheckInsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      thoughts: thoughts ?? this.thoughts,
      workout: workout ?? this.workout,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (thoughts.present) {
      map['thoughts'] = Variable<String>(thoughts.value);
    }
    if (workout.present) {
      map['workout'] = Variable<String>(workout.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('thoughts: $thoughts, ')
          ..write('workout: $workout')
          ..write(')'))
        .toString();
  }
}

class $CheckInPhotosTable extends CheckInPhotos
    with TableInfo<$CheckInPhotosTable, CheckInPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _checkInIdMeta = const VerificationMeta(
    'checkInId',
  );
  @override
  late final GeneratedColumn<int> checkInId = GeneratedColumn<int>(
    'check_in_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES check_ins (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nsfwMeta = const VerificationMeta('nsfw');
  @override
  late final GeneratedColumn<bool> nsfw = GeneratedColumn<bool>(
    'nsfw',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("nsfw" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _capturedAtMeta = const VerificationMeta(
    'capturedAt',
  );
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
    'captured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    checkInId,
    photoPath,
    nsfw,
    capturedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_in_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<CheckInPhoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('check_in_id')) {
      context.handle(
        _checkInIdMeta,
        checkInId.isAcceptableOrUnknown(data['check_in_id']!, _checkInIdMeta),
      );
    } else if (isInserting) {
      context.missing(_checkInIdMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    } else if (isInserting) {
      context.missing(_photoPathMeta);
    }
    if (data.containsKey('nsfw')) {
      context.handle(
        _nsfwMeta,
        nsfw.isAcceptableOrUnknown(data['nsfw']!, _nsfwMeta),
      );
    }
    if (data.containsKey('captured_at')) {
      context.handle(
        _capturedAtMeta,
        capturedAt.isAcceptableOrUnknown(data['captured_at']!, _capturedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckInPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckInPhoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      checkInId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}check_in_id'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      )!,
      nsfw: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}nsfw'],
      )!,
      capturedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}captured_at'],
      )!,
    );
  }

  @override
  $CheckInPhotosTable createAlias(String alias) {
    return $CheckInPhotosTable(attachedDatabase, alias);
  }
}

class CheckInPhoto extends DataClass implements Insertable<CheckInPhoto> {
  final int id;
  final int checkInId;
  final String photoPath;
  final bool nsfw;
  final DateTime capturedAt;
  const CheckInPhoto({
    required this.id,
    required this.checkInId,
    required this.photoPath,
    required this.nsfw,
    required this.capturedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['check_in_id'] = Variable<int>(checkInId);
    map['photo_path'] = Variable<String>(photoPath);
    map['nsfw'] = Variable<bool>(nsfw);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    return map;
  }

  CheckInPhotosCompanion toCompanion(bool nullToAbsent) {
    return CheckInPhotosCompanion(
      id: Value(id),
      checkInId: Value(checkInId),
      photoPath: Value(photoPath),
      nsfw: Value(nsfw),
      capturedAt: Value(capturedAt),
    );
  }

  factory CheckInPhoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckInPhoto(
      id: serializer.fromJson<int>(json['id']),
      checkInId: serializer.fromJson<int>(json['checkInId']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
      nsfw: serializer.fromJson<bool>(json['nsfw']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'checkInId': serializer.toJson<int>(checkInId),
      'photoPath': serializer.toJson<String>(photoPath),
      'nsfw': serializer.toJson<bool>(nsfw),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
    };
  }

  CheckInPhoto copyWith({
    int? id,
    int? checkInId,
    String? photoPath,
    bool? nsfw,
    DateTime? capturedAt,
  }) => CheckInPhoto(
    id: id ?? this.id,
    checkInId: checkInId ?? this.checkInId,
    photoPath: photoPath ?? this.photoPath,
    nsfw: nsfw ?? this.nsfw,
    capturedAt: capturedAt ?? this.capturedAt,
  );
  CheckInPhoto copyWithCompanion(CheckInPhotosCompanion data) {
    return CheckInPhoto(
      id: data.id.present ? data.id.value : this.id,
      checkInId: data.checkInId.present ? data.checkInId.value : this.checkInId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      nsfw: data.nsfw.present ? data.nsfw.value : this.nsfw,
      capturedAt: data.capturedAt.present
          ? data.capturedAt.value
          : this.capturedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckInPhoto(')
          ..write('id: $id, ')
          ..write('checkInId: $checkInId, ')
          ..write('photoPath: $photoPath, ')
          ..write('nsfw: $nsfw, ')
          ..write('capturedAt: $capturedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, checkInId, photoPath, nsfw, capturedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckInPhoto &&
          other.id == this.id &&
          other.checkInId == this.checkInId &&
          other.photoPath == this.photoPath &&
          other.nsfw == this.nsfw &&
          other.capturedAt == this.capturedAt);
}

class CheckInPhotosCompanion extends UpdateCompanion<CheckInPhoto> {
  final Value<int> id;
  final Value<int> checkInId;
  final Value<String> photoPath;
  final Value<bool> nsfw;
  final Value<DateTime> capturedAt;
  const CheckInPhotosCompanion({
    this.id = const Value.absent(),
    this.checkInId = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.nsfw = const Value.absent(),
    this.capturedAt = const Value.absent(),
  });
  CheckInPhotosCompanion.insert({
    this.id = const Value.absent(),
    required int checkInId,
    required String photoPath,
    this.nsfw = const Value.absent(),
    required DateTime capturedAt,
  }) : checkInId = Value(checkInId),
       photoPath = Value(photoPath),
       capturedAt = Value(capturedAt);
  static Insertable<CheckInPhoto> custom({
    Expression<int>? id,
    Expression<int>? checkInId,
    Expression<String>? photoPath,
    Expression<bool>? nsfw,
    Expression<DateTime>? capturedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (checkInId != null) 'check_in_id': checkInId,
      if (photoPath != null) 'photo_path': photoPath,
      if (nsfw != null) 'nsfw': nsfw,
      if (capturedAt != null) 'captured_at': capturedAt,
    });
  }

  CheckInPhotosCompanion copyWith({
    Value<int>? id,
    Value<int>? checkInId,
    Value<String>? photoPath,
    Value<bool>? nsfw,
    Value<DateTime>? capturedAt,
  }) {
    return CheckInPhotosCompanion(
      id: id ?? this.id,
      checkInId: checkInId ?? this.checkInId,
      photoPath: photoPath ?? this.photoPath,
      nsfw: nsfw ?? this.nsfw,
      capturedAt: capturedAt ?? this.capturedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (checkInId.present) {
      map['check_in_id'] = Variable<int>(checkInId.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (nsfw.present) {
      map['nsfw'] = Variable<bool>(nsfw.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInPhotosCompanion(')
          ..write('id: $id, ')
          ..write('checkInId: $checkInId, ')
          ..write('photoPath: $photoPath, ')
          ..write('nsfw: $nsfw, ')
          ..write('capturedAt: $capturedAt')
          ..write(')'))
        .toString();
  }
}

class $CheckInColorsTable extends CheckInColors
    with TableInfo<$CheckInColorsTable, CheckInColor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInColorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _checkInIdMeta = const VerificationMeta(
    'checkInId',
  );
  @override
  late final GeneratedColumn<int> checkInId = GeneratedColumn<int>(
    'check_in_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES check_ins (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<String> timestamp = GeneratedColumn<String>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _immutableMeta = const VerificationMeta(
    'immutable',
  );
  @override
  late final GeneratedColumn<bool> immutable = GeneratedColumn<bool>(
    'immutable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("immutable" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    checkInId,
    timestamp,
    colorHex,
    message,
    immutable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_in_colors';
  @override
  VerificationContext validateIntegrity(
    Insertable<CheckInColor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('check_in_id')) {
      context.handle(
        _checkInIdMeta,
        checkInId.isAcceptableOrUnknown(data['check_in_id']!, _checkInIdMeta),
      );
    } else if (isInserting) {
      context.missing(_checkInIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('immutable')) {
      context.handle(
        _immutableMeta,
        immutable.isAcceptableOrUnknown(data['immutable']!, _immutableMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckInColor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckInColor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      checkInId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}check_in_id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timestamp'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      immutable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}immutable'],
      )!,
    );
  }

  @override
  $CheckInColorsTable createAlias(String alias) {
    return $CheckInColorsTable(attachedDatabase, alias);
  }
}

class CheckInColor extends DataClass implements Insertable<CheckInColor> {
  final int id;
  final int checkInId;
  final String timestamp;
  final String colorHex;
  final String? message;
  final bool immutable;
  const CheckInColor({
    required this.id,
    required this.checkInId,
    required this.timestamp,
    required this.colorHex,
    this.message,
    required this.immutable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['check_in_id'] = Variable<int>(checkInId);
    map['timestamp'] = Variable<String>(timestamp);
    map['color_hex'] = Variable<String>(colorHex);
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    map['immutable'] = Variable<bool>(immutable);
    return map;
  }

  CheckInColorsCompanion toCompanion(bool nullToAbsent) {
    return CheckInColorsCompanion(
      id: Value(id),
      checkInId: Value(checkInId),
      timestamp: Value(timestamp),
      colorHex: Value(colorHex),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      immutable: Value(immutable),
    );
  }

  factory CheckInColor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckInColor(
      id: serializer.fromJson<int>(json['id']),
      checkInId: serializer.fromJson<int>(json['checkInId']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      message: serializer.fromJson<String?>(json['message']),
      immutable: serializer.fromJson<bool>(json['immutable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'checkInId': serializer.toJson<int>(checkInId),
      'timestamp': serializer.toJson<String>(timestamp),
      'colorHex': serializer.toJson<String>(colorHex),
      'message': serializer.toJson<String?>(message),
      'immutable': serializer.toJson<bool>(immutable),
    };
  }

  CheckInColor copyWith({
    int? id,
    int? checkInId,
    String? timestamp,
    String? colorHex,
    Value<String?> message = const Value.absent(),
    bool? immutable,
  }) => CheckInColor(
    id: id ?? this.id,
    checkInId: checkInId ?? this.checkInId,
    timestamp: timestamp ?? this.timestamp,
    colorHex: colorHex ?? this.colorHex,
    message: message.present ? message.value : this.message,
    immutable: immutable ?? this.immutable,
  );
  CheckInColor copyWithCompanion(CheckInColorsCompanion data) {
    return CheckInColor(
      id: data.id.present ? data.id.value : this.id,
      checkInId: data.checkInId.present ? data.checkInId.value : this.checkInId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      message: data.message.present ? data.message.value : this.message,
      immutable: data.immutable.present ? data.immutable.value : this.immutable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckInColor(')
          ..write('id: $id, ')
          ..write('checkInId: $checkInId, ')
          ..write('timestamp: $timestamp, ')
          ..write('colorHex: $colorHex, ')
          ..write('message: $message, ')
          ..write('immutable: $immutable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, checkInId, timestamp, colorHex, message, immutable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckInColor &&
          other.id == this.id &&
          other.checkInId == this.checkInId &&
          other.timestamp == this.timestamp &&
          other.colorHex == this.colorHex &&
          other.message == this.message &&
          other.immutable == this.immutable);
}

class CheckInColorsCompanion extends UpdateCompanion<CheckInColor> {
  final Value<int> id;
  final Value<int> checkInId;
  final Value<String> timestamp;
  final Value<String> colorHex;
  final Value<String?> message;
  final Value<bool> immutable;
  const CheckInColorsCompanion({
    this.id = const Value.absent(),
    this.checkInId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.message = const Value.absent(),
    this.immutable = const Value.absent(),
  });
  CheckInColorsCompanion.insert({
    this.id = const Value.absent(),
    required int checkInId,
    required String timestamp,
    required String colorHex,
    this.message = const Value.absent(),
    this.immutable = const Value.absent(),
  }) : checkInId = Value(checkInId),
       timestamp = Value(timestamp),
       colorHex = Value(colorHex);
  static Insertable<CheckInColor> custom({
    Expression<int>? id,
    Expression<int>? checkInId,
    Expression<String>? timestamp,
    Expression<String>? colorHex,
    Expression<String>? message,
    Expression<bool>? immutable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (checkInId != null) 'check_in_id': checkInId,
      if (timestamp != null) 'timestamp': timestamp,
      if (colorHex != null) 'color_hex': colorHex,
      if (message != null) 'message': message,
      if (immutable != null) 'immutable': immutable,
    });
  }

  CheckInColorsCompanion copyWith({
    Value<int>? id,
    Value<int>? checkInId,
    Value<String>? timestamp,
    Value<String>? colorHex,
    Value<String?>? message,
    Value<bool>? immutable,
  }) {
    return CheckInColorsCompanion(
      id: id ?? this.id,
      checkInId: checkInId ?? this.checkInId,
      timestamp: timestamp ?? this.timestamp,
      colorHex: colorHex ?? this.colorHex,
      message: message ?? this.message,
      immutable: immutable ?? this.immutable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (checkInId.present) {
      map['check_in_id'] = Variable<int>(checkInId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (immutable.present) {
      map['immutable'] = Variable<bool>(immutable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInColorsCompanion(')
          ..write('id: $id, ')
          ..write('checkInId: $checkInId, ')
          ..write('timestamp: $timestamp, ')
          ..write('colorHex: $colorHex, ')
          ..write('message: $message, ')
          ..write('immutable: $immutable')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTagsTable extends WorkoutTags
    with TableInfo<$WorkoutTagsTable, WorkoutTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $WorkoutTagsTable createAlias(String alias) {
    return $WorkoutTagsTable(attachedDatabase, alias);
  }
}

class WorkoutTag extends DataClass implements Insertable<WorkoutTag> {
  final int id;
  final String name;
  const WorkoutTag({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  WorkoutTagsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTagsCompanion(id: Value(id), name: Value(name));
  }

  factory WorkoutTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  WorkoutTag copyWith({int? id, String? name}) =>
      WorkoutTag(id: id ?? this.id, name: name ?? this.name);
  WorkoutTag copyWithCompanion(WorkoutTagsCompanion data) {
    return WorkoutTag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTag(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTag && other.id == this.id && other.name == this.name);
}

class WorkoutTagsCompanion extends UpdateCompanion<WorkoutTag> {
  final Value<int> id;
  final Value<String> name;
  const WorkoutTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  WorkoutTagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<WorkoutTag> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  WorkoutTagsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return WorkoutTagsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CheckInWorkoutTagsTable extends CheckInWorkoutTags
    with TableInfo<$CheckInWorkoutTagsTable, CheckInWorkoutTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInWorkoutTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _checkInIdMeta = const VerificationMeta(
    'checkInId',
  );
  @override
  late final GeneratedColumn<int> checkInId = GeneratedColumn<int>(
    'check_in_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES check_ins (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_tags (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [checkInId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_in_workout_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<CheckInWorkoutTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('check_in_id')) {
      context.handle(
        _checkInIdMeta,
        checkInId.isAcceptableOrUnknown(data['check_in_id']!, _checkInIdMeta),
      );
    } else if (isInserting) {
      context.missing(_checkInIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {checkInId, tagId};
  @override
  CheckInWorkoutTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckInWorkoutTag(
      checkInId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}check_in_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $CheckInWorkoutTagsTable createAlias(String alias) {
    return $CheckInWorkoutTagsTable(attachedDatabase, alias);
  }
}

class CheckInWorkoutTag extends DataClass
    implements Insertable<CheckInWorkoutTag> {
  final int checkInId;
  final int tagId;
  const CheckInWorkoutTag({required this.checkInId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['check_in_id'] = Variable<int>(checkInId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  CheckInWorkoutTagsCompanion toCompanion(bool nullToAbsent) {
    return CheckInWorkoutTagsCompanion(
      checkInId: Value(checkInId),
      tagId: Value(tagId),
    );
  }

  factory CheckInWorkoutTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckInWorkoutTag(
      checkInId: serializer.fromJson<int>(json['checkInId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'checkInId': serializer.toJson<int>(checkInId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  CheckInWorkoutTag copyWith({int? checkInId, int? tagId}) => CheckInWorkoutTag(
    checkInId: checkInId ?? this.checkInId,
    tagId: tagId ?? this.tagId,
  );
  CheckInWorkoutTag copyWithCompanion(CheckInWorkoutTagsCompanion data) {
    return CheckInWorkoutTag(
      checkInId: data.checkInId.present ? data.checkInId.value : this.checkInId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckInWorkoutTag(')
          ..write('checkInId: $checkInId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(checkInId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckInWorkoutTag &&
          other.checkInId == this.checkInId &&
          other.tagId == this.tagId);
}

class CheckInWorkoutTagsCompanion extends UpdateCompanion<CheckInWorkoutTag> {
  final Value<int> checkInId;
  final Value<int> tagId;
  final Value<int> rowid;
  const CheckInWorkoutTagsCompanion({
    this.checkInId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CheckInWorkoutTagsCompanion.insert({
    required int checkInId,
    required int tagId,
    this.rowid = const Value.absent(),
  }) : checkInId = Value(checkInId),
       tagId = Value(tagId);
  static Insertable<CheckInWorkoutTag> custom({
    Expression<int>? checkInId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (checkInId != null) 'check_in_id': checkInId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CheckInWorkoutTagsCompanion copyWith({
    Value<int>? checkInId,
    Value<int>? tagId,
    Value<int>? rowid,
  }) {
    return CheckInWorkoutTagsCompanion(
      checkInId: checkInId ?? this.checkInId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (checkInId.present) {
      map['check_in_id'] = Variable<int>(checkInId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInWorkoutTagsCompanion(')
          ..write('checkInId: $checkInId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CheckInsTable checkIns = $CheckInsTable(this);
  late final $CheckInPhotosTable checkInPhotos = $CheckInPhotosTable(this);
  late final $CheckInColorsTable checkInColors = $CheckInColorsTable(this);
  late final $WorkoutTagsTable workoutTags = $WorkoutTagsTable(this);
  late final $CheckInWorkoutTagsTable checkInWorkoutTags =
      $CheckInWorkoutTagsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    checkIns,
    checkInPhotos,
    checkInColors,
    workoutTags,
    checkInWorkoutTags,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'check_ins',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('check_in_photos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'check_ins',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('check_in_colors', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'check_ins',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('check_in_workout_tags', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'workout_tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('check_in_workout_tags', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CheckInsTableCreateCompanionBuilder =
    CheckInsCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<double?> weight,
      Value<double?> height,
      Value<String?> thoughts,
      Value<String?> workout,
    });
typedef $$CheckInsTableUpdateCompanionBuilder =
    CheckInsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double?> weight,
      Value<double?> height,
      Value<String?> thoughts,
      Value<String?> workout,
    });

final class $$CheckInsTableReferences
    extends BaseReferences<_$AppDatabase, $CheckInsTable, CheckIn> {
  $$CheckInsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CheckInPhotosTable, List<CheckInPhoto>>
  _checkInPhotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.checkInPhotos,
    aliasName: $_aliasNameGenerator(db.checkIns.id, db.checkInPhotos.checkInId),
  );

  $$CheckInPhotosTableProcessedTableManager get checkInPhotosRefs {
    final manager = $$CheckInPhotosTableTableManager(
      $_db,
      $_db.checkInPhotos,
    ).filter((f) => f.checkInId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_checkInPhotosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CheckInColorsTable, List<CheckInColor>>
  _checkInColorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.checkInColors,
    aliasName: $_aliasNameGenerator(db.checkIns.id, db.checkInColors.checkInId),
  );

  $$CheckInColorsTableProcessedTableManager get checkInColorsRefs {
    final manager = $$CheckInColorsTableTableManager(
      $_db,
      $_db.checkInColors,
    ).filter((f) => f.checkInId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_checkInColorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CheckInWorkoutTagsTable, List<CheckInWorkoutTag>>
  _checkInWorkoutTagsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.checkInWorkoutTags,
        aliasName: $_aliasNameGenerator(
          db.checkIns.id,
          db.checkInWorkoutTags.checkInId,
        ),
      );

  $$CheckInWorkoutTagsTableProcessedTableManager get checkInWorkoutTagsRefs {
    final manager = $$CheckInWorkoutTagsTableTableManager(
      $_db,
      $_db.checkInWorkoutTags,
    ).filter((f) => f.checkInId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _checkInWorkoutTagsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CheckInsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thoughts => $composableBuilder(
    column: $table.thoughts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workout => $composableBuilder(
    column: $table.workout,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> checkInPhotosRefs(
    Expression<bool> Function($$CheckInPhotosTableFilterComposer f) f,
  ) {
    final $$CheckInPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkInPhotos,
      getReferencedColumn: (t) => t.checkInId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInPhotosTableFilterComposer(
            $db: $db,
            $table: $db.checkInPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> checkInColorsRefs(
    Expression<bool> Function($$CheckInColorsTableFilterComposer f) f,
  ) {
    final $$CheckInColorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkInColors,
      getReferencedColumn: (t) => t.checkInId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInColorsTableFilterComposer(
            $db: $db,
            $table: $db.checkInColors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> checkInWorkoutTagsRefs(
    Expression<bool> Function($$CheckInWorkoutTagsTableFilterComposer f) f,
  ) {
    final $$CheckInWorkoutTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkInWorkoutTags,
      getReferencedColumn: (t) => t.checkInId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInWorkoutTagsTableFilterComposer(
            $db: $db,
            $table: $db.checkInWorkoutTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CheckInsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thoughts => $composableBuilder(
    column: $table.thoughts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workout => $composableBuilder(
    column: $table.workout,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CheckInsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get thoughts =>
      $composableBuilder(column: $table.thoughts, builder: (column) => column);

  GeneratedColumn<String> get workout =>
      $composableBuilder(column: $table.workout, builder: (column) => column);

  Expression<T> checkInPhotosRefs<T extends Object>(
    Expression<T> Function($$CheckInPhotosTableAnnotationComposer a) f,
  ) {
    final $$CheckInPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkInPhotos,
      getReferencedColumn: (t) => t.checkInId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.checkInPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> checkInColorsRefs<T extends Object>(
    Expression<T> Function($$CheckInColorsTableAnnotationComposer a) f,
  ) {
    final $$CheckInColorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkInColors,
      getReferencedColumn: (t) => t.checkInId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInColorsTableAnnotationComposer(
            $db: $db,
            $table: $db.checkInColors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> checkInWorkoutTagsRefs<T extends Object>(
    Expression<T> Function($$CheckInWorkoutTagsTableAnnotationComposer a) f,
  ) {
    final $$CheckInWorkoutTagsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.checkInWorkoutTags,
          getReferencedColumn: (t) => t.checkInId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CheckInWorkoutTagsTableAnnotationComposer(
                $db: $db,
                $table: $db.checkInWorkoutTags,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CheckInsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInsTable,
          CheckIn,
          $$CheckInsTableFilterComposer,
          $$CheckInsTableOrderingComposer,
          $$CheckInsTableAnnotationComposer,
          $$CheckInsTableCreateCompanionBuilder,
          $$CheckInsTableUpdateCompanionBuilder,
          (CheckIn, $$CheckInsTableReferences),
          CheckIn,
          PrefetchHooks Function({
            bool checkInPhotosRefs,
            bool checkInColorsRefs,
            bool checkInWorkoutTagsRefs,
          })
        > {
  $$CheckInsTableTableManager(_$AppDatabase db, $CheckInsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<String?> thoughts = const Value.absent(),
                Value<String?> workout = const Value.absent(),
              }) => CheckInsCompanion(
                id: id,
                date: date,
                weight: weight,
                height: height,
                thoughts: thoughts,
                workout: workout,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<double?> weight = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<String?> thoughts = const Value.absent(),
                Value<String?> workout = const Value.absent(),
              }) => CheckInsCompanion.insert(
                id: id,
                date: date,
                weight: weight,
                height: height,
                thoughts: thoughts,
                workout: workout,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CheckInsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                checkInPhotosRefs = false,
                checkInColorsRefs = false,
                checkInWorkoutTagsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (checkInPhotosRefs) db.checkInPhotos,
                    if (checkInColorsRefs) db.checkInColors,
                    if (checkInWorkoutTagsRefs) db.checkInWorkoutTags,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (checkInPhotosRefs)
                        await $_getPrefetchedData<
                          CheckIn,
                          $CheckInsTable,
                          CheckInPhoto
                        >(
                          currentTable: table,
                          referencedTable: $$CheckInsTableReferences
                              ._checkInPhotosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CheckInsTableReferences(
                                db,
                                table,
                                p0,
                              ).checkInPhotosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.checkInId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (checkInColorsRefs)
                        await $_getPrefetchedData<
                          CheckIn,
                          $CheckInsTable,
                          CheckInColor
                        >(
                          currentTable: table,
                          referencedTable: $$CheckInsTableReferences
                              ._checkInColorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CheckInsTableReferences(
                                db,
                                table,
                                p0,
                              ).checkInColorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.checkInId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (checkInWorkoutTagsRefs)
                        await $_getPrefetchedData<
                          CheckIn,
                          $CheckInsTable,
                          CheckInWorkoutTag
                        >(
                          currentTable: table,
                          referencedTable: $$CheckInsTableReferences
                              ._checkInWorkoutTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CheckInsTableReferences(
                                db,
                                table,
                                p0,
                              ).checkInWorkoutTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.checkInId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CheckInsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInsTable,
      CheckIn,
      $$CheckInsTableFilterComposer,
      $$CheckInsTableOrderingComposer,
      $$CheckInsTableAnnotationComposer,
      $$CheckInsTableCreateCompanionBuilder,
      $$CheckInsTableUpdateCompanionBuilder,
      (CheckIn, $$CheckInsTableReferences),
      CheckIn,
      PrefetchHooks Function({
        bool checkInPhotosRefs,
        bool checkInColorsRefs,
        bool checkInWorkoutTagsRefs,
      })
    >;
typedef $$CheckInPhotosTableCreateCompanionBuilder =
    CheckInPhotosCompanion Function({
      Value<int> id,
      required int checkInId,
      required String photoPath,
      Value<bool> nsfw,
      required DateTime capturedAt,
    });
typedef $$CheckInPhotosTableUpdateCompanionBuilder =
    CheckInPhotosCompanion Function({
      Value<int> id,
      Value<int> checkInId,
      Value<String> photoPath,
      Value<bool> nsfw,
      Value<DateTime> capturedAt,
    });

final class $$CheckInPhotosTableReferences
    extends BaseReferences<_$AppDatabase, $CheckInPhotosTable, CheckInPhoto> {
  $$CheckInPhotosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CheckInsTable _checkInIdTable(_$AppDatabase db) =>
      db.checkIns.createAlias(
        $_aliasNameGenerator(db.checkInPhotos.checkInId, db.checkIns.id),
      );

  $$CheckInsTableProcessedTableManager get checkInId {
    final $_column = $_itemColumn<int>('check_in_id')!;

    final manager = $$CheckInsTableTableManager(
      $_db,
      $_db.checkIns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_checkInIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CheckInPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInPhotosTable> {
  $$CheckInPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get nsfw => $composableBuilder(
    column: $table.nsfw,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CheckInsTableFilterComposer get checkInId {
    final $$CheckInsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableFilterComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInPhotosTable> {
  $$CheckInPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get nsfw => $composableBuilder(
    column: $table.nsfw,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CheckInsTableOrderingComposer get checkInId {
    final $$CheckInsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableOrderingComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInPhotosTable> {
  $$CheckInPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<bool> get nsfw =>
      $composableBuilder(column: $table.nsfw, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => column,
  );

  $$CheckInsTableAnnotationComposer get checkInId {
    final $$CheckInsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableAnnotationComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInPhotosTable,
          CheckInPhoto,
          $$CheckInPhotosTableFilterComposer,
          $$CheckInPhotosTableOrderingComposer,
          $$CheckInPhotosTableAnnotationComposer,
          $$CheckInPhotosTableCreateCompanionBuilder,
          $$CheckInPhotosTableUpdateCompanionBuilder,
          (CheckInPhoto, $$CheckInPhotosTableReferences),
          CheckInPhoto,
          PrefetchHooks Function({bool checkInId})
        > {
  $$CheckInPhotosTableTableManager(_$AppDatabase db, $CheckInPhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> checkInId = const Value.absent(),
                Value<String> photoPath = const Value.absent(),
                Value<bool> nsfw = const Value.absent(),
                Value<DateTime> capturedAt = const Value.absent(),
              }) => CheckInPhotosCompanion(
                id: id,
                checkInId: checkInId,
                photoPath: photoPath,
                nsfw: nsfw,
                capturedAt: capturedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int checkInId,
                required String photoPath,
                Value<bool> nsfw = const Value.absent(),
                required DateTime capturedAt,
              }) => CheckInPhotosCompanion.insert(
                id: id,
                checkInId: checkInId,
                photoPath: photoPath,
                nsfw: nsfw,
                capturedAt: capturedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CheckInPhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({checkInId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (checkInId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.checkInId,
                                referencedTable: $$CheckInPhotosTableReferences
                                    ._checkInIdTable(db),
                                referencedColumn: $$CheckInPhotosTableReferences
                                    ._checkInIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CheckInPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInPhotosTable,
      CheckInPhoto,
      $$CheckInPhotosTableFilterComposer,
      $$CheckInPhotosTableOrderingComposer,
      $$CheckInPhotosTableAnnotationComposer,
      $$CheckInPhotosTableCreateCompanionBuilder,
      $$CheckInPhotosTableUpdateCompanionBuilder,
      (CheckInPhoto, $$CheckInPhotosTableReferences),
      CheckInPhoto,
      PrefetchHooks Function({bool checkInId})
    >;
typedef $$CheckInColorsTableCreateCompanionBuilder =
    CheckInColorsCompanion Function({
      Value<int> id,
      required int checkInId,
      required String timestamp,
      required String colorHex,
      Value<String?> message,
      Value<bool> immutable,
    });
typedef $$CheckInColorsTableUpdateCompanionBuilder =
    CheckInColorsCompanion Function({
      Value<int> id,
      Value<int> checkInId,
      Value<String> timestamp,
      Value<String> colorHex,
      Value<String?> message,
      Value<bool> immutable,
    });

final class $$CheckInColorsTableReferences
    extends BaseReferences<_$AppDatabase, $CheckInColorsTable, CheckInColor> {
  $$CheckInColorsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CheckInsTable _checkInIdTable(_$AppDatabase db) =>
      db.checkIns.createAlias(
        $_aliasNameGenerator(db.checkInColors.checkInId, db.checkIns.id),
      );

  $$CheckInsTableProcessedTableManager get checkInId {
    final $_column = $_itemColumn<int>('check_in_id')!;

    final manager = $$CheckInsTableTableManager(
      $_db,
      $_db.checkIns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_checkInIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CheckInColorsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInColorsTable> {
  $$CheckInColorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get immutable => $composableBuilder(
    column: $table.immutable,
    builder: (column) => ColumnFilters(column),
  );

  $$CheckInsTableFilterComposer get checkInId {
    final $$CheckInsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableFilterComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInColorsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInColorsTable> {
  $$CheckInColorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get immutable => $composableBuilder(
    column: $table.immutable,
    builder: (column) => ColumnOrderings(column),
  );

  $$CheckInsTableOrderingComposer get checkInId {
    final $$CheckInsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableOrderingComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInColorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInColorsTable> {
  $$CheckInColorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<bool> get immutable =>
      $composableBuilder(column: $table.immutable, builder: (column) => column);

  $$CheckInsTableAnnotationComposer get checkInId {
    final $$CheckInsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableAnnotationComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInColorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInColorsTable,
          CheckInColor,
          $$CheckInColorsTableFilterComposer,
          $$CheckInColorsTableOrderingComposer,
          $$CheckInColorsTableAnnotationComposer,
          $$CheckInColorsTableCreateCompanionBuilder,
          $$CheckInColorsTableUpdateCompanionBuilder,
          (CheckInColor, $$CheckInColorsTableReferences),
          CheckInColor,
          PrefetchHooks Function({bool checkInId})
        > {
  $$CheckInColorsTableTableManager(_$AppDatabase db, $CheckInColorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInColorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInColorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInColorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> checkInId = const Value.absent(),
                Value<String> timestamp = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<bool> immutable = const Value.absent(),
              }) => CheckInColorsCompanion(
                id: id,
                checkInId: checkInId,
                timestamp: timestamp,
                colorHex: colorHex,
                message: message,
                immutable: immutable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int checkInId,
                required String timestamp,
                required String colorHex,
                Value<String?> message = const Value.absent(),
                Value<bool> immutable = const Value.absent(),
              }) => CheckInColorsCompanion.insert(
                id: id,
                checkInId: checkInId,
                timestamp: timestamp,
                colorHex: colorHex,
                message: message,
                immutable: immutable,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CheckInColorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({checkInId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (checkInId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.checkInId,
                                referencedTable: $$CheckInColorsTableReferences
                                    ._checkInIdTable(db),
                                referencedColumn: $$CheckInColorsTableReferences
                                    ._checkInIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CheckInColorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInColorsTable,
      CheckInColor,
      $$CheckInColorsTableFilterComposer,
      $$CheckInColorsTableOrderingComposer,
      $$CheckInColorsTableAnnotationComposer,
      $$CheckInColorsTableCreateCompanionBuilder,
      $$CheckInColorsTableUpdateCompanionBuilder,
      (CheckInColor, $$CheckInColorsTableReferences),
      CheckInColor,
      PrefetchHooks Function({bool checkInId})
    >;
typedef $$WorkoutTagsTableCreateCompanionBuilder =
    WorkoutTagsCompanion Function({Value<int> id, required String name});
typedef $$WorkoutTagsTableUpdateCompanionBuilder =
    WorkoutTagsCompanion Function({Value<int> id, Value<String> name});

final class $$WorkoutTagsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutTagsTable, WorkoutTag> {
  $$WorkoutTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CheckInWorkoutTagsTable, List<CheckInWorkoutTag>>
  _checkInWorkoutTagsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.checkInWorkoutTags,
        aliasName: $_aliasNameGenerator(
          db.workoutTags.id,
          db.checkInWorkoutTags.tagId,
        ),
      );

  $$CheckInWorkoutTagsTableProcessedTableManager get checkInWorkoutTagsRefs {
    final manager = $$CheckInWorkoutTagsTableTableManager(
      $_db,
      $_db.checkInWorkoutTags,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _checkInWorkoutTagsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutTagsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTagsTable> {
  $$WorkoutTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> checkInWorkoutTagsRefs(
    Expression<bool> Function($$CheckInWorkoutTagsTableFilterComposer f) f,
  ) {
    final $$CheckInWorkoutTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkInWorkoutTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInWorkoutTagsTableFilterComposer(
            $db: $db,
            $table: $db.checkInWorkoutTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTagsTable> {
  $$WorkoutTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTagsTable> {
  $$WorkoutTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> checkInWorkoutTagsRefs<T extends Object>(
    Expression<T> Function($$CheckInWorkoutTagsTableAnnotationComposer a) f,
  ) {
    final $$CheckInWorkoutTagsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.checkInWorkoutTags,
          getReferencedColumn: (t) => t.tagId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CheckInWorkoutTagsTableAnnotationComposer(
                $db: $db,
                $table: $db.checkInWorkoutTags,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WorkoutTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTagsTable,
          WorkoutTag,
          $$WorkoutTagsTableFilterComposer,
          $$WorkoutTagsTableOrderingComposer,
          $$WorkoutTagsTableAnnotationComposer,
          $$WorkoutTagsTableCreateCompanionBuilder,
          $$WorkoutTagsTableUpdateCompanionBuilder,
          (WorkoutTag, $$WorkoutTagsTableReferences),
          WorkoutTag,
          PrefetchHooks Function({bool checkInWorkoutTagsRefs})
        > {
  $$WorkoutTagsTableTableManager(_$AppDatabase db, $WorkoutTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => WorkoutTagsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  WorkoutTagsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({checkInWorkoutTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (checkInWorkoutTagsRefs) db.checkInWorkoutTags,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (checkInWorkoutTagsRefs)
                    await $_getPrefetchedData<
                      WorkoutTag,
                      $WorkoutTagsTable,
                      CheckInWorkoutTag
                    >(
                      currentTable: table,
                      referencedTable: $$WorkoutTagsTableReferences
                          ._checkInWorkoutTagsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorkoutTagsTableReferences(
                            db,
                            table,
                            p0,
                          ).checkInWorkoutTagsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTagsTable,
      WorkoutTag,
      $$WorkoutTagsTableFilterComposer,
      $$WorkoutTagsTableOrderingComposer,
      $$WorkoutTagsTableAnnotationComposer,
      $$WorkoutTagsTableCreateCompanionBuilder,
      $$WorkoutTagsTableUpdateCompanionBuilder,
      (WorkoutTag, $$WorkoutTagsTableReferences),
      WorkoutTag,
      PrefetchHooks Function({bool checkInWorkoutTagsRefs})
    >;
typedef $$CheckInWorkoutTagsTableCreateCompanionBuilder =
    CheckInWorkoutTagsCompanion Function({
      required int checkInId,
      required int tagId,
      Value<int> rowid,
    });
typedef $$CheckInWorkoutTagsTableUpdateCompanionBuilder =
    CheckInWorkoutTagsCompanion Function({
      Value<int> checkInId,
      Value<int> tagId,
      Value<int> rowid,
    });

final class $$CheckInWorkoutTagsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CheckInWorkoutTagsTable,
          CheckInWorkoutTag
        > {
  $$CheckInWorkoutTagsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CheckInsTable _checkInIdTable(_$AppDatabase db) =>
      db.checkIns.createAlias(
        $_aliasNameGenerator(db.checkInWorkoutTags.checkInId, db.checkIns.id),
      );

  $$CheckInsTableProcessedTableManager get checkInId {
    final $_column = $_itemColumn<int>('check_in_id')!;

    final manager = $$CheckInsTableTableManager(
      $_db,
      $_db.checkIns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_checkInIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkoutTagsTable _tagIdTable(_$AppDatabase db) =>
      db.workoutTags.createAlias(
        $_aliasNameGenerator(db.checkInWorkoutTags.tagId, db.workoutTags.id),
      );

  $$WorkoutTagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$WorkoutTagsTableTableManager(
      $_db,
      $_db.workoutTags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CheckInWorkoutTagsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInWorkoutTagsTable> {
  $$CheckInWorkoutTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CheckInsTableFilterComposer get checkInId {
    final $$CheckInsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableFilterComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTagsTableFilterComposer get tagId {
    final $$WorkoutTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.workoutTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTagsTableFilterComposer(
            $db: $db,
            $table: $db.workoutTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInWorkoutTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInWorkoutTagsTable> {
  $$CheckInWorkoutTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CheckInsTableOrderingComposer get checkInId {
    final $$CheckInsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableOrderingComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTagsTableOrderingComposer get tagId {
    final $$WorkoutTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.workoutTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTagsTableOrderingComposer(
            $db: $db,
            $table: $db.workoutTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInWorkoutTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInWorkoutTagsTable> {
  $$CheckInWorkoutTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CheckInsTableAnnotationComposer get checkInId {
    final $$CheckInsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checkInId,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableAnnotationComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTagsTableAnnotationComposer get tagId {
    final $$WorkoutTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.workoutTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInWorkoutTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInWorkoutTagsTable,
          CheckInWorkoutTag,
          $$CheckInWorkoutTagsTableFilterComposer,
          $$CheckInWorkoutTagsTableOrderingComposer,
          $$CheckInWorkoutTagsTableAnnotationComposer,
          $$CheckInWorkoutTagsTableCreateCompanionBuilder,
          $$CheckInWorkoutTagsTableUpdateCompanionBuilder,
          (CheckInWorkoutTag, $$CheckInWorkoutTagsTableReferences),
          CheckInWorkoutTag,
          PrefetchHooks Function({bool checkInId, bool tagId})
        > {
  $$CheckInWorkoutTagsTableTableManager(
    _$AppDatabase db,
    $CheckInWorkoutTagsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInWorkoutTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInWorkoutTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInWorkoutTagsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> checkInId = const Value.absent(),
                Value<int> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CheckInWorkoutTagsCompanion(
                checkInId: checkInId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int checkInId,
                required int tagId,
                Value<int> rowid = const Value.absent(),
              }) => CheckInWorkoutTagsCompanion.insert(
                checkInId: checkInId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CheckInWorkoutTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({checkInId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (checkInId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.checkInId,
                                referencedTable:
                                    $$CheckInWorkoutTagsTableReferences
                                        ._checkInIdTable(db),
                                referencedColumn:
                                    $$CheckInWorkoutTagsTableReferences
                                        ._checkInIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable:
                                    $$CheckInWorkoutTagsTableReferences
                                        ._tagIdTable(db),
                                referencedColumn:
                                    $$CheckInWorkoutTagsTableReferences
                                        ._tagIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CheckInWorkoutTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInWorkoutTagsTable,
      CheckInWorkoutTag,
      $$CheckInWorkoutTagsTableFilterComposer,
      $$CheckInWorkoutTagsTableOrderingComposer,
      $$CheckInWorkoutTagsTableAnnotationComposer,
      $$CheckInWorkoutTagsTableCreateCompanionBuilder,
      $$CheckInWorkoutTagsTableUpdateCompanionBuilder,
      (CheckInWorkoutTag, $$CheckInWorkoutTagsTableReferences),
      CheckInWorkoutTag,
      PrefetchHooks Function({bool checkInId, bool tagId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CheckInsTableTableManager get checkIns =>
      $$CheckInsTableTableManager(_db, _db.checkIns);
  $$CheckInPhotosTableTableManager get checkInPhotos =>
      $$CheckInPhotosTableTableManager(_db, _db.checkInPhotos);
  $$CheckInColorsTableTableManager get checkInColors =>
      $$CheckInColorsTableTableManager(_db, _db.checkInColors);
  $$WorkoutTagsTableTableManager get workoutTags =>
      $$WorkoutTagsTableTableManager(_db, _db.workoutTags);
  $$CheckInWorkoutTagsTableTableManager get checkInWorkoutTags =>
      $$CheckInWorkoutTagsTableTableManager(_db, _db.checkInWorkoutTags);
}
