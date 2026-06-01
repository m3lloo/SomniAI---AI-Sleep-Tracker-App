// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsModelCollection on Isar {
  IsarCollection<UserSettingsModel> get userSettingsModels => this.collection();
}

const UserSettingsModelSchema = CollectionSchema(
  name: r'UserSettingsModel',
  id: 1840420974923084997,
  properties: {
    r'aiModeEnabled': PropertySchema(
      id: 0,
      name: r'aiModeEnabled',
      type: IsarType.bool,
    ),
    r'bedtimeHour': PropertySchema(
      id: 1,
      name: r'bedtimeHour',
      type: IsarType.long,
    ),
    r'bedtimeMinute': PropertySchema(
      id: 2,
      name: r'bedtimeMinute',
      type: IsarType.long,
    ),
    r'bedtimeReminderEnabled': PropertySchema(
      id: 3,
      name: r'bedtimeReminderEnabled',
      type: IsarType.bool,
    ),
    r'claudeApiKey': PropertySchema(
      id: 4,
      name: r'claudeApiKey',
      type: IsarType.string,
    ),
    r'darkMode': PropertySchema(
      id: 5,
      name: r'darkMode',
      type: IsarType.bool,
    ),
    r'microphoneEnabled': PropertySchema(
      id: 6,
      name: r'microphoneEnabled',
      type: IsarType.bool,
    ),
    r'openAiApiKey': PropertySchema(
      id: 7,
      name: r'openAiApiKey',
      type: IsarType.string,
    ),
    r'preferredAiProvider': PropertySchema(
      id: 8,
      name: r'preferredAiProvider',
      type: IsarType.string,
    ),
    r'sleepGoalHours': PropertySchema(
      id: 9,
      name: r'sleepGoalHours',
      type: IsarType.double,
    ),
    r'smartAlarmEnabled': PropertySchema(
      id: 10,
      name: r'smartAlarmEnabled',
      type: IsarType.bool,
    ),
    r'smartAlarmWindowMinutes': PropertySchema(
      id: 11,
      name: r'smartAlarmWindowMinutes',
      type: IsarType.long,
    ),
    r'snoreDetectionEnabled': PropertySchema(
      id: 12,
      name: r'snoreDetectionEnabled',
      type: IsarType.bool,
    ),
    r'wakeHour': PropertySchema(
      id: 13,
      name: r'wakeHour',
      type: IsarType.long,
    ),
    r'wakeMinute': PropertySchema(
      id: 14,
      name: r'wakeMinute',
      type: IsarType.long,
    )
  },
  estimateSize: _userSettingsModelEstimateSize,
  serialize: _userSettingsModelSerialize,
  deserialize: _userSettingsModelDeserialize,
  deserializeProp: _userSettingsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userSettingsModelGetId,
  getLinks: _userSettingsModelGetLinks,
  attach: _userSettingsModelAttach,
  version: '3.1.0+1',
);

int _userSettingsModelEstimateSize(
  UserSettingsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.claudeApiKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.openAiApiKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredAiProvider.length * 3;
  return bytesCount;
}

void _userSettingsModelSerialize(
  UserSettingsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.aiModeEnabled);
  writer.writeLong(offsets[1], object.bedtimeHour);
  writer.writeLong(offsets[2], object.bedtimeMinute);
  writer.writeBool(offsets[3], object.bedtimeReminderEnabled);
  writer.writeString(offsets[4], object.claudeApiKey);
  writer.writeBool(offsets[5], object.darkMode);
  writer.writeBool(offsets[6], object.microphoneEnabled);
  writer.writeString(offsets[7], object.openAiApiKey);
  writer.writeString(offsets[8], object.preferredAiProvider);
  writer.writeDouble(offsets[9], object.sleepGoalHours);
  writer.writeBool(offsets[10], object.smartAlarmEnabled);
  writer.writeLong(offsets[11], object.smartAlarmWindowMinutes);
  writer.writeBool(offsets[12], object.snoreDetectionEnabled);
  writer.writeLong(offsets[13], object.wakeHour);
  writer.writeLong(offsets[14], object.wakeMinute);
}

