import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/categories_drift.dart';

class ProductsDrift extends Table{
 // IntColumn get id => integer().autoIncrement()();
 // IntColumn get categoryId =>
      //integer().nullable().references(CategoriesDrift, #id)();

  TextColumn get id => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get sku => text().nullable().unique()();
  TextColumn get codeBarres => text().nullable().unique()();

  RealColumn get price => real()();
  RealColumn get vat => real().nullable()();
  RealColumn get stockQuantity => real().nullable()();
 
  TextColumn get image => text().nullable()();
  IntColumn  get color => integer().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  TextColumn get categoryId => text().nullable().references(CategoriesDrift, #id)();
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
