import 'package:drift/drift.dart';

class ProductOptionsDrift extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().unique()();
  TextColumn get name => text()();

  BoolColumn get isMandatory => boolean()();
  IntColumn get minToSelect => integer()();
  IntColumn get maxToSelect => integer()();
  BoolColumn get multipleSelect => boolean()();
  BoolColumn get isActive => boolean()();

  TextColumn get createdById => text().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}