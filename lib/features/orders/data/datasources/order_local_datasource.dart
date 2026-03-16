import 'package:pos_app/features/orders/data/models/order_model.dart';

abstract class OrderLocalDatasource {
  Future<void> saveOrder(OrderModel order);
  Future<List<OrderModel>> getUnsyncedOrders();
  Future<void> markAsSynced(String id);
}