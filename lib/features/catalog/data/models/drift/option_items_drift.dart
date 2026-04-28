
import 'package:drift/drift.dart';
import 'package:pos_app/features/catalog/data/models/drift/product_options_drift.dart';

class OptionItemsDrift extends Table{

  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().unique()();

  IntColumn get productOptionId =>
      integer().references(ProductOptionsDrift, #id)();

  TextColumn get name => text()();
  RealColumn get price => real().withDefault(const Constant(0))();
  RealColumn get vat => real().nullable().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get groupId => text()();
  TextColumn get createdById => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
} 