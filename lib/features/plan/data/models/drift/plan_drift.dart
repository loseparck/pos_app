import 'package:drift/drift.dart';

class PlanDrift extends Table{
  TextColumn get id => text()();
  TextColumn get name => text()();

  BoolColumn get active => boolean().withDefault(const Constant(true))();
  BoolColumn get delivery => boolean().withDefault(const Constant(false))();
  IntColumn  get color => integer().nullable()();
  
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};

}
