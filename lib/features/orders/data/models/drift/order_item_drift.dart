import 'package:drift/drift.dart';

class OrderItemDrift extends Table{

  TextColumn get id => text().unique()();
  TextColumn get comment => text().nullable()();
  TextColumn get orderId => text()();
  TextColumn get productId => text().nullable()();
  TextColumn get productName => text()();
  IntColumn get quantity => integer()();

  RealColumn get unitPrice => real().withDefault(const Constant(0))();
  RealColumn get vat => real().withDefault(const Constant(0))();

  DateTimeColumn get validatedAt => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('draft'))();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}