UserSettingsModel _userSettingsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettingsModel();
  object.aiModeEnabled = reader.readBool(offsets[0]);
  object.bedtimeHour = reader.readLong(offsets[1]);
  object.bedtimeMinute = reader.readLong(offsets[2]);
  object.bedtimeReminderEnabled = reader.readBool(offsets[3]);
  object.claudeApiKey = reader.readStringOrNull(offsets[4]);
  object.darkMode = reader.readBool(offsets[5]);
  object.id = id;
  object.microphoneEnabled = reader.readBool(offsets[6]);
  object.openAiApiKey = reader.readStringOrNull(offsets[7]);
  object.preferredAiProvider = reader.readString(offsets[8]);
  object.sleepGoalHours = reader.readDouble(offsets[9]);
  object.smartAlarmEnabled = reader.readBool(offsets[10]);
  object.smartAlarmWindowMinutes = reader.readLong(offsets[11]);
  object.snoreDetectionEnabled = reader.readBool(offsets[12]);
  object.wakeHour = reader.readLong(offsets[13]);
  object.wakeMinute = reader.readLong(offsets[14]);
  return object;
}

P _userSettingsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingsModelGetId(UserSettingsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSettingsModelGetLinks(UserSettingsModel object) {
  return [];
}

void _userSettingsModelAttach(IsarCollection<dynamic> col, Id id, UserSettingsModel object) {
  object.id = id;
}

extension UserSettingsModelQueryWhereSort
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QWhere> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSettingsModelQueryWhere
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QWhereClause> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterWhereClause> idBetween(
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
}

extension UserSettingsModelQueryFilter
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QFilterCondition> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> aiModeEnabledEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiModeEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeHourEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bedtimeHour',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeHourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bedtimeHour',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeHourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bedtimeHour',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bedtimeHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeMinuteEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bedtimeMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      bedtimeMinuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bedtimeMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeMinuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bedtimeMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> bedtimeMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bedtimeMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      bedtimeReminderEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bedtimeReminderEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'claudeApiKey',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      claudeApiKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'claudeApiKey',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'claudeApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'claudeApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'claudeApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'claudeApiKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'claudeApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'claudeApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'claudeApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'claudeApiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> claudeApiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'claudeApiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      claudeApiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'claudeApiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> darkModeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      microphoneEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'microphoneEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openAiApiKey',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      openAiApiKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openAiApiKey',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openAiApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openAiApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openAiApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openAiApiKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'openAiApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'openAiApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openAiApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openAiApiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> openAiApiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openAiApiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      openAiApiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openAiApiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredAiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredAiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredAiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredAiProvider',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredAiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredAiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredAiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredAiProvider',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredAiProvider',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      preferredAiProviderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredAiProvider',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> sleepGoalHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepGoalHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      sleepGoalHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepGoalHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> sleepGoalHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepGoalHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> sleepGoalHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepGoalHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      smartAlarmEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartAlarmEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      smartAlarmWindowMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartAlarmWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      smartAlarmWindowMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smartAlarmWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      smartAlarmWindowMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smartAlarmWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      smartAlarmWindowMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smartAlarmWindowMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition>
      snoreDetectionEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snoreDetectionEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeHourEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wakeHour',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeHourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wakeHour',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeHourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wakeHour',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wakeHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeMinuteEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wakeMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeMinuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wakeMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeMinuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wakeMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterFilterCondition> wakeMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wakeMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserSettingsModelQueryObject
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QFilterCondition> {}

extension UserSettingsModelQueryLinks
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QFilterCondition> {}

extension UserSettingsModelQuerySortBy
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QSortBy> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByAiModeEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiModeEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByAiModeEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiModeEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByBedtimeHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeHour', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByBedtimeHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeHour', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByBedtimeMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeMinute', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByBedtimeMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeMinute', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByBedtimeReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortByBedtimeReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByClaudeApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claudeApiKey', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByClaudeApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claudeApiKey', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByMicrophoneEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microphoneEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByMicrophoneEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microphoneEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByOpenAiApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAiApiKey', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByOpenAiApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAiApiKey', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByPreferredAiProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredAiProvider', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByPreferredAiProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredAiProvider', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortBySleepGoalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepGoalHours', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortBySleepGoalHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepGoalHours', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortBySmartAlarmEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortBySmartAlarmEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortBySmartAlarmWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortBySmartAlarmWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortBySnoreDetectionEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetectionEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      sortBySnoreDetectionEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetectionEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByWakeHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeHour', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByWakeHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeHour', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByWakeMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeMinute', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> sortByWakeMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeMinute', Sort.desc);
    });
  }
}

