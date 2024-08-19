// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationSettingModelCollection on Isar {
  IsarCollection<NotificationSettingModel> get notificationSettingModels =>
      this.collection();
}

const NotificationSettingModelSchema = CollectionSchema(
  name: r'NotificationSettingModel',
  id: 1172563549234948090,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'dayOfMonth': PropertySchema(
      id: 1,
      name: r'dayOfMonth',
      type: IsarType.long,
    ),
    r'hour': PropertySchema(
      id: 2,
      name: r'hour',
      type: IsarType.long,
    ),
    r'isEasterRelated': PropertySchema(
      id: 3,
      name: r'isEasterRelated',
      type: IsarType.bool,
    ),
    r'isEnabled': PropertySchema(
      id: 4,
      name: r'isEnabled',
      type: IsarType.bool,
    ),
    r'minute': PropertySchema(
      id: 5,
      name: r'minute',
      type: IsarType.long,
    ),
    r'monthOfYear': PropertySchema(
      id: 6,
      name: r'monthOfYear',
      type: IsarType.long,
    ),
    r'monthlyRecurrenceType': PropertySchema(
      id: 7,
      name: r'monthlyRecurrenceType',
      type: IsarType.byte,
      enumMap: _NotificationSettingModelmonthlyRecurrenceTypeEnumValueMap,
    ),
    r'notificationID': PropertySchema(
      id: 8,
      name: r'notificationID',
      type: IsarType.long,
    ),
    r'recurrenceCount': PropertySchema(
      id: 9,
      name: r'recurrenceCount',
      type: IsarType.long,
    ),
    r'recurrenceEnd': PropertySchema(
      id: 10,
      name: r'recurrenceEnd',
      type: IsarType.byte,
      enumMap: _NotificationSettingModelrecurrenceEndEnumValueMap,
    ),
    r'recurrenceEndDate': PropertySchema(
      id: 11,
      name: r'recurrenceEndDate',
      type: IsarType.dateTime,
    ),
    r'recurrenceInterval': PropertySchema(
      id: 12,
      name: r'recurrenceInterval',
      type: IsarType.long,
    ),
    r'recurrenceType': PropertySchema(
      id: 13,
      name: r'recurrenceType',
      type: IsarType.byte,
      enumMap: _NotificationSettingModelrecurrenceTypeEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 14,
      name: r'type',
      type: IsarType.byte,
      enumMap: _NotificationSettingModeltypeEnumValueMap,
    ),
    r'weekOfMonth': PropertySchema(
      id: 15,
      name: r'weekOfMonth',
      type: IsarType.long,
    ),
    r'weekdays': PropertySchema(
      id: 16,
      name: r'weekdays',
      type: IsarType.longList,
    )
  },
  estimateSize: _notificationSettingModelEstimateSize,
  serialize: _notificationSettingModelSerialize,
  deserialize: _notificationSettingModelDeserialize,
  deserializeProp: _notificationSettingModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'notificationID': IndexSchema(
      id: -7217136984975172681,
      name: r'notificationID',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'notificationID',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isEnabled': IndexSchema(
      id: 1854025363566937220,
      name: r'isEnabled',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isEnabled',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _notificationSettingModelGetId,
  getLinks: _notificationSettingModelGetLinks,
  attach: _notificationSettingModelAttach,
  version: '3.1.0+1',
);

