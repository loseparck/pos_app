import 'package:drift/drift.dart';

class CategoriesDrift extends Table {
  //IntColumn get id => integer().autoIncrement()();
  //IntColumn get parentCategoryId =>
    //  integer().references(CategoriesDrift, #id)();

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get image => text().nullable()();
  IntColumn  get color => integer().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get parentId => text().nullable().references(CategoriesDrift, #id)();
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
} 