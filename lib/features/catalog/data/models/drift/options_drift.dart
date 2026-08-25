import 'package:drift/drift.dart';

class OptionsDrift extends Table {

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();//
  BoolColumn get mandatory => boolean().withDefault(const Constant(false))();//isMandatory
  IntColumn get minSelection => integer().withDefault(const Constant(0))();//minToSelect
  IntColumn get maxSelection => integer().withDefault(const Constant(0))();//maxToSelect
  BoolColumn get allowDuplicateSelection => boolean().withDefault(const Constant(false))();//multipleSelect
  TextColumn get image => text().nullable()();//
  TextColumn get color => text().nullable()();//
  BoolColumn get active => boolean().withDefault(const Constant(true))();//isActive
  TextColumn get createdById => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}