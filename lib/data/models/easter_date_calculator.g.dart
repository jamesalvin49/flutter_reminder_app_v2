// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'easter_date_calculator.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEasterDateCalculatorCollection on Isar {
  IsarCollection<EasterDateCalculator> get easterDateCalculators =>
      this.collection();
}

const EasterDateCalculatorSchema = CollectionSchema(
  name: r'EasterDateCalculator',
  id: 5291180391401588008,
  properties: {
    r'ashWednesday': PropertySchema(
      id: 0,
      name: r'ashWednesday',
      type: IsarType.dateTime,
    ),
    r'easterSunday': PropertySchema(
      id: 1,
      name: r'easterSunday',
      type: IsarType.dateTime,
    ),
    r'goodFriday': PropertySchema(
      id: 2,
      name: r'goodFriday',
      type: IsarType.dateTime,
    ),
    r'holySaturday': PropertySchema(
      id: 3,
      name: r'holySaturday',
      type: IsarType.dateTime,
    ),
    r'holyThursday': PropertySchema(
      id: 4,
      name: r'holyThursday',
      type: IsarType.dateTime,
    ),
    r'palmSunday': PropertySchema(
      id: 5,
      name: r'palmSunday',
      type: IsarType.dateTime,
    ),
    r'year': PropertySchema(
      id: 6,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _easterDateCalculatorEstimateSize,
  serialize: _easterDateCalculatorSerialize,
  deserialize: _easterDateCalculatorDeserialize,
  deserializeProp: _easterDateCalculatorDeserializeProp,
  idName: r'id',
  indexes: {
    r'year': IndexSchema(
      id: -875522826430421864,
      name: r'year',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'year',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _easterDateCalculatorGetId,
  getLinks: _easterDateCalculatorGetLinks,
  attach: _easterDateCalculatorAttach,
  version: '3.1.0+1',
);

int _easterDateCalculatorEstimateSize(
  EasterDateCalculator object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _easterDateCalculatorSerialize(
  EasterDateCalculator object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.ashWednesday);
  writer.writeDateTime(offsets[1], object.easterSunday);
  writer.writeDateTime(offsets[2], object.goodFriday);
  writer.writeDateTime(offsets[3], object.holySaturday);
  writer.writeDateTime(offsets[4], object.holyThursday);
  writer.writeDateTime(offsets[5], object.palmSunday);
  writer.writeLong(offsets[6], object.year);
}

EasterDateCalculator _easterDateCalculatorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EasterDateCalculator(
    easterSunday: reader.readDateTime(offsets[1]),
    year: reader.readLong(offsets[6]),
  );
  object.ashWednesday = reader.readDateTime(offsets[0]);
  object.goodFriday = reader.readDateTime(offsets[2]);
  object.holySaturday = reader.readDateTime(offsets[3]);
  object.holyThursday = reader.readDateTime(offsets[4]);
  object.id = id;
  object.palmSunday = reader.readDateTime(offsets[5]);
  return object;
}

P _easterDateCalculatorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _easterDateCalculatorGetId(EasterDateCalculator object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _easterDateCalculatorGetLinks(
    EasterDateCalculator object) {
  return [];
}

void _easterDateCalculatorAttach(
    IsarCollection<dynamic> col, Id id, EasterDateCalculator object) {
  object.id = id;
}

extension EasterDateCalculatorByIndex on IsarCollection<EasterDateCalculator> {
  Future<EasterDateCalculator?> getByYear(int year) {
    return getByIndex(r'year', [year]);
  }

  EasterDateCalculator? getByYearSync(int year) {
    return getByIndexSync(r'year', [year]);
  }

  Future<bool> deleteByYear(int year) {
    return deleteByIndex(r'year', [year]);
  }

  bool deleteByYearSync(int year) {
    return deleteByIndexSync(r'year', [year]);
  }

  Future<List<EasterDateCalculator?>> getAllByYear(List<int> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return getAllByIndex(r'year', values);
  }

  List<EasterDateCalculator?> getAllByYearSync(List<int> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'year', values);
  }

  Future<int> deleteAllByYear(List<int> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'year', values);
  }

  int deleteAllByYearSync(List<int> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'year', values);
  }

  Future<Id> putByYear(EasterDateCalculator object) {
    return putByIndex(r'year', object);
  }

  Id putByYearSync(EasterDateCalculator object, {bool saveLinks = true}) {
    return putByIndexSync(r'year', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByYear(List<EasterDateCalculator> objects) {
    return putAllByIndex(r'year', objects);
  }

  List<Id> putAllByYearSync(List<EasterDateCalculator> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'year', objects, saveLinks: saveLinks);
  }
}

extension EasterDateCalculatorQueryWhereSort
    on QueryBuilder<EasterDateCalculator, EasterDateCalculator, QWhere> {
  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhere>
      anyYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'year'),
      );
    });
  }
}

