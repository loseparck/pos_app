import 'package:drift/drift.dart';

class AuditLogsDrift extends Table{

  TextColumn get id => text().unique()();
  TextColumn get actorUserId => text().nullable()();
  TextColumn get action => text()();
  TextColumn get auditedEntityName => text()();
  TextColumn get entityId => text().nullable()();
  TextColumn get metadata => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