int _notificationSettingModelEstimateSize(
  NotificationSettingModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.weekdays;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _notificationSettingModelSerialize(
  NotificationSettingModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeLong(offsets[1], object.dayOfMonth);
  writer.writeLong(offsets[2], object.hour);
  writer.writeBool(offsets[3], object.isEasterRelated);
  writer.writeBool(offsets[4], object.isEnabled);
  writer.writeLong(offsets[5], object.minute);
  writer.writeLong(offsets[6], object.monthOfYear);
  writer.writeByte(offsets[7], object.monthlyRecurrenceType.index);
  writer.writeLong(offsets[8], object.notificationID);
  writer.writeLong(offsets[9], object.recurrenceCount);
  writer.writeByte(offsets[10], object.recurrenceEnd.index);
  writer.writeDateTime(offsets[11], object.recurrenceEndDate);
  writer.writeLong(offsets[12], object.recurrenceInterval);
  writer.writeByte(offsets[13], object.recurrenceType.index);
  writer.writeByte(offsets[14], object.type.index);
  writer.writeLong(offsets[15], object.weekOfMonth);
  writer.writeLongList(offsets[16], object.weekdays);
}

NotificationSettingModel _notificationSettingModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationSettingModel(
    dateTime: reader.readDateTime(offsets[0]),
    dayOfMonth: reader.readLongOrNull(offsets[1]),
    hour: reader.readLongOrNull(offsets[2]) ?? AppConfig.defaultReminderHour,
    isEasterRelated: reader.readBoolOrNull(offsets[3]) ?? false,
    isEnabled: reader.readBoolOrNull(offsets[4]) ?? true,
    minute:
        reader.readLongOrNull(offsets[5]) ?? AppConfig.defaultReminderMinute,
    monthOfYear: reader.readLongOrNull(offsets[6]),
    monthlyRecurrenceType:
        _NotificationSettingModelmonthlyRecurrenceTypeValueEnumMap[
                reader.readByteOrNull(offsets[7])] ??
            MonthlyRecurrenceType.dayOfMonth,
    recurrenceCount: reader.readLongOrNull(offsets[9]),
    recurrenceEnd: _NotificationSettingModelrecurrenceEndValueEnumMap[
            reader.readByteOrNull(offsets[10])] ??
        RecurrenceEnd.forever,
    recurrenceEndDate: reader.readDateTimeOrNull(offsets[11]),
    recurrenceInterval: reader.readLongOrNull(offsets[12]) ?? 1,
    recurrenceType: _NotificationSettingModelrecurrenceTypeValueEnumMap[
            reader.readByteOrNull(offsets[13])] ??
        RecurrenceType.none,
    type: _NotificationSettingModeltypeValueEnumMap[
            reader.readByteOrNull(offsets[14])] ??
        NotificationType.oneTime,
    weekOfMonth: reader.readLongOrNull(offsets[15]),
    weekdays: reader.readLongList(offsets[16]),
  );
  object.id = id;
  object.notificationID = reader.readLong(offsets[8]);
  return object;
}

P _notificationSettingModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? AppConfig.defaultReminderHour)
          as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? AppConfig.defaultReminderMinute)
          as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (_NotificationSettingModelmonthlyRecurrenceTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MonthlyRecurrenceType.dayOfMonth) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (_NotificationSettingModelrecurrenceEndValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RecurrenceEnd.forever) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 13:
      return (_NotificationSettingModelrecurrenceTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RecurrenceType.none) as P;
    case 14:
      return (_NotificationSettingModeltypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NotificationType.oneTime) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLongList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NotificationSettingModelmonthlyRecurrenceTypeEnumValueMap = {
  'dayOfMonth': 0,
  'dayOfWeek': 1,
  'none': 2,
};
const _NotificationSettingModelmonthlyRecurrenceTypeValueEnumMap = {
  0: MonthlyRecurrenceType.dayOfMonth,
  1: MonthlyRecurrenceType.dayOfWeek,
  2: MonthlyRecurrenceType.none,
};
const _NotificationSettingModelrecurrenceEndEnumValueMap = {
  'forever': 0,
  'specificNumber': 1,
  'untilDate': 2,
  'upcomingYear': 3,
};
const _NotificationSettingModelrecurrenceEndValueEnumMap = {
  0: RecurrenceEnd.forever,
  1: RecurrenceEnd.specificNumber,
  2: RecurrenceEnd.untilDate,
  3: RecurrenceEnd.upcomingYear,
};
const _NotificationSettingModelrecurrenceTypeEnumValueMap = {
  'daily': 0,
  'weekly': 1,
  'monthly': 2,
  'yearly': 3,
  'none': 4,
};
const _NotificationSettingModelrecurrenceTypeValueEnumMap = {
  0: RecurrenceType.daily,
  1: RecurrenceType.weekly,
  2: RecurrenceType.monthly,
  3: RecurrenceType.yearly,
  4: RecurrenceType.none,
};
const _NotificationSettingModeltypeEnumValueMap = {
  'oneTime': 0,
  'recurring': 1,
  'easterDaily': 2,
  'ashWednesday': 3,
  'palmSunday': 4,
  'holyThursday': 5,
  'goodFriday': 6,
  'holySaturday': 7,
  'easterSunday': 8,
};
const _NotificationSettingModeltypeValueEnumMap = {
  0: NotificationType.oneTime,
  1: NotificationType.recurring,
  2: NotificationType.easterDaily,
  3: NotificationType.ashWednesday,
  4: NotificationType.palmSunday,
  5: NotificationType.holyThursday,
  6: NotificationType.goodFriday,
  7: NotificationType.holySaturday,
  8: NotificationType.easterSunday,
};

