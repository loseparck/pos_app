import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/product_groups_drift.dart';

class ProductsDrift extends Table{
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().unique()();

  TextColumn get name => text()();

  IntColumn get productGroupId =>
      integer().nullable().references(ProductGroupsDrift, #id)();

  RealColumn get price => real()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get groupId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get codeBarres => text().nullable().unique()();
  TextColumn get sku => text().nullable().unique()();
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  
}