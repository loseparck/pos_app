import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../../features/catalog/data/models/drift/products_drift.dart';
import '../../../features/catalog/data/models/drift/product_groups_drift.dart';
import '../../../features/catalog/data/models/drift/product_options_drift.dart';
import '../../../features/catalog/data/models/drift/option_items_drift.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ProductsDrift,
    ProductOptionsDrift,
    OptionItemsDrift,
    ProductGroupsDrift,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'pos_app_db1');
}