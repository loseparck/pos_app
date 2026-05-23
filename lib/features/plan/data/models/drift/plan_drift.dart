import 'package:drift/drift.dart';

class PlanDrift extends Table{
  TextColumn get id => text().unique()();
  TextColumn get name => text()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};

}
