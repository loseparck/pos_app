import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/options_drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/products_drift.dart';

class ProductsOptionsDrift extends Table{
  TextColumn get productId => text().references(ProductsDrift, #id)();

  TextColumn get optionId => text().references(OptionsDrift, #id)();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {productId, optionId};
}