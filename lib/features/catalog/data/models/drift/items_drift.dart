
import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/options_drift.dart';

class ItemsDrift extends Table{

  //IntColumn get id => integer().autoIncrement()();
  //IntColumn get productOptionId =>
    //  integer().references(OptionsDrift, #id)();

  TextColumn get id => text().unique()();
  TextColumn get name => text()();
  RealColumn get price => real().withDefault(const Constant(0))();
  RealColumn get vat => real().nullable().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get optionId => text().references(OptionsDrift, #id)();
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
} 