Id _notificationSettingModelGetId(NotificationSettingModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationSettingModelGetLinks(
    NotificationSettingModel object) {
  return [];
}

void _notificationSettingModelAttach(
    IsarCollection<dynamic> col, Id id, NotificationSettingModel object) {
  object.id = id;
}

extension NotificationSettingModelQueryWhereSort on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QWhere> {
  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterWhere>
      anyNotificationID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'notificationID'),
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterWhere>
      anyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'type'),
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterWhere>
      anyIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isEnabled'),
      );
    });
  }
}

extension NotificationSettingModelQueryWhere on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QWhereClause> {
  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> notificationIDEqualTo(int notificationID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'notificationID',
        value: [notificationID],
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> notificationIDNotEqualTo(int notificationID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationID',
              lower: [],
              upper: [notificationID],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationID',
              lower: [notificationID],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationID',
              lower: [notificationID],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notificationID',
              lower: [],
              upper: [notificationID],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> notificationIDGreaterThan(
    int notificationID, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationID',
        lower: [notificationID],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> notificationIDLessThan(
    int notificationID, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationID',
        lower: [],
        upper: [notificationID],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> notificationIDBetween(
    int lowerNotificationID,
    int upperNotificationID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'notificationID',
        lower: [lowerNotificationID],
        includeLower: includeLower,
        upper: [upperNotificationID],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> typeEqualTo(NotificationType type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'type',
        value: [type],
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> typeNotEqualTo(NotificationType type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [type],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'type',
              lower: [],
              upper: [type],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> typeGreaterThan(
    NotificationType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'type',
        lower: [type],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> typeLessThan(
    NotificationType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'type',
        lower: [],
        upper: [type],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> typeBetween(
    NotificationType lowerType,
    NotificationType upperType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'type',
        lower: [lowerType],
        includeLower: includeLower,
        upper: [upperType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> isEnabledEqualTo(bool isEnabled) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isEnabled',
        value: [isEnabled],
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterWhereClause> isEnabledNotEqualTo(bool isEnabled) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isEnabled',
              lower: [],
              upper: [isEnabled],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isEnabled',
              lower: [isEnabled],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isEnabled',
              lower: [isEnabled],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isEnabled',
              lower: [],
              upper: [isEnabled],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NotificationSettingModelQueryFilter on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QFilterCondition> {
  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dayOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dayOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dayOfMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dayOfMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dayOfMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> dayOfMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> hourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> hourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> hourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> hourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> isEasterRelatedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEasterRelated',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> isEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> minuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> minuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> minuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> minuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthOfYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'monthOfYear',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthOfYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'monthOfYear',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthOfYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthOfYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthOfYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthOfYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthOfYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
          QAfterFilterCondition>
      monthlyRecurrenceTypeEqualTo(MonthlyRecurrenceType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyRecurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthlyRecurrenceTypeGreaterThan(
    MonthlyRecurrenceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyRecurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthlyRecurrenceTypeLessThan(
    MonthlyRecurrenceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyRecurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> monthlyRecurrenceTypeBetween(
    MonthlyRecurrenceType lower,
    MonthlyRecurrenceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyRecurrenceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> notificationIDEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> notificationIDGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> notificationIDLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> notificationIDBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurrenceCount',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurrenceCount',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndEqualTo(RecurrenceEnd value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndGreaterThan(
    RecurrenceEnd value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndLessThan(
    RecurrenceEnd value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndBetween(
    RecurrenceEnd lower,
    RecurrenceEnd upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurrenceEndDate',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurrenceEndDate',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceEndDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceIntervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceIntervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceIntervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceTypeEqualTo(RecurrenceType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceTypeGreaterThan(
    RecurrenceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceTypeLessThan(
    RecurrenceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> recurrenceTypeBetween(
    RecurrenceType lower,
    RecurrenceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> typeEqualTo(NotificationType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> typeGreaterThan(
    NotificationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> typeLessThan(
    NotificationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> typeBetween(
    NotificationType lower,
    NotificationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weekOfMonth',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weekOfMonth',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekOfMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekOfMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekOfMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekOfMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weekdays',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weekdays',
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekdays',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekdays',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekdays',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekdays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel,
      QAfterFilterCondition> weekdaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension NotificationSettingModelQueryObject on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QFilterCondition> {}

extension NotificationSettingModelQueryLinks on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QFilterCondition> {}

extension NotificationSettingModelQuerySortBy on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QSortBy> {
  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByIsEasterRelated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEasterRelated', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByIsEasterRelatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEasterRelated', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByMonthOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByMonthOfYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByMonthlyRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyRecurrenceType', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByMonthlyRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyRecurrenceType', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByNotificationID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationID', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByNotificationIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationID', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceCount', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceCount', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEndDate', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEndDate', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByWeekOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekOfMonth', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      sortByWeekOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekOfMonth', Sort.desc);
    });
  }
}

extension NotificationSettingModelQuerySortThenBy on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QSortThenBy> {
  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByIsEasterRelated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEasterRelated', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByIsEasterRelatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEasterRelated', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByMonthOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByMonthOfYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByMonthlyRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyRecurrenceType', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByMonthlyRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyRecurrenceType', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByNotificationID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationID', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByNotificationIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationID', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceCount', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceCount', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEndDate', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEndDate', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByWeekOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekOfMonth', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QAfterSortBy>
      thenByWeekOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekOfMonth', Sort.desc);
    });
  }
}

extension NotificationSettingModelQueryWhereDistinct on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QDistinct> {
  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfMonth');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByIsEasterRelated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEasterRelated');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minute');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByMonthOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthOfYear');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByMonthlyRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyRecurrenceType');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByNotificationID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationID');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByRecurrenceCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceCount');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByRecurrenceEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceEnd');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByRecurrenceEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceEndDate');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByRecurrenceInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceInterval');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceType');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByWeekOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekOfMonth');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationSettingModel, QDistinct>
      distinctByWeekdays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekdays');
    });
  }
}

extension NotificationSettingModelQueryProperty on QueryBuilder<
    NotificationSettingModel, NotificationSettingModel, QQueryProperty> {
  QueryBuilder<NotificationSettingModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationSettingModel, DateTime, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<NotificationSettingModel, int?, QQueryOperations>
      dayOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfMonth');
    });
  }

  QueryBuilder<NotificationSettingModel, int, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<NotificationSettingModel, bool, QQueryOperations>
      isEasterRelatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEasterRelated');
    });
  }

  QueryBuilder<NotificationSettingModel, bool, QQueryOperations>
      isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }

  QueryBuilder<NotificationSettingModel, int, QQueryOperations>
      minuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minute');
    });
  }

  QueryBuilder<NotificationSettingModel, int?, QQueryOperations>
      monthOfYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthOfYear');
    });
  }

  QueryBuilder<NotificationSettingModel, MonthlyRecurrenceType,
      QQueryOperations> monthlyRecurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyRecurrenceType');
    });
  }

  QueryBuilder<NotificationSettingModel, int, QQueryOperations>
      notificationIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationID');
    });
  }

  QueryBuilder<NotificationSettingModel, int?, QQueryOperations>
      recurrenceCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceCount');
    });
  }

  QueryBuilder<NotificationSettingModel, RecurrenceEnd, QQueryOperations>
      recurrenceEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceEnd');
    });
  }

  QueryBuilder<NotificationSettingModel, DateTime?, QQueryOperations>
      recurrenceEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceEndDate');
    });
  }

  QueryBuilder<NotificationSettingModel, int, QQueryOperations>
      recurrenceIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceInterval');
    });
  }

  QueryBuilder<NotificationSettingModel, RecurrenceType, QQueryOperations>
      recurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceType');
    });
  }

  QueryBuilder<NotificationSettingModel, NotificationType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<NotificationSettingModel, int?, QQueryOperations>
      weekOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekOfMonth');
    });
  }

  QueryBuilder<NotificationSettingModel, List<int>?, QQueryOperations>
      weekdaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekdays');
    });
  }
}
