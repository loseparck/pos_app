import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/categories_drift.dart';

class ProductsDrift extends Table{
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get sku => text().nullable().unique()();
  TextColumn get barcode => text().nullable().unique()();

  RealColumn get salePrice => real().nullable().withDefault(const Constant(0))();
  RealColumn get purchasePrice => real().withDefault(const Constant(0))();
  RealColumn get costPrice => real().withDefault(const Constant(0))();
  RealColumn get taxRate => real().nullable().withDefault(const Constant(0))();

  BoolColumn get stockEnabled => boolean().withDefault(const Constant(false))();
  BoolColumn get weighted => boolean().withDefault(const Constant(false))();
  BoolColumn get service => boolean().withDefault(const Constant(false))();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  BoolColumn get allowNegativeStock => boolean().withDefault(const Constant(true))();

  RealColumn get stockQuantity => real().withDefault(const Constant(0))();
  RealColumn get stockMin => real().withDefault(const Constant(0))();
  RealColumn get stockMax => real().withDefault(const Constant(0))();
  RealColumn get reorderPoint => real().withDefault(const Constant(0))();
  TextColumn get unit => text().withDefault(const Constant('Piece'))();
 
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