extension UserSettingsModelQuerySortThenBy
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QSortThenBy> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByAiModeEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiModeEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByAiModeEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiModeEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByBedtimeHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeHour', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByBedtimeHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeHour', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByBedtimeMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeMinute', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByBedtimeMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeMinute', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByBedtimeReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenByBedtimeReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimeReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByClaudeApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claudeApiKey', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByClaudeApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claudeApiKey', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByMicrophoneEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microphoneEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByMicrophoneEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microphoneEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByOpenAiApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAiApiKey', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByOpenAiApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAiApiKey', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByPreferredAiProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredAiProvider', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByPreferredAiProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredAiProvider', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenBySleepGoalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepGoalHours', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenBySleepGoalHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepGoalHours', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenBySmartAlarmEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenBySmartAlarmEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenBySmartAlarmWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenBySmartAlarmWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartAlarmWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenBySnoreDetectionEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetectionEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy>
      thenBySnoreDetectionEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snoreDetectionEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByWakeHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeHour', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByWakeHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeHour', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByWakeMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeMinute', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QAfterSortBy> thenByWakeMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wakeMinute', Sort.desc);
    });
  }
}

extension UserSettingsModelQueryWhereDistinct
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> {
  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByAiModeEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiModeEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByBedtimeHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bedtimeHour');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByBedtimeMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bedtimeMinute');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByBedtimeReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bedtimeReminderEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByClaudeApiKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'claudeApiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByMicrophoneEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'microphoneEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByOpenAiApiKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openAiApiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByPreferredAiProvider(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredAiProvider', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctBySleepGoalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepGoalHours');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctBySmartAlarmEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartAlarmEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct>
      distinctBySmartAlarmWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartAlarmWindowMinutes');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctBySnoreDetectionEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snoreDetectionEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByWakeHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wakeHour');
    });
  }

  QueryBuilder<UserSettingsModel, UserSettingsModel, QDistinct> distinctByWakeMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wakeMinute');
    });
  }
}

extension UserSettingsModelQueryProperty
    on QueryBuilder<UserSettingsModel, UserSettingsModel, QQueryProperty> {
  QueryBuilder<UserSettingsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettingsModel, bool, QQueryOperations> aiModeEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiModeEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, int, QQueryOperations> bedtimeHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bedtimeHour');
    });
  }

  QueryBuilder<UserSettingsModel, int, QQueryOperations> bedtimeMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bedtimeMinute');
    });
  }

  QueryBuilder<UserSettingsModel, bool, QQueryOperations> bedtimeReminderEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bedtimeReminderEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, String?, QQueryOperations> claudeApiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'claudeApiKey');
    });
  }

  QueryBuilder<UserSettingsModel, bool, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }

  QueryBuilder<UserSettingsModel, bool, QQueryOperations> microphoneEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'microphoneEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, String?, QQueryOperations> openAiApiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openAiApiKey');
    });
  }

  QueryBuilder<UserSettingsModel, String, QQueryOperations> preferredAiProviderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredAiProvider');
    });
  }

  QueryBuilder<UserSettingsModel, double, QQueryOperations> sleepGoalHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepGoalHours');
    });
  }

  QueryBuilder<UserSettingsModel, bool, QQueryOperations> smartAlarmEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartAlarmEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, int, QQueryOperations> smartAlarmWindowMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartAlarmWindowMinutes');
    });
  }

  QueryBuilder<UserSettingsModel, bool, QQueryOperations> snoreDetectionEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snoreDetectionEnabled');
    });
  }

  QueryBuilder<UserSettingsModel, int, QQueryOperations> wakeHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wakeHour');
    });
  }

  QueryBuilder<UserSettingsModel, int, QQueryOperations> wakeMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wakeMinute');
    });
  }
}
