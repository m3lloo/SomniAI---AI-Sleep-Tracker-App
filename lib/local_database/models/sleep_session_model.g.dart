// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSleepSessionModelCollection on Isar {
  IsarCollection<SleepSessionModel> get sleepSessionModels => this.collection();
}

const SleepSessionModelSchema = CollectionSchema(
  name: r'SleepSessionModel',
  id: -3504377838175565604,
  properties: {
    r'avgNoiseLevel': PropertySchema(
      id: 0,
      name: r'avgNoiseLevel',
      type: IsarType.double,
    ),
    r'consistencyScore': PropertySchema(
      id: 1,
      name: r'consistencyScore',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'durationFormatted': PropertySchema(
      id: 3,
      name: r'durationFormatted',
      type: IsarType.string,
    ),
    r'durationHours': PropertySchema(
      id: 4,
      name: r'durationHours',
      type: IsarType.double,
    ),
    r'estimatedAwakeTime': PropertySchema(
      id: 5,
      name: r'estimatedAwakeTime',
      type: IsarType.long,
    ),
    r'estimatedDeepSleep': PropertySchema(
      id: 6,
      name: r'estimatedDeepSleep',
      type: IsarType.long,
    ),
    r'estimatedLightSleep': PropertySchema(
      id: 7,
      name: r'estimatedLightSleep',
      type: IsarType.long,
    ),
    r'estimatedRemSleep': PropertySchema(
      id: 8,
      name: r'estimatedRemSleep',
      type: IsarType.long,
    ),
    r'interruptions': PropertySchema(
      id: 9,
      name: r'interruptions',
      type: IsarType.long,
    ),
    r'metSleepGoal': PropertySchema(
      id: 10,
      name: r'metSleepGoal',
      type: IsarType.bool,
    ),
    r'movementScore': PropertySchema(
      id: 11,
      name: r'movementScore',
      type: IsarType.double,
    ),
    r'notes': PropertySchema(
      id: 12,
      name: r'notes',
      type: IsarType.string,
    ),
    r'scoreLabel': PropertySchema(
      id: 13,
      name: r'scoreLabel',
      type: IsarType.string,
    ),
    r'sleepScore': PropertySchema(
      id: 14,
      name: r'sleepScore',
      type: IsarType.long,
    ),
    r'sleepTime': PropertySchema(
      id: 15,
      name: r'sleepTime',
      type: IsarType.dateTime,
    ),
    r'snoreDetected': PropertySchema(
      id: 16,
      name: r'snoreDetected',
      type: IsarType.bool,
    ),
    r'snoreEventCount': PropertySchema(
      id: 17,
      name: r'snoreEventCount',
      type: IsarType.long,
    ),
    r'wakeTime': PropertySchema(
      id: 18,
      name: r'wakeTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sleepSessionModelEstimateSize,
  serialize: _sleepSessionModelSerialize,
  deserialize: _sleepSessionModelDeserialize,
  deserializeProp: _sleepSessionModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'sleepTime': IndexSchema(
      id: 2231004920352096859,
      name: r'sleepTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sleepTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sleepSessionModelGetId,
  getLinks: _sleepSessionModelGetLinks,
  attach: _sleepSessionModelAttach,
  version: '3.1.0+1',
);

int _sleepSessionModelEstimateSize(
  SleepSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.durationFormatted.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.scoreLabel.length * 3;
  return bytesCount;
}

void _sleepSessionModelSerialize(
  SleepSessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.avgNoiseLevel);
  writer.writeLong(offsets[1], object.consistencyScore);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeString(offsets[3], object.durationFormatted);
  writer.writeDouble(offsets[4], object.durationHours);
  writer.writeLong(offsets[5], object.estimatedAwakeTime);
  writer.writeLong(offsets[6], object.estimatedDeepSleep);
  writer.writeLong(offsets[7], object.estimatedLightSleep);
  writer.writeLong(offsets[8], object.estimatedRemSleep);
  writer.writeLong(offsets[9], object.interruptions);
  writer.writeBool(offsets[10], object.metSleepGoal);
  writer.writeDouble(offsets[11], object.movementScore);
  writer.writeString(offsets[12], object.notes);
  writer.writeString(offsets[13], object.scoreLabel);
  writer.writeLong(offsets[14], object.sleepScore);
  writer.writeDateTime(offsets[15], object.sleepTime);
  writer.writeBool(offsets[16], object.snoreDetected);
  writer.writeLong(offsets[17], object.snoreEventCount);
  writer.writeDateTime(offsets[18], object.wakeTime);
}

SleepSessionModel _sleepSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SleepSessionModel();
  object.avgNoiseLevel = reader.readDouble(offsets[0]);
  object.consistencyScore = reader.readLong(offsets[1]);
  object.durationHours = reader.readDouble(offsets[4]);
  object.estimatedAwakeTime = reader.readLong(offsets[5]);
  object.estimatedDeepSleep = reader.readLong(offsets[6]);
  object.estimatedLightSleep = reader.readLong(offsets[7]);
  object.estimatedRemSleep = reader.readLong(offsets[8]);
  object.id = id;
  object.interruptions = reader.readLong(offsets[9]);
  object.metSleepGoal = reader.readBool(offsets[10]);
  object.movementScore = reader.readDouble(offsets[11]);
  object.notes = reader.readStringOrNull(offsets[12]);
  object.sleepScore = reader.readLong(offsets[14]);
  object.sleepTime = reader.readDateTime(offsets[15]);
  object.snoreDetected = reader.readBool(offsets[16]);
  object.snoreEventCount = reader.readLong(offsets[17]);
  object.wakeTime = reader.readDateTime(offsets[18]);
  return object;
}

P _sleepSessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sleepSessionModelGetId(SleepSessionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sleepSessionModelGetLinks(SleepSessionModel object) {
  return [];
}

void _sleepSessionModelAttach(IsarCollection<dynamic> col, Id id, SleepSessionModel object) {
  object.id = id;
}

extension SleepSessionModelQueryWhereSort
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QWhere> {
  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhere> anySleepTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sleepTime'),
      );
    });
  }
}

