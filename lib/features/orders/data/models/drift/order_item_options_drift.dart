import 'package:drift/drift.dart';

class OrderItemOptionsDrift extends Table{

  TextColumn get id => text().unique()();

  TextColumn get orderItemId => text()();
  TextColumn get optionId => text().nullable()();

  IntColumn get quantity => integer()();
  RealColumn get unitPrice => real().withDefault(const Constant(0))();
  RealColumn get vat => real().withDefault(const Constant(0))();
  TextColumn get optionName => text()();

  TextColumn get createdById => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}