import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../../features/catalog/data/models/drift/products_drift.dart';
import '../../../features/catalog/data/models/drift/categories_drift.dart';
import '../../../features/catalog/data/models/drift/options_drift.dart';
import '../../../features/catalog/data/models/drift/items_drift.dart';
import '../../../features/catalog/data/models/drift/discounts_drift.dart';
import '../../../features/catalog/data/models/drift/products_options_drift.dart';
import '../../../features/catalog/data/models/drift/audit_logs_drift.dart';
import '../../../features/plan/data/models/drift/plan_drift.dart';
import '../../../features/plan/data/models/drift/restaurant_table_drift.dart';
part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ProductsDrift,
    OptionsDrift,
    ItemsDrift,
    CategoriesDrift,
    ProductsOptionsDrift,
    AuditLogsDrift,
    PlanDrift,
    RestaurantTableDrift,
    DiscountsDrift
    
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(planDrift);
        
      }
      if (from < 3) {
        await m.createTable(restaurantTableDrift);
      }
    },
  );
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'pos_app_db2');
}