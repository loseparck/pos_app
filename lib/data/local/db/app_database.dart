import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:pos_app/features/payments/data/mappers/payment_converter.dart';
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
import '../../../features/payments/data/models/drift/payment_session_drift.dart';
import '../../../features/payments/data/models/drift/payment_transaction_drift.dart';
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
    OrderItemOptionsDrift,
    PaymentSessionDrift,
    PaymentTransactionDrift,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    
    onUpgrade: (m, from, to) async {
      /*print("ssdlfk lsdm jnflksdfjklsdhnf lkjsdhljkmf------------------------------------------------------$from");
      if (from < 24) {
        // Items
       /* try {
          await m.addColumn(itemsDrift, itemsDrift.additionalPrice);
        } on Exception catch (_) {
          print('never reached $_');
        }
        
        await m.addColumn(itemsDrift, itemsDrift.taxRate);
        await m.addColumn(itemsDrift, itemsDrift.active);
        await m.alterTable(TableMigration(itemsDrift,
          columnTransformer: {
            itemsDrift.additionalPrice:const CustomExpression('price'),
            itemsDrift.taxRate:const CustomExpression('vat'),
            itemsDrift.active:const CustomExpression('isActive'),
          }
          )
        );
        await m.addColumn(itemsDrift, itemsDrift.description);
        await m.addColumn(itemsDrift, itemsDrift.sku);
        await m.addColumn(itemsDrift, itemsDrift.image);
        await m.addColumn(itemsDrift, itemsDrift.color);
        await m.addColumn(itemsDrift, itemsDrift.displayOrder);
        await m.addColumn(itemsDrift, itemsDrift.icon);
        await m.addColumn(itemsDrift, itemsDrift.inStock);*/
        

        //Options
        print("description------------------------------------------------------$from");
        await m.addColumn(optionsDrift, optionsDrift.description);
        await m.addColumn(optionsDrift, optionsDrift.image);
        await m.addColumn(optionsDrift, optionsDrift.color);
        await m.addColumn(optionsDrift, optionsDrift.mandatory);
        await m.addColumn(optionsDrift, optionsDrift.minSelection);
        await m.addColumn(optionsDrift, optionsDrift.maxSelection);
        await m.addColumn(optionsDrift, optionsDrift.allowDuplicateSelection);
        await m.addColumn(optionsDrift, optionsDrift.active);
        await m.alterTable(TableMigration(optionsDrift,
          columnTransformer: {
            optionsDrift.mandatory:const CustomExpression('isMandatory'),
            optionsDrift.minSelection:const CustomExpression('minToSelect'),
            optionsDrift.maxSelection:const CustomExpression('maxToSelect'),
            optionsDrift.allowDuplicateSelection:const CustomExpression('multipleSelect'),
            optionsDrift.active:const CustomExpression('isActive'),
          }
          )
        );
        

      }*/
      /*if (from < 2) {
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
      if (from < 9) {
        await m.createTable(paymentSessionDrift);
        await m.createTable(paymentTransactionDrift);
      }
      if (from < 10) {
        await m.addColumn(categoriesDrift, categoriesDrift.image);
        await m.addColumn(categoriesDrift, categoriesDrift.color);
      }
      if (from < 17) {
        await m.addColumn(categoriesDrift, categoriesDrift.image);
        await m.addColumn(categoriesDrift, categoriesDrift.color);
      }
      if (from < 17) {
        await m.alterTable(TableMigration(productsDrift,
          columnTransformer: {
           // productsDrift.barcode:const CustomExpression('codeBarres'),
            productsDrift.salePrice:const CustomExpression('price'),
            productsDrift.taxRate:const CustomExpression('vat'),
            }
          )
        );
        await m.addColumn(productsDrift, productsDrift.purchasePrice);
        await m.addColumn(productsDrift, productsDrift.costPrice);
        await m.addColumn(productsDrift, productsDrift.stockEnabled);
        await m.addColumn(productsDrift, productsDrift.weighted);
        await m.addColumn(productsDrift, productsDrift.service);
        await m.addColumn(productsDrift, productsDrift.favorite);
        await m.addColumn(productsDrift, productsDrift.unit);
        await m.addColumn(productsDrift, productsDrift.stockMin);
        await m.addColumn(productsDrift, productsDrift.stockMax);
      }
      if (from < 19) {
        await m.alterTable(TableMigration(productsDrift,
          columnTransformer: {
            productsDrift.salePrice:productsDrift.salePrice,
            productsDrift.taxRate:productsDrift.taxRate,
          }
          )
        );
        await m.addColumn(productsDrift, productsDrift.purchasePrice);
        await m.addColumn(productsDrift, productsDrift.costPrice);
        await m.addColumn(productsDrift, productsDrift.stockEnabled);
        await m.addColumn(productsDrift, productsDrift.weighted);
        await m.addColumn(productsDrift, productsDrift.service);
        await m.addColumn(productsDrift, productsDrift.favorite);
        await m.addColumn(productsDrift, productsDrift.unit);
        await m.addColumn(productsDrift, productsDrift.stockMin);
        await m.addColumn(productsDrift, productsDrift.stockMax);

      }
      if (from < 20) {
        /*await m.alterTable(TableMigration(productsDrift,
          columnTransformer: {
            productsDrift.barcode:const CustomExpression('codeBarres'),
          }
          )
        );*/
        await m.addColumn(productsDrift, productsDrift.barcode);
      }
      if (from < 22) {
        await m.addColumn(productsDrift, productsDrift.barcode);
        /*await m.alterTable(TableMigration(productsDrift,
          columnTransformer: {
            productsDrift.barcode:const CustomExpression('codeBarres'),
          }
          )
        );*/
        
      }*/
    },
  );
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'pos_app_db4');
}