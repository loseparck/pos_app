import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';

abstract class OrderLocalDatasource {
  Future<Order?> createOrder(Order order);
  Future<void> validateOrder(String orderId);
  Future<void> cancelOrder(String orderId);
  Future<void> deliverOrder(String orderId);
  Future<void> payOrder(String orderId);

  Future<List<Order>> getOrders();
  Future<List<Order>> getActiveOrders();
  Future<Order?> getOrder(String orderId);

  Future<OrderItem?> addItem(OrderItem orderItem);
  Future<void> deleteItem(String orderItemId);
  Future<void> cancelItem(String orderItemId);
  Future<void> increaseItemQuantity(String orderItemId);
  Future<void> decreaseItemQuantity(String orderItemId);

  Future<List<OrderItem>> getItems(String orderId);
  Future<OrderItem?> getItem(String orderItemId);

  Future<List<OrderItemOption>> getItemOptions(String orderItemId);

  //Future<void> saveOrder(OrderModel order);
  //Future<List<OrderModel>> getUnsyncedOrders();
  //Future<void> markAsSynced(String id);
}