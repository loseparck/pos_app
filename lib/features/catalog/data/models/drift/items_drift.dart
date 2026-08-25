
import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/options_drift.dart';

class ItemsDrift extends Table{
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();//
  TextColumn get sku => text().nullable()();//
  RealColumn get additionalPrice => real().withDefault(const Constant(0))();//price
  RealColumn get taxRate => real().withDefault(const Constant(20))();//vat
  TextColumn get image => text().nullable()();//
  TextColumn get color => text().nullable()();//

  BoolColumn get active => boolean().withDefault(const Constant(true))();//isActive
  BoolColumn get inStock => boolean().withDefault(const Constant(true))();//

  IntColumn get displayOrder => integer().withDefault(const Constant(1))();//
  IntColumn get icon => integer().nullable()();//

  TextColumn get optionId => text().references(OptionsDrift, #id)();
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
} 