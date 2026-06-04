import 'package:drift/drift.dart';

class OrderDrift extends Table{
  TextColumn get id => text().unique()();

  TextColumn get tableId => text()();
  TextColumn get groupId => text()();
  TextColumn get paymentId => text().nullable()();

  DateTimeColumn get validatedAt => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('draft'))();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}