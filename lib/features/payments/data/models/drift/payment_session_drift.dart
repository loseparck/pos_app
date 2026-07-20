import 'package:drift/drift.dart';

class PaymentSessionDrift extends Table{
  TextColumn get id => text().unique()();

  TextColumn get orderId => text()();
  IntColumn get partCounts => integer()();
  TextColumn get mode => text().withDefault(const Constant('total'))();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}