extension EasterDateCalculatorQueryWhere
    on QueryBuilder<EasterDateCalculator, EasterDateCalculator, QWhereClause> {
  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      yearEqualTo(int year) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year',
        value: [year],
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      yearNotEqualTo(int year) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year',
              lower: [],
              upper: [year],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year',
              lower: [year],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year',
              lower: [year],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year',
              lower: [],
              upper: [year],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      yearGreaterThan(
    int year, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year',
        lower: [year],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      yearLessThan(
    int year, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year',
        lower: [],
        upper: [year],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterWhereClause>
      yearBetween(
    int lowerYear,
    int upperYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year',
        lower: [lowerYear],
        includeLower: includeLower,
        upper: [upperYear],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EasterDateCalculatorQueryFilter on QueryBuilder<EasterDateCalculator,
    EasterDateCalculator, QFilterCondition> {
  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> ashWednesdayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ashWednesday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> ashWednesdayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ashWednesday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> ashWednesdayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ashWednesday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> ashWednesdayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ashWednesday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> easterSundayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'easterSunday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> easterSundayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'easterSunday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> easterSundayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'easterSunday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> easterSundayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'easterSunday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> goodFridayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goodFriday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> goodFridayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goodFriday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> goodFridayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goodFriday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> goodFridayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goodFriday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holySaturdayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'holySaturday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holySaturdayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'holySaturday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holySaturdayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'holySaturday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holySaturdayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'holySaturday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holyThursdayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'holyThursday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holyThursdayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'holyThursday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holyThursdayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'holyThursday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> holyThursdayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'holyThursday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
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

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
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

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
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

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> palmSundayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'palmSunday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> palmSundayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'palmSunday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> palmSundayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'palmSunday',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> palmSundayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'palmSunday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> yearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator,
      QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EasterDateCalculatorQueryObject on QueryBuilder<EasterDateCalculator,
    EasterDateCalculator, QFilterCondition> {}

extension EasterDateCalculatorQueryLinks on QueryBuilder<EasterDateCalculator,
    EasterDateCalculator, QFilterCondition> {}

extension EasterDateCalculatorQuerySortBy
    on QueryBuilder<EasterDateCalculator, EasterDateCalculator, QSortBy> {
  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByAshWednesday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ashWednesday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByAshWednesdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ashWednesday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByEasterSunday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easterSunday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByEasterSundayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easterSunday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByGoodFriday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goodFriday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByGoodFridayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goodFriday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByHolySaturday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holySaturday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByHolySaturdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holySaturday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByHolyThursday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holyThursday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByHolyThursdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holyThursday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByPalmSunday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'palmSunday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByPalmSundayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'palmSunday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension EasterDateCalculatorQuerySortThenBy
    on QueryBuilder<EasterDateCalculator, EasterDateCalculator, QSortThenBy> {
  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByAshWednesday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ashWednesday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByAshWednesdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ashWednesday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByEasterSunday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easterSunday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByEasterSundayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easterSunday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByGoodFriday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goodFriday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByGoodFridayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goodFriday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByHolySaturday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holySaturday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByHolySaturdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holySaturday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByHolyThursday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holyThursday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByHolyThursdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'holyThursday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByPalmSunday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'palmSunday', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByPalmSundayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'palmSunday', Sort.desc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QAfterSortBy>
      thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension EasterDateCalculatorQueryWhereDistinct
    on QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct> {
  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByAshWednesday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ashWednesday');
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByEasterSunday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'easterSunday');
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByGoodFriday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goodFriday');
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByHolySaturday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'holySaturday');
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByHolyThursday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'holyThursday');
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByPalmSunday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'palmSunday');
    });
  }

  QueryBuilder<EasterDateCalculator, EasterDateCalculator, QDistinct>
      distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension EasterDateCalculatorQueryProperty on QueryBuilder<
    EasterDateCalculator, EasterDateCalculator, QQueryProperty> {
  QueryBuilder<EasterDateCalculator, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EasterDateCalculator, DateTime, QQueryOperations>
      ashWednesdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ashWednesday');
    });
  }

  QueryBuilder<EasterDateCalculator, DateTime, QQueryOperations>
      easterSundayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'easterSunday');
    });
  }

  QueryBuilder<EasterDateCalculator, DateTime, QQueryOperations>
      goodFridayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goodFriday');
    });
  }

  QueryBuilder<EasterDateCalculator, DateTime, QQueryOperations>
      holySaturdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'holySaturday');
    });
  }

  QueryBuilder<EasterDateCalculator, DateTime, QQueryOperations>
      holyThursdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'holyThursday');
    });
  }

  QueryBuilder<EasterDateCalculator, DateTime, QQueryOperations>
      palmSundayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'palmSunday');
    });
  }

  QueryBuilder<EasterDateCalculator, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