extension SleepSessionModelQueryWhere
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QWhereClause> {
  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> sleepTimeEqualTo(
      DateTime sleepTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sleepTime',
        value: [sleepTime],
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> sleepTimeNotEqualTo(
      DateTime sleepTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sleepTime',
              lower: [],
              upper: [sleepTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sleepTime',
              lower: [sleepTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sleepTime',
              lower: [sleepTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sleepTime',
              lower: [],
              upper: [sleepTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> sleepTimeGreaterThan(
    DateTime sleepTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sleepTime',
        lower: [sleepTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> sleepTimeLessThan(
    DateTime sleepTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sleepTime',
        lower: [],
        upper: [sleepTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterWhereClause> sleepTimeBetween(
    DateTime lowerSleepTime,
    DateTime upperSleepTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sleepTime',
        lower: [lowerSleepTime],
        includeLower: includeLower,
        upper: [upperSleepTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SleepSessionModelQueryFilter
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QFilterCondition> {
  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> avgNoiseLevelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgNoiseLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      avgNoiseLevelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avgNoiseLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> avgNoiseLevelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avgNoiseLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> avgNoiseLevelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avgNoiseLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> consistencyScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consistencyScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      consistencyScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consistencyScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      consistencyScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consistencyScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> consistencyScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consistencyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationFormatted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationFormatted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationFormatted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationFormatted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'durationFormatted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'durationFormatted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'durationFormatted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'durationFormatted',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationFormatted',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationFormattedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'durationFormatted',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> durationHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      durationHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> durationHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> durationHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedAwakeTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedAwakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedAwakeTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedAwakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedAwakeTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedAwakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedAwakeTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedAwakeTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedDeepSleepEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedDeepSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedDeepSleepGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedDeepSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedDeepSleepLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedDeepSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedDeepSleepBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedDeepSleep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedLightSleepEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedLightSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedLightSleepGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedLightSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedLightSleepLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedLightSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedLightSleepBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedLightSleep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedRemSleepEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedRemSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedRemSleepGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedRemSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedRemSleepLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedRemSleep',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      estimatedRemSleepBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedRemSleep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> interruptionsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interruptions',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      interruptionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interruptions',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> interruptionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interruptions',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> interruptionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interruptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> metSleepGoalEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metSleepGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> movementScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movementScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      movementScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movementScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> movementScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movementScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> movementScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movementScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scoreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scoreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scoreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scoreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scoreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scoreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scoreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scoreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scoreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> scoreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scoreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> sleepTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> snoreDetectedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snoreDetected',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> snoreEventCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snoreEventCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition>
      snoreEventCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snoreEventCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> snoreEventCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snoreEventCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> snoreEventCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snoreEventCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> wakeTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> wakeTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> wakeTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wakeTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterFilterCondition> wakeTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wakeTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SleepSessionModelQueryObject
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QFilterCondition> {}

extension SleepSessionModelQueryLinks
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QFilterCondition> {}

extension SleepSessionModelQuerySortBy
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QSortBy> {
  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByAvgNoiseLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgNoiseLevel', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByAvgNoiseLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgNoiseLevel', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByConsistencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByDurationFormatted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormatted', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByDurationFormattedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormatted', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByDurationHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByDurationHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedAwakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedAwakeTime', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedAwakeTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedAwakeTime', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedDeepSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeepSleep', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedDeepSleepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeepSleep', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedLightSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedLightSleep', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedLightSleepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedLightSleep', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedRemSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedRemSleep', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByEstimatedRemSleepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedRemSleep', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByInterruptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interruptions', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByInterruptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interruptions', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByMetSleepGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metSleepGoal', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByMetSleepGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metSleepGoal', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByMovementScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementScore', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByMovementScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementScore', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByScoreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreLabel', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByScoreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreLabel', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySleepScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySleepTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepTime', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySleepTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepTime', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySnoreDetected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetected', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySnoreDetectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetected', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySnoreEventCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreEventCount', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortBySnoreEventCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreEventCount', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByWakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> sortByWakeTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.desc);
    });
  }
}

extension SleepSessionModelQuerySortThenBy
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QSortThenBy> {
  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByAvgNoiseLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgNoiseLevel', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByAvgNoiseLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgNoiseLevel', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByConsistencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByDurationFormatted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormatted', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByDurationFormattedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationFormatted', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByDurationHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByDurationHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedAwakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedAwakeTime', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedAwakeTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedAwakeTime', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedDeepSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeepSleep', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedDeepSleepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeepSleep', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedLightSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedLightSleep', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedLightSleepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedLightSleep', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedRemSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedRemSleep', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByEstimatedRemSleepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedRemSleep', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByInterruptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interruptions', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByInterruptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interruptions', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByMetSleepGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metSleepGoal', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByMetSleepGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metSleepGoal', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByMovementScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementScore', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByMovementScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementScore', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByScoreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreLabel', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByScoreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreLabel', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySleepScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySleepTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepTime', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySleepTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepTime', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySnoreDetected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetected', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySnoreDetectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetected', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySnoreEventCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreEventCount', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenBySnoreEventCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreEventCount', Sort.desc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByWakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.asc);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QAfterSortBy> thenByWakeTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeTime', Sort.desc);
    });
  }
}

extension SleepSessionModelQueryWhereDistinct
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> {
  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByAvgNoiseLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgNoiseLevel');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consistencyScore');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByDurationFormatted(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationFormatted', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByDurationHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationHours');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByEstimatedAwakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedAwakeTime');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByEstimatedDeepSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDeepSleep');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByEstimatedLightSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedLightSleep');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByEstimatedRemSleep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedRemSleep');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByInterruptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interruptions');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByMetSleepGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metSleepGoal');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByMovementScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'movementScore');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByScoreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepScore');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctBySleepTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepTime');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctBySnoreDetected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snoreDetected');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctBySnoreEventCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snoreEventCount');
    });
  }

  QueryBuilder<SleepSessionModel, SleepSessionModel, QDistinct> distinctByWakeTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wakeTime');
    });
  }
}

