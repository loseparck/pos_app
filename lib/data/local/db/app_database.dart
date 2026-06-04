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
import '../../../features/orders/data/models/drift/order_drift.dart';
import '../../../features/orders/data/models/drift/order_item_drift.dart';
import '../../../features/orders/data/models/drift/order_item_options_drift.dart';
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
    DiscountsDrift,
    OrderDrift,
    OrderItemDrift,
    OrderItemOptionsDrift
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 8;

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
      if (from < 4) {
        await m.createTable(discountsDrift);
      }
      if (from < 5) {
        await m.createTable(orderDrift);
        await m.createTable(orderItemDrift);
        await m.createTable(orderItemOptionsDrift);
      }
      if (from < 6) {
        await m.alterTable(TableMigration(orderDrift,
          columnTransformer: {
            orderDrift.paymentId:orderDrift.paymentId,
            orderDrift.validatedAt:orderDrift.validatedAt
            }
          )
        );
      }
      if (from < 7) {
        await m.alterTable(TableMigration(orderDrift));
      }
      if (from < 8) {
        await m.alterTable(TableMigration(orderItemDrift));
      }
    },
  );
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'pos_app_db2');
}