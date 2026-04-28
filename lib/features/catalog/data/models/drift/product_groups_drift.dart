import 'package:drift/drift.dart';

class ProductGroupsDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().unique()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get parentId => text().nullable()();
  TextColumn get createdById => text().nullable()();

  IntColumn get productGroupId =>
      integer().references(ProductGroupsDrift, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

} 