extension SleepSessionModelQueryProperty
    on QueryBuilder<SleepSessionModel, SleepSessionModel, QQueryProperty> {
  QueryBuilder<SleepSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SleepSessionModel, double, QQueryOperations> avgNoiseLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgNoiseLevel');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> consistencyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consistencyScore');
    });
  }

  QueryBuilder<SleepSessionModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<SleepSessionModel, String, QQueryOperations> durationFormattedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationFormatted');
    });
  }

  QueryBuilder<SleepSessionModel, double, QQueryOperations> durationHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationHours');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> estimatedAwakeTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedAwakeTime');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> estimatedDeepSleepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDeepSleep');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> estimatedLightSleepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedLightSleep');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> estimatedRemSleepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedRemSleep');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> interruptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interruptions');
    });
  }

  QueryBuilder<SleepSessionModel, bool, QQueryOperations> metSleepGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metSleepGoal');
    });
  }

  QueryBuilder<SleepSessionModel, double, QQueryOperations> movementScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movementScore');
    });
  }

  QueryBuilder<SleepSessionModel, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<SleepSessionModel, String, QQueryOperations> scoreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreLabel');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> sleepScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepScore');
    });
  }

  QueryBuilder<SleepSessionModel, DateTime, QQueryOperations> sleepTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepTime');
    });
  }

  QueryBuilder<SleepSessionModel, bool, QQueryOperations> snoreDetectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snoreDetected');
    });
  }

  QueryBuilder<SleepSessionModel, int, QQueryOperations> snoreEventCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snoreEventCount');
    });
  }

  QueryBuilder<SleepSessionModel, DateTime, QQueryOperations> wakeTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wakeTime');
    });
  }
}
