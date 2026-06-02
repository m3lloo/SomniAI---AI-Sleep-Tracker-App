// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SleepSessionsTable extends SleepSessions
    with TableInfo<$SleepSessionsTable, SleepSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SleepSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sleepTimeMeta =
      const VerificationMeta('sleepTime');
  @override
  late final GeneratedColumn<DateTime> sleepTime = GeneratedColumn<DateTime>(
      'sleep_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _wakeTimeMeta =
      const VerificationMeta('wakeTime');
  @override
  late final GeneratedColumn<DateTime> wakeTime = GeneratedColumn<DateTime>(
      'wake_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sleepScoreMeta =
      const VerificationMeta('sleepScore');
  @override
  late final GeneratedColumn<int> sleepScore = GeneratedColumn<int>(
      'sleep_score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _interruptionsMeta =
      const VerificationMeta('interruptions');
  @override
  late final GeneratedColumn<int> interruptions = GeneratedColumn<int>(
      'interruptions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _movementScoreMeta =
      const VerificationMeta('movementScore');
  @override
  late final GeneratedColumn<double> movementScore = GeneratedColumn<double>(
      'movement_score', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _durationHoursMeta =
      const VerificationMeta('durationHours');
  @override
  late final GeneratedColumn<double> durationHours = GeneratedColumn<double>(
      'duration_hours', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _estimatedLightSleepMeta =
      const VerificationMeta('estimatedLightSleep');
  @override
  late final GeneratedColumn<int> estimatedLightSleep = GeneratedColumn<int>(
      'estimated_light_sleep', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _estimatedDeepSleepMeta =
      const VerificationMeta('estimatedDeepSleep');
  @override
  late final GeneratedColumn<int> estimatedDeepSleep = GeneratedColumn<int>(
      'estimated_deep_sleep', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _estimatedRemSleepMeta =
      const VerificationMeta('estimatedRemSleep');
  @override
  late final GeneratedColumn<int> estimatedRemSleep = GeneratedColumn<int>(
      'estimated_rem_sleep', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _estimatedAwakeTimeMeta =
      const VerificationMeta('estimatedAwakeTime');
  @override
  late final GeneratedColumn<int> estimatedAwakeTime = GeneratedColumn<int>(
      'estimated_awake_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _snoreDetectedMeta =
      const VerificationMeta('snoreDetected');
  @override
  late final GeneratedColumn<bool> snoreDetected = GeneratedColumn<bool>(
      'snore_detected', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("snore_detected" IN (0, 1))'));
  static const VerificationMeta _snoreEventCountMeta =
      const VerificationMeta('snoreEventCount');
  @override
  late final GeneratedColumn<int> snoreEventCount = GeneratedColumn<int>(
      'snore_event_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _avgNoiseLevelMeta =
      const VerificationMeta('avgNoiseLevel');
  @override
  late final GeneratedColumn<double> avgNoiseLevel = GeneratedColumn<double>(
      'avg_noise_level', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _metSleepGoalMeta =
      const VerificationMeta('metSleepGoal');
  @override
  late final GeneratedColumn<bool> metSleepGoal = GeneratedColumn<bool>(
      'met_sleep_goal', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("met_sleep_goal" IN (0, 1))'));
  static const VerificationMeta _consistencyScoreMeta =
      const VerificationMeta('consistencyScore');
  @override
  late final GeneratedColumn<int> consistencyScore = GeneratedColumn<int>(
      'consistency_score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sleepTime,
        wakeTime,
        sleepScore,
        interruptions,
        movementScore,
        durationHours,
        estimatedLightSleep,
        estimatedDeepSleep,
        estimatedRemSleep,
        estimatedAwakeTime,
        snoreDetected,
        snoreEventCount,
        avgNoiseLevel,
        metSleepGoal,
        consistencyScore,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sleep_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<SleepSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sleep_time')) {
      context.handle(_sleepTimeMeta,
          sleepTime.isAcceptableOrUnknown(data['sleep_time']!, _sleepTimeMeta));
    } else if (isInserting) {
      context.missing(_sleepTimeMeta);
    }
    if (data.containsKey('wake_time')) {
      context.handle(_wakeTimeMeta,
          wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta));
    } else if (isInserting) {
      context.missing(_wakeTimeMeta);
    }
    if (data.containsKey('sleep_score')) {
      context.handle(
          _sleepScoreMeta,
          sleepScore.isAcceptableOrUnknown(
              data['sleep_score']!, _sleepScoreMeta));
    } else if (isInserting) {
      context.missing(_sleepScoreMeta);
    }
    if (data.containsKey('interruptions')) {
      context.handle(
          _interruptionsMeta,
          interruptions.isAcceptableOrUnknown(
              data['interruptions']!, _interruptionsMeta));
    } else if (isInserting) {
      context.missing(_interruptionsMeta);
    }
    if (data.containsKey('movement_score')) {
      context.handle(
          _movementScoreMeta,
          movementScore.isAcceptableOrUnknown(
              data['movement_score']!, _movementScoreMeta));
    } else if (isInserting) {
      context.missing(_movementScoreMeta);
    }
    if (data.containsKey('duration_hours')) {
      context.handle(
          _durationHoursMeta,
          durationHours.isAcceptableOrUnknown(
              data['duration_hours']!, _durationHoursMeta));
    } else if (isInserting) {
      context.missing(_durationHoursMeta);
    }
    if (data.containsKey('estimated_light_sleep')) {
      context.handle(
          _estimatedLightSleepMeta,
          estimatedLightSleep.isAcceptableOrUnknown(
              data['estimated_light_sleep']!, _estimatedLightSleepMeta));
    } else if (isInserting) {
      context.missing(_estimatedLightSleepMeta);
    }
    if (data.containsKey('estimated_deep_sleep')) {
      context.handle(
          _estimatedDeepSleepMeta,
          estimatedDeepSleep.isAcceptableOrUnknown(
              data['estimated_deep_sleep']!, _estimatedDeepSleepMeta));
    } else if (isInserting) {
      context.missing(_estimatedDeepSleepMeta);
    }
    if (data.containsKey('estimated_rem_sleep')) {
      context.handle(
          _estimatedRemSleepMeta,
          estimatedRemSleep.isAcceptableOrUnknown(
              data['estimated_rem_sleep']!, _estimatedRemSleepMeta));
    } else if (isInserting) {
      context.missing(_estimatedRemSleepMeta);
    }
    if (data.containsKey('estimated_awake_time')) {
      context.handle(
          _estimatedAwakeTimeMeta,
          estimatedAwakeTime.isAcceptableOrUnknown(
              data['estimated_awake_time']!, _estimatedAwakeTimeMeta));
    } else if (isInserting) {
      context.missing(_estimatedAwakeTimeMeta);
    }
    if (data.containsKey('snore_detected')) {
      context.handle(
          _snoreDetectedMeta,
          snoreDetected.isAcceptableOrUnknown(
              data['snore_detected']!, _snoreDetectedMeta));
    } else if (isInserting) {
      context.missing(_snoreDetectedMeta);
    }
    if (data.containsKey('snore_event_count')) {
      context.handle(
          _snoreEventCountMeta,
          snoreEventCount.isAcceptableOrUnknown(
              data['snore_event_count']!, _snoreEventCountMeta));
    } else if (isInserting) {
      context.missing(_snoreEventCountMeta);
    }
    if (data.containsKey('avg_noise_level')) {
      context.handle(
          _avgNoiseLevelMeta,
          avgNoiseLevel.isAcceptableOrUnknown(
              data['avg_noise_level']!, _avgNoiseLevelMeta));
    } else if (isInserting) {
      context.missing(_avgNoiseLevelMeta);
    }
    if (data.containsKey('met_sleep_goal')) {
      context.handle(
          _metSleepGoalMeta,
          metSleepGoal.isAcceptableOrUnknown(
              data['met_sleep_goal']!, _metSleepGoalMeta));
    } else if (isInserting) {
      context.missing(_metSleepGoalMeta);
    }
    if (data.containsKey('consistency_score')) {
      context.handle(
          _consistencyScoreMeta,
          consistencyScore.isAcceptableOrUnknown(
              data['consistency_score']!, _consistencyScoreMeta));
    } else if (isInserting) {
      context.missing(_consistencyScoreMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SleepSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SleepSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sleepTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sleep_time'])!,
      wakeTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}wake_time'])!,
      sleepScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_score'])!,
      interruptions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interruptions'])!,
      movementScore: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}movement_score'])!,
      durationHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}duration_hours'])!,
      estimatedLightSleep: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_light_sleep'])!,
      estimatedDeepSleep: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_deep_sleep'])!,
      estimatedRemSleep: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_rem_sleep'])!,
      estimatedAwakeTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_awake_time'])!,
      snoreDetected: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}snore_detected'])!,
      snoreEventCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}snore_event_count'])!,
      avgNoiseLevel: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}avg_noise_level'])!,
      metSleepGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}met_sleep_goal'])!,
      consistencyScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}consistency_score'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $SleepSessionsTable createAlias(String alias) {
    return $SleepSessionsTable(attachedDatabase, alias);
  }
}

class SleepSession extends DataClass implements Insertable<SleepSession> {
  final int id;
  final DateTime sleepTime;
  final DateTime wakeTime;
  final int sleepScore;
  final int interruptions;
  final double movementScore;
  final double durationHours;
  final int estimatedLightSleep;
  final int estimatedDeepSleep;
  final int estimatedRemSleep;
  final int estimatedAwakeTime;
  final bool snoreDetected;
  final int snoreEventCount;
  final double avgNoiseLevel;
  final bool metSleepGoal;
  final int consistencyScore;
  final String? notes;
  const SleepSession(
      {required this.id,
      required this.sleepTime,
      required this.wakeTime,
      required this.sleepScore,
      required this.interruptions,
      required this.movementScore,
      required this.durationHours,
      required this.estimatedLightSleep,
      required this.estimatedDeepSleep,
      required this.estimatedRemSleep,
      required this.estimatedAwakeTime,
      required this.snoreDetected,
      required this.snoreEventCount,
      required this.avgNoiseLevel,
      required this.metSleepGoal,
      required this.consistencyScore,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sleep_time'] = Variable<DateTime>(sleepTime);
    map['wake_time'] = Variable<DateTime>(wakeTime);
    map['sleep_score'] = Variable<int>(sleepScore);
    map['interruptions'] = Variable<int>(interruptions);
    map['movement_score'] = Variable<double>(movementScore);
    map['duration_hours'] = Variable<double>(durationHours);
    map['estimated_light_sleep'] = Variable<int>(estimatedLightSleep);
    map['estimated_deep_sleep'] = Variable<int>(estimatedDeepSleep);
    map['estimated_rem_sleep'] = Variable<int>(estimatedRemSleep);
    map['estimated_awake_time'] = Variable<int>(estimatedAwakeTime);
    map['snore_detected'] = Variable<bool>(snoreDetected);
    map['snore_event_count'] = Variable<int>(snoreEventCount);
    map['avg_noise_level'] = Variable<double>(avgNoiseLevel);
    map['met_sleep_goal'] = Variable<bool>(metSleepGoal);
    map['consistency_score'] = Variable<int>(consistencyScore);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SleepSessionsCompanion toCompanion(bool nullToAbsent) {
    return SleepSessionsCompanion(
      id: Value(id),
      sleepTime: Value(sleepTime),
      wakeTime: Value(wakeTime),
      sleepScore: Value(sleepScore),
      interruptions: Value(interruptions),
      movementScore: Value(movementScore),
      durationHours: Value(durationHours),
      estimatedLightSleep: Value(estimatedLightSleep),
      estimatedDeepSleep: Value(estimatedDeepSleep),
      estimatedRemSleep: Value(estimatedRemSleep),
      estimatedAwakeTime: Value(estimatedAwakeTime),
      snoreDetected: Value(snoreDetected),
      snoreEventCount: Value(snoreEventCount),
      avgNoiseLevel: Value(avgNoiseLevel),
      metSleepGoal: Value(metSleepGoal),
      consistencyScore: Value(consistencyScore),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory SleepSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SleepSession(
      id: serializer.fromJson<int>(json['id']),
      sleepTime: serializer.fromJson<DateTime>(json['sleepTime']),
      wakeTime: serializer.fromJson<DateTime>(json['wakeTime']),
      sleepScore: serializer.fromJson<int>(json['sleepScore']),
      interruptions: serializer.fromJson<int>(json['interruptions']),
      movementScore: serializer.fromJson<double>(json['movementScore']),
      durationHours: serializer.fromJson<double>(json['durationHours']),
      estimatedLightSleep:
          serializer.fromJson<int>(json['estimatedLightSleep']),
      estimatedDeepSleep: serializer.fromJson<int>(json['estimatedDeepSleep']),
      estimatedRemSleep: serializer.fromJson<int>(json['estimatedRemSleep']),
      estimatedAwakeTime: serializer.fromJson<int>(json['estimatedAwakeTime']),
      snoreDetected: serializer.fromJson<bool>(json['snoreDetected']),
      snoreEventCount: serializer.fromJson<int>(json['snoreEventCount']),
      avgNoiseLevel: serializer.fromJson<double>(json['avgNoiseLevel']),
      metSleepGoal: serializer.fromJson<bool>(json['metSleepGoal']),
      consistencyScore: serializer.fromJson<int>(json['consistencyScore']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sleepTime': serializer.toJson<DateTime>(sleepTime),
      'wakeTime': serializer.toJson<DateTime>(wakeTime),
      'sleepScore': serializer.toJson<int>(sleepScore),
      'interruptions': serializer.toJson<int>(interruptions),
      'movementScore': serializer.toJson<double>(movementScore),
      'durationHours': serializer.toJson<double>(durationHours),
      'estimatedLightSleep': serializer.toJson<int>(estimatedLightSleep),
      'estimatedDeepSleep': serializer.toJson<int>(estimatedDeepSleep),
      'estimatedRemSleep': serializer.toJson<int>(estimatedRemSleep),
      'estimatedAwakeTime': serializer.toJson<int>(estimatedAwakeTime),
      'snoreDetected': serializer.toJson<bool>(snoreDetected),
      'snoreEventCount': serializer.toJson<int>(snoreEventCount),
      'avgNoiseLevel': serializer.toJson<double>(avgNoiseLevel),
      'metSleepGoal': serializer.toJson<bool>(metSleepGoal),
      'consistencyScore': serializer.toJson<int>(consistencyScore),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SleepSession copyWith(
          {int? id,
          DateTime? sleepTime,
          DateTime? wakeTime,
          int? sleepScore,
          int? interruptions,
          double? movementScore,
          double? durationHours,
          int? estimatedLightSleep,
          int? estimatedDeepSleep,
          int? estimatedRemSleep,
          int? estimatedAwakeTime,
          bool? snoreDetected,
          int? snoreEventCount,
          double? avgNoiseLevel,
          bool? metSleepGoal,
          int? consistencyScore,
          Value<String?> notes = const Value.absent()}) =>
      SleepSession(
        id: id ?? this.id,
        sleepTime: sleepTime ?? this.sleepTime,
        wakeTime: wakeTime ?? this.wakeTime,
        sleepScore: sleepScore ?? this.sleepScore,
        interruptions: interruptions ?? this.interruptions,
        movementScore: movementScore ?? this.movementScore,
        durationHours: durationHours ?? this.durationHours,
        estimatedLightSleep: estimatedLightSleep ?? this.estimatedLightSleep,
        estimatedDeepSleep: estimatedDeepSleep ?? this.estimatedDeepSleep,
        estimatedRemSleep: estimatedRemSleep ?? this.estimatedRemSleep,
        estimatedAwakeTime: estimatedAwakeTime ?? this.estimatedAwakeTime,
        snoreDetected: snoreDetected ?? this.snoreDetected,
        snoreEventCount: snoreEventCount ?? this.snoreEventCount,
        avgNoiseLevel: avgNoiseLevel ?? this.avgNoiseLevel,
        metSleepGoal: metSleepGoal ?? this.metSleepGoal,
        consistencyScore: consistencyScore ?? this.consistencyScore,
        notes: notes.present ? notes.value : this.notes,
      );
  SleepSession copyWithCompanion(SleepSessionsCompanion data) {
    return SleepSession(
      id: data.id.present ? data.id.value : this.id,
      sleepTime: data.sleepTime.present ? data.sleepTime.value : this.sleepTime,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      sleepScore:
          data.sleepScore.present ? data.sleepScore.value : this.sleepScore,
      interruptions: data.interruptions.present
          ? data.interruptions.value
          : this.interruptions,
      movementScore: data.movementScore.present
          ? data.movementScore.value
          : this.movementScore,
      durationHours: data.durationHours.present
          ? data.durationHours.value
          : this.durationHours,
      estimatedLightSleep: data.estimatedLightSleep.present
          ? data.estimatedLightSleep.value
          : this.estimatedLightSleep,
      estimatedDeepSleep: data.estimatedDeepSleep.present
          ? data.estimatedDeepSleep.value
          : this.estimatedDeepSleep,
      estimatedRemSleep: data.estimatedRemSleep.present
          ? data.estimatedRemSleep.value
          : this.estimatedRemSleep,
      estimatedAwakeTime: data.estimatedAwakeTime.present
          ? data.estimatedAwakeTime.value
          : this.estimatedAwakeTime,
      snoreDetected: data.snoreDetected.present
          ? data.snoreDetected.value
          : this.snoreDetected,
      snoreEventCount: data.snoreEventCount.present
          ? data.snoreEventCount.value
          : this.snoreEventCount,
      avgNoiseLevel: data.avgNoiseLevel.present
          ? data.avgNoiseLevel.value
          : this.avgNoiseLevel,
      metSleepGoal: data.metSleepGoal.present
          ? data.metSleepGoal.value
          : this.metSleepGoal,
      consistencyScore: data.consistencyScore.present
          ? data.consistencyScore.value
          : this.consistencyScore,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SleepSession(')
          ..write('id: $id, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepScore: $sleepScore, ')
          ..write('interruptions: $interruptions, ')
          ..write('movementScore: $movementScore, ')
          ..write('durationHours: $durationHours, ')
          ..write('estimatedLightSleep: $estimatedLightSleep, ')
          ..write('estimatedDeepSleep: $estimatedDeepSleep, ')
          ..write('estimatedRemSleep: $estimatedRemSleep, ')
          ..write('estimatedAwakeTime: $estimatedAwakeTime, ')
          ..write('snoreDetected: $snoreDetected, ')
          ..write('snoreEventCount: $snoreEventCount, ')
          ..write('avgNoiseLevel: $avgNoiseLevel, ')
          ..write('metSleepGoal: $metSleepGoal, ')
          ..write('consistencyScore: $consistencyScore, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sleepTime,
      wakeTime,
      sleepScore,
      interruptions,
      movementScore,
      durationHours,
      estimatedLightSleep,
      estimatedDeepSleep,
      estimatedRemSleep,
      estimatedAwakeTime,
      snoreDetected,
      snoreEventCount,
      avgNoiseLevel,
      metSleepGoal,
      consistencyScore,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SleepSession &&
          other.id == this.id &&
          other.sleepTime == this.sleepTime &&
          other.wakeTime == this.wakeTime &&
          other.sleepScore == this.sleepScore &&
          other.interruptions == this.interruptions &&
          other.movementScore == this.movementScore &&
          other.durationHours == this.durationHours &&
          other.estimatedLightSleep == this.estimatedLightSleep &&
          other.estimatedDeepSleep == this.estimatedDeepSleep &&
          other.estimatedRemSleep == this.estimatedRemSleep &&
          other.estimatedAwakeTime == this.estimatedAwakeTime &&
          other.snoreDetected == this.snoreDetected &&
          other.snoreEventCount == this.snoreEventCount &&
          other.avgNoiseLevel == this.avgNoiseLevel &&
          other.metSleepGoal == this.metSleepGoal &&
          other.consistencyScore == this.consistencyScore &&
          other.notes == this.notes);
}

class SleepSessionsCompanion extends UpdateCompanion<SleepSession> {
  final Value<int> id;
  final Value<DateTime> sleepTime;
  final Value<DateTime> wakeTime;
  final Value<int> sleepScore;
  final Value<int> interruptions;
  final Value<double> movementScore;
  final Value<double> durationHours;
  final Value<int> estimatedLightSleep;
  final Value<int> estimatedDeepSleep;
  final Value<int> estimatedRemSleep;
  final Value<int> estimatedAwakeTime;
  final Value<bool> snoreDetected;
  final Value<int> snoreEventCount;
  final Value<double> avgNoiseLevel;
  final Value<bool> metSleepGoal;
  final Value<int> consistencyScore;
  final Value<String?> notes;
  const SleepSessionsCompanion({
    this.id = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.sleepScore = const Value.absent(),
    this.interruptions = const Value.absent(),
    this.movementScore = const Value.absent(),
    this.durationHours = const Value.absent(),
    this.estimatedLightSleep = const Value.absent(),
    this.estimatedDeepSleep = const Value.absent(),
    this.estimatedRemSleep = const Value.absent(),
    this.estimatedAwakeTime = const Value.absent(),
    this.snoreDetected = const Value.absent(),
    this.snoreEventCount = const Value.absent(),
    this.avgNoiseLevel = const Value.absent(),
    this.metSleepGoal = const Value.absent(),
    this.consistencyScore = const Value.absent(),
    this.notes = const Value.absent(),
  });
  SleepSessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime sleepTime,
    required DateTime wakeTime,
    required int sleepScore,
    required int interruptions,
    required double movementScore,
    required double durationHours,
    required int estimatedLightSleep,
    required int estimatedDeepSleep,
    required int estimatedRemSleep,
    required int estimatedAwakeTime,
    required bool snoreDetected,
    required int snoreEventCount,
    required double avgNoiseLevel,
    required bool metSleepGoal,
    required int consistencyScore,
    this.notes = const Value.absent(),
  })  : sleepTime = Value(sleepTime),
        wakeTime = Value(wakeTime),
        sleepScore = Value(sleepScore),
        interruptions = Value(interruptions),
        movementScore = Value(movementScore),
        durationHours = Value(durationHours),
        estimatedLightSleep = Value(estimatedLightSleep),
        estimatedDeepSleep = Value(estimatedDeepSleep),
        estimatedRemSleep = Value(estimatedRemSleep),
        estimatedAwakeTime = Value(estimatedAwakeTime),
        snoreDetected = Value(snoreDetected),
        snoreEventCount = Value(snoreEventCount),
        avgNoiseLevel = Value(avgNoiseLevel),
        metSleepGoal = Value(metSleepGoal),
        consistencyScore = Value(consistencyScore);
  static Insertable<SleepSession> custom({
    Expression<int>? id,
    Expression<DateTime>? sleepTime,
    Expression<DateTime>? wakeTime,
    Expression<int>? sleepScore,
    Expression<int>? interruptions,
    Expression<double>? movementScore,
    Expression<double>? durationHours,
    Expression<int>? estimatedLightSleep,
    Expression<int>? estimatedDeepSleep,
    Expression<int>? estimatedRemSleep,
    Expression<int>? estimatedAwakeTime,
    Expression<bool>? snoreDetected,
    Expression<int>? snoreEventCount,
    Expression<double>? avgNoiseLevel,
    Expression<bool>? metSleepGoal,
    Expression<int>? consistencyScore,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sleepTime != null) 'sleep_time': sleepTime,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (sleepScore != null) 'sleep_score': sleepScore,
      if (interruptions != null) 'interruptions': interruptions,
      if (movementScore != null) 'movement_score': movementScore,
      if (durationHours != null) 'duration_hours': durationHours,
      if (estimatedLightSleep != null)
        'estimated_light_sleep': estimatedLightSleep,
      if (estimatedDeepSleep != null)
        'estimated_deep_sleep': estimatedDeepSleep,
      if (estimatedRemSleep != null) 'estimated_rem_sleep': estimatedRemSleep,
      if (estimatedAwakeTime != null)
        'estimated_awake_time': estimatedAwakeTime,
      if (snoreDetected != null) 'snore_detected': snoreDetected,
      if (snoreEventCount != null) 'snore_event_count': snoreEventCount,
      if (avgNoiseLevel != null) 'avg_noise_level': avgNoiseLevel,
      if (metSleepGoal != null) 'met_sleep_goal': metSleepGoal,
      if (consistencyScore != null) 'consistency_score': consistencyScore,
      if (notes != null) 'notes': notes,
    });
  }

  SleepSessionsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? sleepTime,
      Value<DateTime>? wakeTime,
      Value<int>? sleepScore,
      Value<int>? interruptions,
      Value<double>? movementScore,
      Value<double>? durationHours,
      Value<int>? estimatedLightSleep,
      Value<int>? estimatedDeepSleep,
      Value<int>? estimatedRemSleep,
      Value<int>? estimatedAwakeTime,
      Value<bool>? snoreDetected,
      Value<int>? snoreEventCount,
      Value<double>? avgNoiseLevel,
      Value<bool>? metSleepGoal,
      Value<int>? consistencyScore,
      Value<String?>? notes}) {
    return SleepSessionsCompanion(
      id: id ?? this.id,
      sleepTime: sleepTime ?? this.sleepTime,
      wakeTime: wakeTime ?? this.wakeTime,
      sleepScore: sleepScore ?? this.sleepScore,
      interruptions: interruptions ?? this.interruptions,
      movementScore: movementScore ?? this.movementScore,
      durationHours: durationHours ?? this.durationHours,
      estimatedLightSleep: estimatedLightSleep ?? this.estimatedLightSleep,
      estimatedDeepSleep: estimatedDeepSleep ?? this.estimatedDeepSleep,
      estimatedRemSleep: estimatedRemSleep ?? this.estimatedRemSleep,
      estimatedAwakeTime: estimatedAwakeTime ?? this.estimatedAwakeTime,
      snoreDetected: snoreDetected ?? this.snoreDetected,
      snoreEventCount: snoreEventCount ?? this.snoreEventCount,
      avgNoiseLevel: avgNoiseLevel ?? this.avgNoiseLevel,
      metSleepGoal: metSleepGoal ?? this.metSleepGoal,
      consistencyScore: consistencyScore ?? this.consistencyScore,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sleepTime.present) {
      map['sleep_time'] = Variable<DateTime>(sleepTime.value);
    }
    if (wakeTime.present) {
      map['wake_time'] = Variable<DateTime>(wakeTime.value);
    }
    if (sleepScore.present) {
      map['sleep_score'] = Variable<int>(sleepScore.value);
    }
    if (interruptions.present) {
      map['interruptions'] = Variable<int>(interruptions.value);
    }
    if (movementScore.present) {
      map['movement_score'] = Variable<double>(movementScore.value);
    }
    if (durationHours.present) {
      map['duration_hours'] = Variable<double>(durationHours.value);
    }
    if (estimatedLightSleep.present) {
      map['estimated_light_sleep'] = Variable<int>(estimatedLightSleep.value);
    }
    if (estimatedDeepSleep.present) {
      map['estimated_deep_sleep'] = Variable<int>(estimatedDeepSleep.value);
    }
    if (estimatedRemSleep.present) {
      map['estimated_rem_sleep'] = Variable<int>(estimatedRemSleep.value);
    }
    if (estimatedAwakeTime.present) {
      map['estimated_awake_time'] = Variable<int>(estimatedAwakeTime.value);
    }
    if (snoreDetected.present) {
      map['snore_detected'] = Variable<bool>(snoreDetected.value);
    }
    if (snoreEventCount.present) {
      map['snore_event_count'] = Variable<int>(snoreEventCount.value);
    }
    if (avgNoiseLevel.present) {
      map['avg_noise_level'] = Variable<double>(avgNoiseLevel.value);
    }
    if (metSleepGoal.present) {
      map['met_sleep_goal'] = Variable<bool>(metSleepGoal.value);
    }
    if (consistencyScore.present) {
      map['consistency_score'] = Variable<int>(consistencyScore.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SleepSessionsCompanion(')
          ..write('id: $id, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepScore: $sleepScore, ')
          ..write('interruptions: $interruptions, ')
          ..write('movementScore: $movementScore, ')
          ..write('durationHours: $durationHours, ')
          ..write('estimatedLightSleep: $estimatedLightSleep, ')
          ..write('estimatedDeepSleep: $estimatedDeepSleep, ')
          ..write('estimatedRemSleep: $estimatedRemSleep, ')
          ..write('estimatedAwakeTime: $estimatedAwakeTime, ')
          ..write('snoreDetected: $snoreDetected, ')
          ..write('snoreEventCount: $snoreEventCount, ')
          ..write('avgNoiseLevel: $avgNoiseLevel, ')
          ..write('metSleepGoal: $metSleepGoal, ')
          ..write('consistencyScore: $consistencyScore, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
      'mood', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stressLevelMeta =
      const VerificationMeta('stressLevel');
  @override
  late final GeneratedColumn<int> stressLevel = GeneratedColumn<int>(
      'stress_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _energyLevelMeta =
      const VerificationMeta('energyLevel');
  @override
  late final GeneratedColumn<int> energyLevel = GeneratedColumn<int>(
      'energy_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dreamNotesMeta =
      const VerificationMeta('dreamNotes');
  @override
  late final GeneratedColumn<String> dreamNotes = GeneratedColumn<String>(
      'dream_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _generalNotesMeta =
      const VerificationMeta('generalNotes');
  @override
  late final GeneratedColumn<String> generalNotes = GeneratedColumn<String>(
      'general_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkedSessionIdMeta =
      const VerificationMeta('linkedSessionId');
  @override
  late final GeneratedColumn<int> linkedSessionId = GeneratedColumn<int>(
      'linked_session_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        mood,
        stressLevel,
        energyLevel,
        dreamNotes,
        generalNotes,
        linkedSessionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<JournalEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    } else if (isInserting) {
      context.missing(_moodMeta);
    }
    if (data.containsKey('stress_level')) {
      context.handle(
          _stressLevelMeta,
          stressLevel.isAcceptableOrUnknown(
              data['stress_level']!, _stressLevelMeta));
    } else if (isInserting) {
      context.missing(_stressLevelMeta);
    }
    if (data.containsKey('energy_level')) {
      context.handle(
          _energyLevelMeta,
          energyLevel.isAcceptableOrUnknown(
              data['energy_level']!, _energyLevelMeta));
    } else if (isInserting) {
      context.missing(_energyLevelMeta);
    }
    if (data.containsKey('dream_notes')) {
      context.handle(
          _dreamNotesMeta,
          dreamNotes.isAcceptableOrUnknown(
              data['dream_notes']!, _dreamNotesMeta));
    }
    if (data.containsKey('general_notes')) {
      context.handle(
          _generalNotesMeta,
          generalNotes.isAcceptableOrUnknown(
              data['general_notes']!, _generalNotesMeta));
    }
    if (data.containsKey('linked_session_id')) {
      context.handle(
          _linkedSessionIdMeta,
          linkedSessionId.isAcceptableOrUnknown(
              data['linked_session_id']!, _linkedSessionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mood'])!,
      stressLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stress_level'])!,
      energyLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}energy_level'])!,
      dreamNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dream_notes']),
      generalNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}general_notes']),
      linkedSessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}linked_session_id']),
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntry extends DataClass implements Insertable<JournalEntry> {
  final int id;
  final DateTime createdAt;
  final String mood;
  final int stressLevel;
  final int energyLevel;
  final String? dreamNotes;
  final String? generalNotes;
  final int? linkedSessionId;
  const JournalEntry(
      {required this.id,
      required this.createdAt,
      required this.mood,
      required this.stressLevel,
      required this.energyLevel,
      this.dreamNotes,
      this.generalNotes,
      this.linkedSessionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['mood'] = Variable<String>(mood);
    map['stress_level'] = Variable<int>(stressLevel);
    map['energy_level'] = Variable<int>(energyLevel);
    if (!nullToAbsent || dreamNotes != null) {
      map['dream_notes'] = Variable<String>(dreamNotes);
    }
    if (!nullToAbsent || generalNotes != null) {
      map['general_notes'] = Variable<String>(generalNotes);
    }
    if (!nullToAbsent || linkedSessionId != null) {
      map['linked_session_id'] = Variable<int>(linkedSessionId);
    }
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      mood: Value(mood),
      stressLevel: Value(stressLevel),
      energyLevel: Value(energyLevel),
      dreamNotes: dreamNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(dreamNotes),
      generalNotes: generalNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(generalNotes),
      linkedSessionId: linkedSessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedSessionId),
    );
  }

  factory JournalEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntry(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      mood: serializer.fromJson<String>(json['mood']),
      stressLevel: serializer.fromJson<int>(json['stressLevel']),
      energyLevel: serializer.fromJson<int>(json['energyLevel']),
      dreamNotes: serializer.fromJson<String?>(json['dreamNotes']),
      generalNotes: serializer.fromJson<String?>(json['generalNotes']),
      linkedSessionId: serializer.fromJson<int?>(json['linkedSessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'mood': serializer.toJson<String>(mood),
      'stressLevel': serializer.toJson<int>(stressLevel),
      'energyLevel': serializer.toJson<int>(energyLevel),
      'dreamNotes': serializer.toJson<String?>(dreamNotes),
      'generalNotes': serializer.toJson<String?>(generalNotes),
      'linkedSessionId': serializer.toJson<int?>(linkedSessionId),
    };
  }

  JournalEntry copyWith(
          {int? id,
          DateTime? createdAt,
          String? mood,
          int? stressLevel,
          int? energyLevel,
          Value<String?> dreamNotes = const Value.absent(),
          Value<String?> generalNotes = const Value.absent(),
          Value<int?> linkedSessionId = const Value.absent()}) =>
      JournalEntry(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        mood: mood ?? this.mood,
        stressLevel: stressLevel ?? this.stressLevel,
        energyLevel: energyLevel ?? this.energyLevel,
        dreamNotes: dreamNotes.present ? dreamNotes.value : this.dreamNotes,
        generalNotes:
            generalNotes.present ? generalNotes.value : this.generalNotes,
        linkedSessionId: linkedSessionId.present
            ? linkedSessionId.value
            : this.linkedSessionId,
      );
  JournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntry(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      mood: data.mood.present ? data.mood.value : this.mood,
      stressLevel:
          data.stressLevel.present ? data.stressLevel.value : this.stressLevel,
      energyLevel:
          data.energyLevel.present ? data.energyLevel.value : this.energyLevel,
      dreamNotes:
          data.dreamNotes.present ? data.dreamNotes.value : this.dreamNotes,
      generalNotes: data.generalNotes.present
          ? data.generalNotes.value
          : this.generalNotes,
      linkedSessionId: data.linkedSessionId.present
          ? data.linkedSessionId.value
          : this.linkedSessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntry(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('mood: $mood, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('dreamNotes: $dreamNotes, ')
          ..write('generalNotes: $generalNotes, ')
          ..write('linkedSessionId: $linkedSessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, mood, stressLevel, energyLevel,
      dreamNotes, generalNotes, linkedSessionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntry &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.mood == this.mood &&
          other.stressLevel == this.stressLevel &&
          other.energyLevel == this.energyLevel &&
          other.dreamNotes == this.dreamNotes &&
          other.generalNotes == this.generalNotes &&
          other.linkedSessionId == this.linkedSessionId);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntry> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> mood;
  final Value<int> stressLevel;
  final Value<int> energyLevel;
  final Value<String?> dreamNotes;
  final Value<String?> generalNotes;
  final Value<int?> linkedSessionId;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.mood = const Value.absent(),
    this.stressLevel = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.dreamNotes = const Value.absent(),
    this.generalNotes = const Value.absent(),
    this.linkedSessionId = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required String mood,
    required int stressLevel,
    required int energyLevel,
    this.dreamNotes = const Value.absent(),
    this.generalNotes = const Value.absent(),
    this.linkedSessionId = const Value.absent(),
  })  : createdAt = Value(createdAt),
        mood = Value(mood),
        stressLevel = Value(stressLevel),
        energyLevel = Value(energyLevel);
  static Insertable<JournalEntry> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? mood,
    Expression<int>? stressLevel,
    Expression<int>? energyLevel,
    Expression<String>? dreamNotes,
    Expression<String>? generalNotes,
    Expression<int>? linkedSessionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (mood != null) 'mood': mood,
      if (stressLevel != null) 'stress_level': stressLevel,
      if (energyLevel != null) 'energy_level': energyLevel,
      if (dreamNotes != null) 'dream_notes': dreamNotes,
      if (generalNotes != null) 'general_notes': generalNotes,
      if (linkedSessionId != null) 'linked_session_id': linkedSessionId,
    });
  }

  JournalEntriesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<String>? mood,
      Value<int>? stressLevel,
      Value<int>? energyLevel,
      Value<String?>? dreamNotes,
      Value<String?>? generalNotes,
      Value<int?>? linkedSessionId}) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      mood: mood ?? this.mood,
      stressLevel: stressLevel ?? this.stressLevel,
      energyLevel: energyLevel ?? this.energyLevel,
      dreamNotes: dreamNotes ?? this.dreamNotes,
      generalNotes: generalNotes ?? this.generalNotes,
      linkedSessionId: linkedSessionId ?? this.linkedSessionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (stressLevel.present) {
      map['stress_level'] = Variable<int>(stressLevel.value);
    }
    if (energyLevel.present) {
      map['energy_level'] = Variable<int>(energyLevel.value);
    }
    if (dreamNotes.present) {
      map['dream_notes'] = Variable<String>(dreamNotes.value);
    }
    if (generalNotes.present) {
      map['general_notes'] = Variable<String>(generalNotes.value);
    }
    if (linkedSessionId.present) {
      map['linked_session_id'] = Variable<int>(linkedSessionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('mood: $mood, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('dreamNotes: $dreamNotes, ')
          ..write('generalNotes: $generalNotes, ')
          ..write('linkedSessionId: $linkedSessionId')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _darkModeMeta =
      const VerificationMeta('darkMode');
  @override
  late final GeneratedColumn<bool> darkMode = GeneratedColumn<bool>(
      'dark_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dark_mode" IN (0, 1))'));
  static const VerificationMeta _aiModeEnabledMeta =
      const VerificationMeta('aiModeEnabled');
  @override
  late final GeneratedColumn<bool> aiModeEnabled = GeneratedColumn<bool>(
      'ai_mode_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ai_mode_enabled" IN (0, 1))'));
  static const VerificationMeta _microphoneEnabledMeta =
      const VerificationMeta('microphoneEnabled');
  @override
  late final GeneratedColumn<bool> microphoneEnabled = GeneratedColumn<bool>(
      'microphone_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("microphone_enabled" IN (0, 1))'));
  static const VerificationMeta _smartAlarmEnabledMeta =
      const VerificationMeta('smartAlarmEnabled');
  @override
  late final GeneratedColumn<bool> smartAlarmEnabled = GeneratedColumn<bool>(
      'smart_alarm_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("smart_alarm_enabled" IN (0, 1))'));
  static const VerificationMeta _bedtimeReminderEnabledMeta =
      const VerificationMeta('bedtimeReminderEnabled');
  @override
  late final GeneratedColumn<bool> bedtimeReminderEnabled =
      GeneratedColumn<bool>('bedtime_reminder_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("bedtime_reminder_enabled" IN (0, 1))'));
  static const VerificationMeta _snoreDetectionEnabledMeta =
      const VerificationMeta('snoreDetectionEnabled');
  @override
  late final GeneratedColumn<bool> snoreDetectionEnabled =
      GeneratedColumn<bool>('snore_detection_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("snore_detection_enabled" IN (0, 1))'));
  static const VerificationMeta _sleepGoalHoursMeta =
      const VerificationMeta('sleepGoalHours');
  @override
  late final GeneratedColumn<double> sleepGoalHours = GeneratedColumn<double>(
      'sleep_goal_hours', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bedtimeHourMeta =
      const VerificationMeta('bedtimeHour');
  @override
  late final GeneratedColumn<int> bedtimeHour = GeneratedColumn<int>(
      'bedtime_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bedtimeMinuteMeta =
      const VerificationMeta('bedtimeMinute');
  @override
  late final GeneratedColumn<int> bedtimeMinute = GeneratedColumn<int>(
      'bedtime_minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeHourMeta =
      const VerificationMeta('wakeHour');
  @override
  late final GeneratedColumn<int> wakeHour = GeneratedColumn<int>(
      'wake_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeMinuteMeta =
      const VerificationMeta('wakeMinute');
  @override
  late final GeneratedColumn<int> wakeMinute = GeneratedColumn<int>(
      'wake_minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _smartAlarmWindowMinutesMeta =
      const VerificationMeta('smartAlarmWindowMinutes');
  @override
  late final GeneratedColumn<int> smartAlarmWindowMinutes =
      GeneratedColumn<int>('smart_alarm_window_minutes', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _claudeApiKeyMeta =
      const VerificationMeta('claudeApiKey');
  @override
  late final GeneratedColumn<String> claudeApiKey = GeneratedColumn<String>(
      'claude_api_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _openAiApiKeyMeta =
      const VerificationMeta('openAiApiKey');
  @override
  late final GeneratedColumn<String> openAiApiKey = GeneratedColumn<String>(
      'open_ai_api_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _preferredAiProviderMeta =
      const VerificationMeta('preferredAiProvider');
  @override
  late final GeneratedColumn<String> preferredAiProvider =
      GeneratedColumn<String>('preferred_ai_provider', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        darkMode,
        aiModeEnabled,
        microphoneEnabled,
        smartAlarmEnabled,
        bedtimeReminderEnabled,
        snoreDetectionEnabled,
        sleepGoalHours,
        bedtimeHour,
        bedtimeMinute,
        wakeHour,
        wakeMinute,
        smartAlarmWindowMinutes,
        claudeApiKey,
        openAiApiKey,
        preferredAiProvider
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(Insertable<UserSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('dark_mode')) {
      context.handle(_darkModeMeta,
          darkMode.isAcceptableOrUnknown(data['dark_mode']!, _darkModeMeta));
    } else if (isInserting) {
      context.missing(_darkModeMeta);
    }
    if (data.containsKey('ai_mode_enabled')) {
      context.handle(
          _aiModeEnabledMeta,
          aiModeEnabled.isAcceptableOrUnknown(
              data['ai_mode_enabled']!, _aiModeEnabledMeta));
    } else if (isInserting) {
      context.missing(_aiModeEnabledMeta);
    }
    if (data.containsKey('microphone_enabled')) {
      context.handle(
          _microphoneEnabledMeta,
          microphoneEnabled.isAcceptableOrUnknown(
              data['microphone_enabled']!, _microphoneEnabledMeta));
    } else if (isInserting) {
      context.missing(_microphoneEnabledMeta);
    }
    if (data.containsKey('smart_alarm_enabled')) {
      context.handle(
          _smartAlarmEnabledMeta,
          smartAlarmEnabled.isAcceptableOrUnknown(
              data['smart_alarm_enabled']!, _smartAlarmEnabledMeta));
    } else if (isInserting) {
      context.missing(_smartAlarmEnabledMeta);
    }
    if (data.containsKey('bedtime_reminder_enabled')) {
      context.handle(
          _bedtimeReminderEnabledMeta,
          bedtimeReminderEnabled.isAcceptableOrUnknown(
              data['bedtime_reminder_enabled']!, _bedtimeReminderEnabledMeta));
    } else if (isInserting) {
      context.missing(_bedtimeReminderEnabledMeta);
    }
    if (data.containsKey('snore_detection_enabled')) {
      context.handle(
          _snoreDetectionEnabledMeta,
          snoreDetectionEnabled.isAcceptableOrUnknown(
              data['snore_detection_enabled']!, _snoreDetectionEnabledMeta));
    } else if (isInserting) {
      context.missing(_snoreDetectionEnabledMeta);
    }
    if (data.containsKey('sleep_goal_hours')) {
      context.handle(
          _sleepGoalHoursMeta,
          sleepGoalHours.isAcceptableOrUnknown(
              data['sleep_goal_hours']!, _sleepGoalHoursMeta));
    } else if (isInserting) {
      context.missing(_sleepGoalHoursMeta);
    }
    if (data.containsKey('bedtime_hour')) {
      context.handle(
          _bedtimeHourMeta,
          bedtimeHour.isAcceptableOrUnknown(
              data['bedtime_hour']!, _bedtimeHourMeta));
    } else if (isInserting) {
      context.missing(_bedtimeHourMeta);
    }
    if (data.containsKey('bedtime_minute')) {
      context.handle(
          _bedtimeMinuteMeta,
          bedtimeMinute.isAcceptableOrUnknown(
              data['bedtime_minute']!, _bedtimeMinuteMeta));
    } else if (isInserting) {
      context.missing(_bedtimeMinuteMeta);
    }
    if (data.containsKey('wake_hour')) {
      context.handle(_wakeHourMeta,
          wakeHour.isAcceptableOrUnknown(data['wake_hour']!, _wakeHourMeta));
    } else if (isInserting) {
      context.missing(_wakeHourMeta);
    }
    if (data.containsKey('wake_minute')) {
      context.handle(
          _wakeMinuteMeta,
          wakeMinute.isAcceptableOrUnknown(
              data['wake_minute']!, _wakeMinuteMeta));
    } else if (isInserting) {
      context.missing(_wakeMinuteMeta);
    }
    if (data.containsKey('smart_alarm_window_minutes')) {
      context.handle(
          _smartAlarmWindowMinutesMeta,
          smartAlarmWindowMinutes.isAcceptableOrUnknown(
              data['smart_alarm_window_minutes']!,
              _smartAlarmWindowMinutesMeta));
    } else if (isInserting) {
      context.missing(_smartAlarmWindowMinutesMeta);
    }
    if (data.containsKey('claude_api_key')) {
      context.handle(
          _claudeApiKeyMeta,
          claudeApiKey.isAcceptableOrUnknown(
              data['claude_api_key']!, _claudeApiKeyMeta));
    }
    if (data.containsKey('open_ai_api_key')) {
      context.handle(
          _openAiApiKeyMeta,
          openAiApiKey.isAcceptableOrUnknown(
              data['open_ai_api_key']!, _openAiApiKeyMeta));
    }
    if (data.containsKey('preferred_ai_provider')) {
      context.handle(
          _preferredAiProviderMeta,
          preferredAiProvider.isAcceptableOrUnknown(
              data['preferred_ai_provider']!, _preferredAiProviderMeta));
    } else if (isInserting) {
      context.missing(_preferredAiProviderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      darkMode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dark_mode'])!,
      aiModeEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ai_mode_enabled'])!,
      microphoneEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}microphone_enabled'])!,
      smartAlarmEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}smart_alarm_enabled'])!,
      bedtimeReminderEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}bedtime_reminder_enabled'])!,
      snoreDetectionEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}snore_detection_enabled'])!,
      sleepGoalHours: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}sleep_goal_hours'])!,
      bedtimeHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bedtime_hour'])!,
      bedtimeMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bedtime_minute'])!,
      wakeHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wake_hour'])!,
      wakeMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wake_minute'])!,
      smartAlarmWindowMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}smart_alarm_window_minutes'])!,
      claudeApiKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}claude_api_key']),
      openAiApiKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}open_ai_api_key']),
      preferredAiProvider: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}preferred_ai_provider'])!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final int id;
  final bool darkMode;
  final bool aiModeEnabled;
  final bool microphoneEnabled;
  final bool smartAlarmEnabled;
  final bool bedtimeReminderEnabled;
  final bool snoreDetectionEnabled;
  final double sleepGoalHours;
  final int bedtimeHour;
  final int bedtimeMinute;
  final int wakeHour;
  final int wakeMinute;
  final int smartAlarmWindowMinutes;
  final String? claudeApiKey;
  final String? openAiApiKey;
  final String preferredAiProvider;
  const UserSetting(
      {required this.id,
      required this.darkMode,
      required this.aiModeEnabled,
      required this.microphoneEnabled,
      required this.smartAlarmEnabled,
      required this.bedtimeReminderEnabled,
      required this.snoreDetectionEnabled,
      required this.sleepGoalHours,
      required this.bedtimeHour,
      required this.bedtimeMinute,
      required this.wakeHour,
      required this.wakeMinute,
      required this.smartAlarmWindowMinutes,
      this.claudeApiKey,
      this.openAiApiKey,
      required this.preferredAiProvider});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dark_mode'] = Variable<bool>(darkMode);
    map['ai_mode_enabled'] = Variable<bool>(aiModeEnabled);
    map['microphone_enabled'] = Variable<bool>(microphoneEnabled);
    map['smart_alarm_enabled'] = Variable<bool>(smartAlarmEnabled);
    map['bedtime_reminder_enabled'] = Variable<bool>(bedtimeReminderEnabled);
    map['snore_detection_enabled'] = Variable<bool>(snoreDetectionEnabled);
    map['sleep_goal_hours'] = Variable<double>(sleepGoalHours);
    map['bedtime_hour'] = Variable<int>(bedtimeHour);
    map['bedtime_minute'] = Variable<int>(bedtimeMinute);
    map['wake_hour'] = Variable<int>(wakeHour);
    map['wake_minute'] = Variable<int>(wakeMinute);
    map['smart_alarm_window_minutes'] = Variable<int>(smartAlarmWindowMinutes);
    if (!nullToAbsent || claudeApiKey != null) {
      map['claude_api_key'] = Variable<String>(claudeApiKey);
    }
    if (!nullToAbsent || openAiApiKey != null) {
      map['open_ai_api_key'] = Variable<String>(openAiApiKey);
    }
    map['preferred_ai_provider'] = Variable<String>(preferredAiProvider);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      id: Value(id),
      darkMode: Value(darkMode),
      aiModeEnabled: Value(aiModeEnabled),
      microphoneEnabled: Value(microphoneEnabled),
      smartAlarmEnabled: Value(smartAlarmEnabled),
      bedtimeReminderEnabled: Value(bedtimeReminderEnabled),
      snoreDetectionEnabled: Value(snoreDetectionEnabled),
      sleepGoalHours: Value(sleepGoalHours),
      bedtimeHour: Value(bedtimeHour),
      bedtimeMinute: Value(bedtimeMinute),
      wakeHour: Value(wakeHour),
      wakeMinute: Value(wakeMinute),
      smartAlarmWindowMinutes: Value(smartAlarmWindowMinutes),
      claudeApiKey: claudeApiKey == null && nullToAbsent
          ? const Value.absent()
          : Value(claudeApiKey),
      openAiApiKey: openAiApiKey == null && nullToAbsent
          ? const Value.absent()
          : Value(openAiApiKey),
      preferredAiProvider: Value(preferredAiProvider),
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      id: serializer.fromJson<int>(json['id']),
      darkMode: serializer.fromJson<bool>(json['darkMode']),
      aiModeEnabled: serializer.fromJson<bool>(json['aiModeEnabled']),
      microphoneEnabled: serializer.fromJson<bool>(json['microphoneEnabled']),
      smartAlarmEnabled: serializer.fromJson<bool>(json['smartAlarmEnabled']),
      bedtimeReminderEnabled:
          serializer.fromJson<bool>(json['bedtimeReminderEnabled']),
      snoreDetectionEnabled:
          serializer.fromJson<bool>(json['snoreDetectionEnabled']),
      sleepGoalHours: serializer.fromJson<double>(json['sleepGoalHours']),
      bedtimeHour: serializer.fromJson<int>(json['bedtimeHour']),
      bedtimeMinute: serializer.fromJson<int>(json['bedtimeMinute']),
      wakeHour: serializer.fromJson<int>(json['wakeHour']),
      wakeMinute: serializer.fromJson<int>(json['wakeMinute']),
      smartAlarmWindowMinutes:
          serializer.fromJson<int>(json['smartAlarmWindowMinutes']),
      claudeApiKey: serializer.fromJson<String?>(json['claudeApiKey']),
      openAiApiKey: serializer.fromJson<String?>(json['openAiApiKey']),
      preferredAiProvider:
          serializer.fromJson<String>(json['preferredAiProvider']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'darkMode': serializer.toJson<bool>(darkMode),
      'aiModeEnabled': serializer.toJson<bool>(aiModeEnabled),
      'microphoneEnabled': serializer.toJson<bool>(microphoneEnabled),
      'smartAlarmEnabled': serializer.toJson<bool>(smartAlarmEnabled),
      'bedtimeReminderEnabled': serializer.toJson<bool>(bedtimeReminderEnabled),
      'snoreDetectionEnabled': serializer.toJson<bool>(snoreDetectionEnabled),
      'sleepGoalHours': serializer.toJson<double>(sleepGoalHours),
      'bedtimeHour': serializer.toJson<int>(bedtimeHour),
      'bedtimeMinute': serializer.toJson<int>(bedtimeMinute),
      'wakeHour': serializer.toJson<int>(wakeHour),
      'wakeMinute': serializer.toJson<int>(wakeMinute),
      'smartAlarmWindowMinutes':
          serializer.toJson<int>(smartAlarmWindowMinutes),
      'claudeApiKey': serializer.toJson<String?>(claudeApiKey),
      'openAiApiKey': serializer.toJson<String?>(openAiApiKey),
      'preferredAiProvider': serializer.toJson<String>(preferredAiProvider),
    };
  }

  UserSetting copyWith(
          {int? id,
          bool? darkMode,
          bool? aiModeEnabled,
          bool? microphoneEnabled,
          bool? smartAlarmEnabled,
          bool? bedtimeReminderEnabled,
          bool? snoreDetectionEnabled,
          double? sleepGoalHours,
          int? bedtimeHour,
          int? bedtimeMinute,
          int? wakeHour,
          int? wakeMinute,
          int? smartAlarmWindowMinutes,
          Value<String?> claudeApiKey = const Value.absent(),
          Value<String?> openAiApiKey = const Value.absent(),
          String? preferredAiProvider}) =>
      UserSetting(
        id: id ?? this.id,
        darkMode: darkMode ?? this.darkMode,
        aiModeEnabled: aiModeEnabled ?? this.aiModeEnabled,
        microphoneEnabled: microphoneEnabled ?? this.microphoneEnabled,
        smartAlarmEnabled: smartAlarmEnabled ?? this.smartAlarmEnabled,
        bedtimeReminderEnabled:
            bedtimeReminderEnabled ?? this.bedtimeReminderEnabled,
        snoreDetectionEnabled:
            snoreDetectionEnabled ?? this.snoreDetectionEnabled,
        sleepGoalHours: sleepGoalHours ?? this.sleepGoalHours,
        bedtimeHour: bedtimeHour ?? this.bedtimeHour,
        bedtimeMinute: bedtimeMinute ?? this.bedtimeMinute,
        wakeHour: wakeHour ?? this.wakeHour,
        wakeMinute: wakeMinute ?? this.wakeMinute,
        smartAlarmWindowMinutes:
            smartAlarmWindowMinutes ?? this.smartAlarmWindowMinutes,
        claudeApiKey:
            claudeApiKey.present ? claudeApiKey.value : this.claudeApiKey,
        openAiApiKey:
            openAiApiKey.present ? openAiApiKey.value : this.openAiApiKey,
        preferredAiProvider: preferredAiProvider ?? this.preferredAiProvider,
      );
  UserSetting copyWithCompanion(UserSettingsCompanion data) {
    return UserSetting(
      id: data.id.present ? data.id.value : this.id,
      darkMode: data.darkMode.present ? data.darkMode.value : this.darkMode,
      aiModeEnabled: data.aiModeEnabled.present
          ? data.aiModeEnabled.value
          : this.aiModeEnabled,
      microphoneEnabled: data.microphoneEnabled.present
          ? data.microphoneEnabled.value
          : this.microphoneEnabled,
      smartAlarmEnabled: data.smartAlarmEnabled.present
          ? data.smartAlarmEnabled.value
          : this.smartAlarmEnabled,
      bedtimeReminderEnabled: data.bedtimeReminderEnabled.present
          ? data.bedtimeReminderEnabled.value
          : this.bedtimeReminderEnabled,
      snoreDetectionEnabled: data.snoreDetectionEnabled.present
          ? data.snoreDetectionEnabled.value
          : this.snoreDetectionEnabled,
      sleepGoalHours: data.sleepGoalHours.present
          ? data.sleepGoalHours.value
          : this.sleepGoalHours,
      bedtimeHour:
          data.bedtimeHour.present ? data.bedtimeHour.value : this.bedtimeHour,
      bedtimeMinute: data.bedtimeMinute.present
          ? data.bedtimeMinute.value
          : this.bedtimeMinute,
      wakeHour: data.wakeHour.present ? data.wakeHour.value : this.wakeHour,
      wakeMinute:
          data.wakeMinute.present ? data.wakeMinute.value : this.wakeMinute,
      smartAlarmWindowMinutes: data.smartAlarmWindowMinutes.present
          ? data.smartAlarmWindowMinutes.value
          : this.smartAlarmWindowMinutes,
      claudeApiKey: data.claudeApiKey.present
          ? data.claudeApiKey.value
          : this.claudeApiKey,
      openAiApiKey: data.openAiApiKey.present
          ? data.openAiApiKey.value
          : this.openAiApiKey,
      preferredAiProvider: data.preferredAiProvider.present
          ? data.preferredAiProvider.value
          : this.preferredAiProvider,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('id: $id, ')
          ..write('darkMode: $darkMode, ')
          ..write('aiModeEnabled: $aiModeEnabled, ')
          ..write('microphoneEnabled: $microphoneEnabled, ')
          ..write('smartAlarmEnabled: $smartAlarmEnabled, ')
          ..write('bedtimeReminderEnabled: $bedtimeReminderEnabled, ')
          ..write('snoreDetectionEnabled: $snoreDetectionEnabled, ')
          ..write('sleepGoalHours: $sleepGoalHours, ')
          ..write('bedtimeHour: $bedtimeHour, ')
          ..write('bedtimeMinute: $bedtimeMinute, ')
          ..write('wakeHour: $wakeHour, ')
          ..write('wakeMinute: $wakeMinute, ')
          ..write('smartAlarmWindowMinutes: $smartAlarmWindowMinutes, ')
          ..write('claudeApiKey: $claudeApiKey, ')
          ..write('openAiApiKey: $openAiApiKey, ')
          ..write('preferredAiProvider: $preferredAiProvider')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      darkMode,
      aiModeEnabled,
      microphoneEnabled,
      smartAlarmEnabled,
      bedtimeReminderEnabled,
      snoreDetectionEnabled,
      sleepGoalHours,
      bedtimeHour,
      bedtimeMinute,
      wakeHour,
      wakeMinute,
      smartAlarmWindowMinutes,
      claudeApiKey,
      openAiApiKey,
      preferredAiProvider);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.id == this.id &&
          other.darkMode == this.darkMode &&
          other.aiModeEnabled == this.aiModeEnabled &&
          other.microphoneEnabled == this.microphoneEnabled &&
          other.smartAlarmEnabled == this.smartAlarmEnabled &&
          other.bedtimeReminderEnabled == this.bedtimeReminderEnabled &&
          other.snoreDetectionEnabled == this.snoreDetectionEnabled &&
          other.sleepGoalHours == this.sleepGoalHours &&
          other.bedtimeHour == this.bedtimeHour &&
          other.bedtimeMinute == this.bedtimeMinute &&
          other.wakeHour == this.wakeHour &&
          other.wakeMinute == this.wakeMinute &&
          other.smartAlarmWindowMinutes == this.smartAlarmWindowMinutes &&
          other.claudeApiKey == this.claudeApiKey &&
          other.openAiApiKey == this.openAiApiKey &&
          other.preferredAiProvider == this.preferredAiProvider);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<int> id;
  final Value<bool> darkMode;
  final Value<bool> aiModeEnabled;
  final Value<bool> microphoneEnabled;
  final Value<bool> smartAlarmEnabled;
  final Value<bool> bedtimeReminderEnabled;
  final Value<bool> snoreDetectionEnabled;
  final Value<double> sleepGoalHours;
  final Value<int> bedtimeHour;
  final Value<int> bedtimeMinute;
  final Value<int> wakeHour;
  final Value<int> wakeMinute;
  final Value<int> smartAlarmWindowMinutes;
  final Value<String?> claudeApiKey;
  final Value<String?> openAiApiKey;
  final Value<String> preferredAiProvider;
  const UserSettingsCompanion({
    this.id = const Value.absent(),
    this.darkMode = const Value.absent(),
    this.aiModeEnabled = const Value.absent(),
    this.microphoneEnabled = const Value.absent(),
    this.smartAlarmEnabled = const Value.absent(),
    this.bedtimeReminderEnabled = const Value.absent(),
    this.snoreDetectionEnabled = const Value.absent(),
    this.sleepGoalHours = const Value.absent(),
    this.bedtimeHour = const Value.absent(),
    this.bedtimeMinute = const Value.absent(),
    this.wakeHour = const Value.absent(),
    this.wakeMinute = const Value.absent(),
    this.smartAlarmWindowMinutes = const Value.absent(),
    this.claudeApiKey = const Value.absent(),
    this.openAiApiKey = const Value.absent(),
    this.preferredAiProvider = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    this.id = const Value.absent(),
    required bool darkMode,
    required bool aiModeEnabled,
    required bool microphoneEnabled,
    required bool smartAlarmEnabled,
    required bool bedtimeReminderEnabled,
    required bool snoreDetectionEnabled,
    required double sleepGoalHours,
    required int bedtimeHour,
    required int bedtimeMinute,
    required int wakeHour,
    required int wakeMinute,
    required int smartAlarmWindowMinutes,
    this.claudeApiKey = const Value.absent(),
    this.openAiApiKey = const Value.absent(),
    required String preferredAiProvider,
  })  : darkMode = Value(darkMode),
        aiModeEnabled = Value(aiModeEnabled),
        microphoneEnabled = Value(microphoneEnabled),
        smartAlarmEnabled = Value(smartAlarmEnabled),
        bedtimeReminderEnabled = Value(bedtimeReminderEnabled),
        snoreDetectionEnabled = Value(snoreDetectionEnabled),
        sleepGoalHours = Value(sleepGoalHours),
        bedtimeHour = Value(bedtimeHour),
        bedtimeMinute = Value(bedtimeMinute),
        wakeHour = Value(wakeHour),
        wakeMinute = Value(wakeMinute),
        smartAlarmWindowMinutes = Value(smartAlarmWindowMinutes),
        preferredAiProvider = Value(preferredAiProvider);
  static Insertable<UserSetting> custom({
    Expression<int>? id,
    Expression<bool>? darkMode,
    Expression<bool>? aiModeEnabled,
    Expression<bool>? microphoneEnabled,
    Expression<bool>? smartAlarmEnabled,
    Expression<bool>? bedtimeReminderEnabled,
    Expression<bool>? snoreDetectionEnabled,
    Expression<double>? sleepGoalHours,
    Expression<int>? bedtimeHour,
    Expression<int>? bedtimeMinute,
    Expression<int>? wakeHour,
    Expression<int>? wakeMinute,
    Expression<int>? smartAlarmWindowMinutes,
    Expression<String>? claudeApiKey,
    Expression<String>? openAiApiKey,
    Expression<String>? preferredAiProvider,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (darkMode != null) 'dark_mode': darkMode,
      if (aiModeEnabled != null) 'ai_mode_enabled': aiModeEnabled,
      if (microphoneEnabled != null) 'microphone_enabled': microphoneEnabled,
      if (smartAlarmEnabled != null) 'smart_alarm_enabled': smartAlarmEnabled,
      if (bedtimeReminderEnabled != null)
        'bedtime_reminder_enabled': bedtimeReminderEnabled,
      if (snoreDetectionEnabled != null)
        'snore_detection_enabled': snoreDetectionEnabled,
      if (sleepGoalHours != null) 'sleep_goal_hours': sleepGoalHours,
      if (bedtimeHour != null) 'bedtime_hour': bedtimeHour,
      if (bedtimeMinute != null) 'bedtime_minute': bedtimeMinute,
      if (wakeHour != null) 'wake_hour': wakeHour,
      if (wakeMinute != null) 'wake_minute': wakeMinute,
      if (smartAlarmWindowMinutes != null)
        'smart_alarm_window_minutes': smartAlarmWindowMinutes,
      if (claudeApiKey != null) 'claude_api_key': claudeApiKey,
      if (openAiApiKey != null) 'open_ai_api_key': openAiApiKey,
      if (preferredAiProvider != null)
        'preferred_ai_provider': preferredAiProvider,
    });
  }

  UserSettingsCompanion copyWith(
      {Value<int>? id,
      Value<bool>? darkMode,
      Value<bool>? aiModeEnabled,
      Value<bool>? microphoneEnabled,
      Value<bool>? smartAlarmEnabled,
      Value<bool>? bedtimeReminderEnabled,
      Value<bool>? snoreDetectionEnabled,
      Value<double>? sleepGoalHours,
      Value<int>? bedtimeHour,
      Value<int>? bedtimeMinute,
      Value<int>? wakeHour,
      Value<int>? wakeMinute,
      Value<int>? smartAlarmWindowMinutes,
      Value<String?>? claudeApiKey,
      Value<String?>? openAiApiKey,
      Value<String>? preferredAiProvider}) {
    return UserSettingsCompanion(
      id: id ?? this.id,
      darkMode: darkMode ?? this.darkMode,
      aiModeEnabled: aiModeEnabled ?? this.aiModeEnabled,
      microphoneEnabled: microphoneEnabled ?? this.microphoneEnabled,
      smartAlarmEnabled: smartAlarmEnabled ?? this.smartAlarmEnabled,
      bedtimeReminderEnabled:
          bedtimeReminderEnabled ?? this.bedtimeReminderEnabled,
      snoreDetectionEnabled:
          snoreDetectionEnabled ?? this.snoreDetectionEnabled,
      sleepGoalHours: sleepGoalHours ?? this.sleepGoalHours,
      bedtimeHour: bedtimeHour ?? this.bedtimeHour,
      bedtimeMinute: bedtimeMinute ?? this.bedtimeMinute,
      wakeHour: wakeHour ?? this.wakeHour,
      wakeMinute: wakeMinute ?? this.wakeMinute,
      smartAlarmWindowMinutes:
          smartAlarmWindowMinutes ?? this.smartAlarmWindowMinutes,
      claudeApiKey: claudeApiKey ?? this.claudeApiKey,
      openAiApiKey: openAiApiKey ?? this.openAiApiKey,
      preferredAiProvider: preferredAiProvider ?? this.preferredAiProvider,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (darkMode.present) {
      map['dark_mode'] = Variable<bool>(darkMode.value);
    }
    if (aiModeEnabled.present) {
      map['ai_mode_enabled'] = Variable<bool>(aiModeEnabled.value);
    }
    if (microphoneEnabled.present) {
      map['microphone_enabled'] = Variable<bool>(microphoneEnabled.value);
    }
    if (smartAlarmEnabled.present) {
      map['smart_alarm_enabled'] = Variable<bool>(smartAlarmEnabled.value);
    }
    if (bedtimeReminderEnabled.present) {
      map['bedtime_reminder_enabled'] =
          Variable<bool>(bedtimeReminderEnabled.value);
    }
    if (snoreDetectionEnabled.present) {
      map['snore_detection_enabled'] =
          Variable<bool>(snoreDetectionEnabled.value);
    }
    if (sleepGoalHours.present) {
      map['sleep_goal_hours'] = Variable<double>(sleepGoalHours.value);
    }
    if (bedtimeHour.present) {
      map['bedtime_hour'] = Variable<int>(bedtimeHour.value);
    }
    if (bedtimeMinute.present) {
      map['bedtime_minute'] = Variable<int>(bedtimeMinute.value);
    }
    if (wakeHour.present) {
      map['wake_hour'] = Variable<int>(wakeHour.value);
    }
    if (wakeMinute.present) {
      map['wake_minute'] = Variable<int>(wakeMinute.value);
    }
    if (smartAlarmWindowMinutes.present) {
      map['smart_alarm_window_minutes'] =
          Variable<int>(smartAlarmWindowMinutes.value);
    }
    if (claudeApiKey.present) {
      map['claude_api_key'] = Variable<String>(claudeApiKey.value);
    }
    if (openAiApiKey.present) {
      map['open_ai_api_key'] = Variable<String>(openAiApiKey.value);
    }
    if (preferredAiProvider.present) {
      map['preferred_ai_provider'] =
          Variable<String>(preferredAiProvider.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('id: $id, ')
          ..write('darkMode: $darkMode, ')
          ..write('aiModeEnabled: $aiModeEnabled, ')
          ..write('microphoneEnabled: $microphoneEnabled, ')
          ..write('smartAlarmEnabled: $smartAlarmEnabled, ')
          ..write('bedtimeReminderEnabled: $bedtimeReminderEnabled, ')
          ..write('snoreDetectionEnabled: $snoreDetectionEnabled, ')
          ..write('sleepGoalHours: $sleepGoalHours, ')
          ..write('bedtimeHour: $bedtimeHour, ')
          ..write('bedtimeMinute: $bedtimeMinute, ')
          ..write('wakeHour: $wakeHour, ')
          ..write('wakeMinute: $wakeMinute, ')
          ..write('smartAlarmWindowMinutes: $smartAlarmWindowMinutes, ')
          ..write('claudeApiKey: $claudeApiKey, ')
          ..write('openAiApiKey: $openAiApiKey, ')
          ..write('preferredAiProvider: $preferredAiProvider')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SleepSessionsTable sleepSessions = $SleepSessionsTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [sleepSessions, journalEntries, userSettings];
}

typedef $$SleepSessionsTableCreateCompanionBuilder = SleepSessionsCompanion
    Function({
  Value<int> id,
  required DateTime sleepTime,
  required DateTime wakeTime,
  required int sleepScore,
  required int interruptions,
  required double movementScore,
  required double durationHours,
  required int estimatedLightSleep,
  required int estimatedDeepSleep,
  required int estimatedRemSleep,
  required int estimatedAwakeTime,
  required bool snoreDetected,
  required int snoreEventCount,
  required double avgNoiseLevel,
  required bool metSleepGoal,
  required int consistencyScore,
  Value<String?> notes,
});
typedef $$SleepSessionsTableUpdateCompanionBuilder = SleepSessionsCompanion
    Function({
  Value<int> id,
  Value<DateTime> sleepTime,
  Value<DateTime> wakeTime,
  Value<int> sleepScore,
  Value<int> interruptions,
  Value<double> movementScore,
  Value<double> durationHours,
  Value<int> estimatedLightSleep,
  Value<int> estimatedDeepSleep,
  Value<int> estimatedRemSleep,
  Value<int> estimatedAwakeTime,
  Value<bool> snoreDetected,
  Value<int> snoreEventCount,
  Value<double> avgNoiseLevel,
  Value<bool> metSleepGoal,
  Value<int> consistencyScore,
  Value<String?> notes,
});

class $$SleepSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SleepSessionsTable> {
  $$SleepSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sleepTime => $composableBuilder(
      column: $table.sleepTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get wakeTime => $composableBuilder(
      column: $table.wakeTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepScore => $composableBuilder(
      column: $table.sleepScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get interruptions => $composableBuilder(
      column: $table.interruptions, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get movementScore => $composableBuilder(
      column: $table.movementScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get durationHours => $composableBuilder(
      column: $table.durationHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedLightSleep => $composableBuilder(
      column: $table.estimatedLightSleep,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedDeepSleep => $composableBuilder(
      column: $table.estimatedDeepSleep,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedRemSleep => $composableBuilder(
      column: $table.estimatedRemSleep,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedAwakeTime => $composableBuilder(
      column: $table.estimatedAwakeTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get snoreDetected => $composableBuilder(
      column: $table.snoreDetected, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get snoreEventCount => $composableBuilder(
      column: $table.snoreEventCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get avgNoiseLevel => $composableBuilder(
      column: $table.avgNoiseLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get metSleepGoal => $composableBuilder(
      column: $table.metSleepGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get consistencyScore => $composableBuilder(
      column: $table.consistencyScore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$SleepSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SleepSessionsTable> {
  $$SleepSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sleepTime => $composableBuilder(
      column: $table.sleepTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get wakeTime => $composableBuilder(
      column: $table.wakeTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepScore => $composableBuilder(
      column: $table.sleepScore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get interruptions => $composableBuilder(
      column: $table.interruptions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get movementScore => $composableBuilder(
      column: $table.movementScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get durationHours => $composableBuilder(
      column: $table.durationHours,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedLightSleep => $composableBuilder(
      column: $table.estimatedLightSleep,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedDeepSleep => $composableBuilder(
      column: $table.estimatedDeepSleep,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedRemSleep => $composableBuilder(
      column: $table.estimatedRemSleep,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedAwakeTime => $composableBuilder(
      column: $table.estimatedAwakeTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get snoreDetected => $composableBuilder(
      column: $table.snoreDetected,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get snoreEventCount => $composableBuilder(
      column: $table.snoreEventCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get avgNoiseLevel => $composableBuilder(
      column: $table.avgNoiseLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get metSleepGoal => $composableBuilder(
      column: $table.metSleepGoal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get consistencyScore => $composableBuilder(
      column: $table.consistencyScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$SleepSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SleepSessionsTable> {
  $$SleepSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get sleepTime =>
      $composableBuilder(column: $table.sleepTime, builder: (column) => column);

  GeneratedColumn<DateTime> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<int> get sleepScore => $composableBuilder(
      column: $table.sleepScore, builder: (column) => column);

  GeneratedColumn<int> get interruptions => $composableBuilder(
      column: $table.interruptions, builder: (column) => column);

  GeneratedColumn<double> get movementScore => $composableBuilder(
      column: $table.movementScore, builder: (column) => column);

  GeneratedColumn<double> get durationHours => $composableBuilder(
      column: $table.durationHours, builder: (column) => column);

  GeneratedColumn<int> get estimatedLightSleep => $composableBuilder(
      column: $table.estimatedLightSleep, builder: (column) => column);

  GeneratedColumn<int> get estimatedDeepSleep => $composableBuilder(
      column: $table.estimatedDeepSleep, builder: (column) => column);

  GeneratedColumn<int> get estimatedRemSleep => $composableBuilder(
      column: $table.estimatedRemSleep, builder: (column) => column);

  GeneratedColumn<int> get estimatedAwakeTime => $composableBuilder(
      column: $table.estimatedAwakeTime, builder: (column) => column);

  GeneratedColumn<bool> get snoreDetected => $composableBuilder(
      column: $table.snoreDetected, builder: (column) => column);

  GeneratedColumn<int> get snoreEventCount => $composableBuilder(
      column: $table.snoreEventCount, builder: (column) => column);

  GeneratedColumn<double> get avgNoiseLevel => $composableBuilder(
      column: $table.avgNoiseLevel, builder: (column) => column);

  GeneratedColumn<bool> get metSleepGoal => $composableBuilder(
      column: $table.metSleepGoal, builder: (column) => column);

  GeneratedColumn<int> get consistencyScore => $composableBuilder(
      column: $table.consistencyScore, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SleepSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SleepSessionsTable,
    SleepSession,
    $$SleepSessionsTableFilterComposer,
    $$SleepSessionsTableOrderingComposer,
    $$SleepSessionsTableAnnotationComposer,
    $$SleepSessionsTableCreateCompanionBuilder,
    $$SleepSessionsTableUpdateCompanionBuilder,
    (
      SleepSession,
      BaseReferences<_$AppDatabase, $SleepSessionsTable, SleepSession>
    ),
    SleepSession,
    PrefetchHooks Function()> {
  $$SleepSessionsTableTableManager(_$AppDatabase db, $SleepSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SleepSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SleepSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SleepSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> sleepTime = const Value.absent(),
            Value<DateTime> wakeTime = const Value.absent(),
            Value<int> sleepScore = const Value.absent(),
            Value<int> interruptions = const Value.absent(),
            Value<double> movementScore = const Value.absent(),
            Value<double> durationHours = const Value.absent(),
            Value<int> estimatedLightSleep = const Value.absent(),
            Value<int> estimatedDeepSleep = const Value.absent(),
            Value<int> estimatedRemSleep = const Value.absent(),
            Value<int> estimatedAwakeTime = const Value.absent(),
            Value<bool> snoreDetected = const Value.absent(),
            Value<int> snoreEventCount = const Value.absent(),
            Value<double> avgNoiseLevel = const Value.absent(),
            Value<bool> metSleepGoal = const Value.absent(),
            Value<int> consistencyScore = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              SleepSessionsCompanion(
            id: id,
            sleepTime: sleepTime,
            wakeTime: wakeTime,
            sleepScore: sleepScore,
            interruptions: interruptions,
            movementScore: movementScore,
            durationHours: durationHours,
            estimatedLightSleep: estimatedLightSleep,
            estimatedDeepSleep: estimatedDeepSleep,
            estimatedRemSleep: estimatedRemSleep,
            estimatedAwakeTime: estimatedAwakeTime,
            snoreDetected: snoreDetected,
            snoreEventCount: snoreEventCount,
            avgNoiseLevel: avgNoiseLevel,
            metSleepGoal: metSleepGoal,
            consistencyScore: consistencyScore,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime sleepTime,
            required DateTime wakeTime,
            required int sleepScore,
            required int interruptions,
            required double movementScore,
            required double durationHours,
            required int estimatedLightSleep,
            required int estimatedDeepSleep,
            required int estimatedRemSleep,
            required int estimatedAwakeTime,
            required bool snoreDetected,
            required int snoreEventCount,
            required double avgNoiseLevel,
            required bool metSleepGoal,
            required int consistencyScore,
            Value<String?> notes = const Value.absent(),
          }) =>
              SleepSessionsCompanion.insert(
            id: id,
            sleepTime: sleepTime,
            wakeTime: wakeTime,
            sleepScore: sleepScore,
            interruptions: interruptions,
            movementScore: movementScore,
            durationHours: durationHours,
            estimatedLightSleep: estimatedLightSleep,
            estimatedDeepSleep: estimatedDeepSleep,
            estimatedRemSleep: estimatedRemSleep,
            estimatedAwakeTime: estimatedAwakeTime,
            snoreDetected: snoreDetected,
            snoreEventCount: snoreEventCount,
            avgNoiseLevel: avgNoiseLevel,
            metSleepGoal: metSleepGoal,
            consistencyScore: consistencyScore,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SleepSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SleepSessionsTable,
    SleepSession,
    $$SleepSessionsTableFilterComposer,
    $$SleepSessionsTableOrderingComposer,
    $$SleepSessionsTableAnnotationComposer,
    $$SleepSessionsTableCreateCompanionBuilder,
    $$SleepSessionsTableUpdateCompanionBuilder,
    (
      SleepSession,
      BaseReferences<_$AppDatabase, $SleepSessionsTable, SleepSession>
    ),
    SleepSession,
    PrefetchHooks Function()>;
typedef $$JournalEntriesTableCreateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<int> id,
  required DateTime createdAt,
  required String mood,
  required int stressLevel,
  required int energyLevel,
  Value<String?> dreamNotes,
  Value<String?> generalNotes,
  Value<int?> linkedSessionId,
});
typedef $$JournalEntriesTableUpdateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<String> mood,
  Value<int> stressLevel,
  Value<int> energyLevel,
  Value<String?> dreamNotes,
  Value<String?> generalNotes,
  Value<int?> linkedSessionId,
});

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mood => $composableBuilder(
      column: $table.mood, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stressLevel => $composableBuilder(
      column: $table.stressLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get energyLevel => $composableBuilder(
      column: $table.energyLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dreamNotes => $composableBuilder(
      column: $table.dreamNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get generalNotes => $composableBuilder(
      column: $table.generalNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get linkedSessionId => $composableBuilder(
      column: $table.linkedSessionId,
      builder: (column) => ColumnFilters(column));
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mood => $composableBuilder(
      column: $table.mood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stressLevel => $composableBuilder(
      column: $table.stressLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get energyLevel => $composableBuilder(
      column: $table.energyLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dreamNotes => $composableBuilder(
      column: $table.dreamNotes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get generalNotes => $composableBuilder(
      column: $table.generalNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get linkedSessionId => $composableBuilder(
      column: $table.linkedSessionId,
      builder: (column) => ColumnOrderings(column));
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get stressLevel => $composableBuilder(
      column: $table.stressLevel, builder: (column) => column);

  GeneratedColumn<int> get energyLevel => $composableBuilder(
      column: $table.energyLevel, builder: (column) => column);

  GeneratedColumn<String> get dreamNotes => $composableBuilder(
      column: $table.dreamNotes, builder: (column) => column);

  GeneratedColumn<String> get generalNotes => $composableBuilder(
      column: $table.generalNotes, builder: (column) => column);

  GeneratedColumn<int> get linkedSessionId => $composableBuilder(
      column: $table.linkedSessionId, builder: (column) => column);
}

class $$JournalEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalEntriesTable,
    JournalEntry,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (
      JournalEntry,
      BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>
    ),
    JournalEntry,
    PrefetchHooks Function()> {
  $$JournalEntriesTableTableManager(
      _$AppDatabase db, $JournalEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> mood = const Value.absent(),
            Value<int> stressLevel = const Value.absent(),
            Value<int> energyLevel = const Value.absent(),
            Value<String?> dreamNotes = const Value.absent(),
            Value<String?> generalNotes = const Value.absent(),
            Value<int?> linkedSessionId = const Value.absent(),
          }) =>
              JournalEntriesCompanion(
            id: id,
            createdAt: createdAt,
            mood: mood,
            stressLevel: stressLevel,
            energyLevel: energyLevel,
            dreamNotes: dreamNotes,
            generalNotes: generalNotes,
            linkedSessionId: linkedSessionId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime createdAt,
            required String mood,
            required int stressLevel,
            required int energyLevel,
            Value<String?> dreamNotes = const Value.absent(),
            Value<String?> generalNotes = const Value.absent(),
            Value<int?> linkedSessionId = const Value.absent(),
          }) =>
              JournalEntriesCompanion.insert(
            id: id,
            createdAt: createdAt,
            mood: mood,
            stressLevel: stressLevel,
            energyLevel: energyLevel,
            dreamNotes: dreamNotes,
            generalNotes: generalNotes,
            linkedSessionId: linkedSessionId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JournalEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JournalEntriesTable,
    JournalEntry,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (
      JournalEntry,
      BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>
    ),
    JournalEntry,
    PrefetchHooks Function()>;
typedef $$UserSettingsTableCreateCompanionBuilder = UserSettingsCompanion
    Function({
  Value<int> id,
  required bool darkMode,
  required bool aiModeEnabled,
  required bool microphoneEnabled,
  required bool smartAlarmEnabled,
  required bool bedtimeReminderEnabled,
  required bool snoreDetectionEnabled,
  required double sleepGoalHours,
  required int bedtimeHour,
  required int bedtimeMinute,
  required int wakeHour,
  required int wakeMinute,
  required int smartAlarmWindowMinutes,
  Value<String?> claudeApiKey,
  Value<String?> openAiApiKey,
  required String preferredAiProvider,
});
typedef $$UserSettingsTableUpdateCompanionBuilder = UserSettingsCompanion
    Function({
  Value<int> id,
  Value<bool> darkMode,
  Value<bool> aiModeEnabled,
  Value<bool> microphoneEnabled,
  Value<bool> smartAlarmEnabled,
  Value<bool> bedtimeReminderEnabled,
  Value<bool> snoreDetectionEnabled,
  Value<double> sleepGoalHours,
  Value<int> bedtimeHour,
  Value<int> bedtimeMinute,
  Value<int> wakeHour,
  Value<int> wakeMinute,
  Value<int> smartAlarmWindowMinutes,
  Value<String?> claudeApiKey,
  Value<String?> openAiApiKey,
  Value<String> preferredAiProvider,
});

class $$UserSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get darkMode => $composableBuilder(
      column: $table.darkMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get aiModeEnabled => $composableBuilder(
      column: $table.aiModeEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get microphoneEnabled => $composableBuilder(
      column: $table.microphoneEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get smartAlarmEnabled => $composableBuilder(
      column: $table.smartAlarmEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bedtimeReminderEnabled => $composableBuilder(
      column: $table.bedtimeReminderEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get snoreDetectionEnabled => $composableBuilder(
      column: $table.snoreDetectionEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sleepGoalHours => $composableBuilder(
      column: $table.sleepGoalHours,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bedtimeHour => $composableBuilder(
      column: $table.bedtimeHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bedtimeMinute => $composableBuilder(
      column: $table.bedtimeMinute, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wakeHour => $composableBuilder(
      column: $table.wakeHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wakeMinute => $composableBuilder(
      column: $table.wakeMinute, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get smartAlarmWindowMinutes => $composableBuilder(
      column: $table.smartAlarmWindowMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get claudeApiKey => $composableBuilder(
      column: $table.claudeApiKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get openAiApiKey => $composableBuilder(
      column: $table.openAiApiKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredAiProvider => $composableBuilder(
      column: $table.preferredAiProvider,
      builder: (column) => ColumnFilters(column));
}

class $$UserSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get darkMode => $composableBuilder(
      column: $table.darkMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get aiModeEnabled => $composableBuilder(
      column: $table.aiModeEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get microphoneEnabled => $composableBuilder(
      column: $table.microphoneEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get smartAlarmEnabled => $composableBuilder(
      column: $table.smartAlarmEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bedtimeReminderEnabled => $composableBuilder(
      column: $table.bedtimeReminderEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get snoreDetectionEnabled => $composableBuilder(
      column: $table.snoreDetectionEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sleepGoalHours => $composableBuilder(
      column: $table.sleepGoalHours,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bedtimeHour => $composableBuilder(
      column: $table.bedtimeHour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bedtimeMinute => $composableBuilder(
      column: $table.bedtimeMinute,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wakeHour => $composableBuilder(
      column: $table.wakeHour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wakeMinute => $composableBuilder(
      column: $table.wakeMinute, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get smartAlarmWindowMinutes => $composableBuilder(
      column: $table.smartAlarmWindowMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get claudeApiKey => $composableBuilder(
      column: $table.claudeApiKey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get openAiApiKey => $composableBuilder(
      column: $table.openAiApiKey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredAiProvider => $composableBuilder(
      column: $table.preferredAiProvider,
      builder: (column) => ColumnOrderings(column));
}

class $$UserSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get darkMode =>
      $composableBuilder(column: $table.darkMode, builder: (column) => column);

  GeneratedColumn<bool> get aiModeEnabled => $composableBuilder(
      column: $table.aiModeEnabled, builder: (column) => column);

  GeneratedColumn<bool> get microphoneEnabled => $composableBuilder(
      column: $table.microphoneEnabled, builder: (column) => column);

  GeneratedColumn<bool> get smartAlarmEnabled => $composableBuilder(
      column: $table.smartAlarmEnabled, builder: (column) => column);

  GeneratedColumn<bool> get bedtimeReminderEnabled => $composableBuilder(
      column: $table.bedtimeReminderEnabled, builder: (column) => column);

  GeneratedColumn<bool> get snoreDetectionEnabled => $composableBuilder(
      column: $table.snoreDetectionEnabled, builder: (column) => column);

  GeneratedColumn<double> get sleepGoalHours => $composableBuilder(
      column: $table.sleepGoalHours, builder: (column) => column);

  GeneratedColumn<int> get bedtimeHour => $composableBuilder(
      column: $table.bedtimeHour, builder: (column) => column);

  GeneratedColumn<int> get bedtimeMinute => $composableBuilder(
      column: $table.bedtimeMinute, builder: (column) => column);

  GeneratedColumn<int> get wakeHour =>
      $composableBuilder(column: $table.wakeHour, builder: (column) => column);

  GeneratedColumn<int> get wakeMinute => $composableBuilder(
      column: $table.wakeMinute, builder: (column) => column);

  GeneratedColumn<int> get smartAlarmWindowMinutes => $composableBuilder(
      column: $table.smartAlarmWindowMinutes, builder: (column) => column);

  GeneratedColumn<String> get claudeApiKey => $composableBuilder(
      column: $table.claudeApiKey, builder: (column) => column);

  GeneratedColumn<String> get openAiApiKey => $composableBuilder(
      column: $table.openAiApiKey, builder: (column) => column);

  GeneratedColumn<String> get preferredAiProvider => $composableBuilder(
      column: $table.preferredAiProvider, builder: (column) => column);
}

class $$UserSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserSettingsTable,
    UserSetting,
    $$UserSettingsTableFilterComposer,
    $$UserSettingsTableOrderingComposer,
    $$UserSettingsTableAnnotationComposer,
    $$UserSettingsTableCreateCompanionBuilder,
    $$UserSettingsTableUpdateCompanionBuilder,
    (
      UserSetting,
      BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>
    ),
    UserSetting,
    PrefetchHooks Function()> {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> darkMode = const Value.absent(),
            Value<bool> aiModeEnabled = const Value.absent(),
            Value<bool> microphoneEnabled = const Value.absent(),
            Value<bool> smartAlarmEnabled = const Value.absent(),
            Value<bool> bedtimeReminderEnabled = const Value.absent(),
            Value<bool> snoreDetectionEnabled = const Value.absent(),
            Value<double> sleepGoalHours = const Value.absent(),
            Value<int> bedtimeHour = const Value.absent(),
            Value<int> bedtimeMinute = const Value.absent(),
            Value<int> wakeHour = const Value.absent(),
            Value<int> wakeMinute = const Value.absent(),
            Value<int> smartAlarmWindowMinutes = const Value.absent(),
            Value<String?> claudeApiKey = const Value.absent(),
            Value<String?> openAiApiKey = const Value.absent(),
            Value<String> preferredAiProvider = const Value.absent(),
          }) =>
              UserSettingsCompanion(
            id: id,
            darkMode: darkMode,
            aiModeEnabled: aiModeEnabled,
            microphoneEnabled: microphoneEnabled,
            smartAlarmEnabled: smartAlarmEnabled,
            bedtimeReminderEnabled: bedtimeReminderEnabled,
            snoreDetectionEnabled: snoreDetectionEnabled,
            sleepGoalHours: sleepGoalHours,
            bedtimeHour: bedtimeHour,
            bedtimeMinute: bedtimeMinute,
            wakeHour: wakeHour,
            wakeMinute: wakeMinute,
            smartAlarmWindowMinutes: smartAlarmWindowMinutes,
            claudeApiKey: claudeApiKey,
            openAiApiKey: openAiApiKey,
            preferredAiProvider: preferredAiProvider,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool darkMode,
            required bool aiModeEnabled,
            required bool microphoneEnabled,
            required bool smartAlarmEnabled,
            required bool bedtimeReminderEnabled,
            required bool snoreDetectionEnabled,
            required double sleepGoalHours,
            required int bedtimeHour,
            required int bedtimeMinute,
            required int wakeHour,
            required int wakeMinute,
            required int smartAlarmWindowMinutes,
            Value<String?> claudeApiKey = const Value.absent(),
            Value<String?> openAiApiKey = const Value.absent(),
            required String preferredAiProvider,
          }) =>
              UserSettingsCompanion.insert(
            id: id,
            darkMode: darkMode,
            aiModeEnabled: aiModeEnabled,
            microphoneEnabled: microphoneEnabled,
            smartAlarmEnabled: smartAlarmEnabled,
            bedtimeReminderEnabled: bedtimeReminderEnabled,
            snoreDetectionEnabled: snoreDetectionEnabled,
            sleepGoalHours: sleepGoalHours,
            bedtimeHour: bedtimeHour,
            bedtimeMinute: bedtimeMinute,
            wakeHour: wakeHour,
            wakeMinute: wakeMinute,
            smartAlarmWindowMinutes: smartAlarmWindowMinutes,
            claudeApiKey: claudeApiKey,
            openAiApiKey: openAiApiKey,
            preferredAiProvider: preferredAiProvider,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserSettingsTable,
    UserSetting,
    $$UserSettingsTableFilterComposer,
    $$UserSettingsTableOrderingComposer,
    $$UserSettingsTableAnnotationComposer,
    $$UserSettingsTableCreateCompanionBuilder,
    $$UserSettingsTableUpdateCompanionBuilder,
    (
      UserSetting,
      BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>
    ),
    UserSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SleepSessionsTableTableManager get sleepSessions =>
      $$SleepSessionsTableTableManager(_db, _db.sleepSessions);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
}
