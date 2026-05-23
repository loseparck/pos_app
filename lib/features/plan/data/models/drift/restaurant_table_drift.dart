import 'package:drift/drift.dart';
import 'package:pos_app/features/plan/data/models/drift/plan_drift.dart';

class RestaurantTableDrift extends Table{
  
  TextColumn get id => text().unique()();
  TextColumn get name => text()();
  TextColumn get status => text().withDefault(const Constant('empty'))();
  TextColumn get shape => text().withDefault(const Constant('square'))();

  RealColumn get x => real()();
  RealColumn get y => real()();
  RealColumn get rotation => real().withDefault(const Constant(0))();
  RealColumn get width => real().withDefault(const Constant(100))();
  RealColumn get height => real().withDefault(const Constant(100))();
 
  IntColumn  get color => integer().nullable()();
  IntColumn  get seats => integer().withDefault(const Constant(2))();

  TextColumn get planId => text().nullable().references(PlanDrift, #id)();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
