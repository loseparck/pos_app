import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

abstract class OrderRepository {
  Future<Order> createOrder(Order order);
  Future<void> validateOrder(String orderId);
  Future<void> cancelOrder(String orderId);
  Future<void> deliverOrder(String orderId);
  Future<void> payOrder(String orderId, PaymentSession payment);
  Future<void> changeOrderStatus(String orderId, OrderStatus status);

  Future<List<Order>> getOrders();
  Future<List<Order>> getActiveOrders();
  Future<Order?> getOrder(String orderId);

  Future<OrderItem> addItem(OrderItem orderItem);
  Future<void> deleteItem(String orderItemId);
  Future<void> increaseItemQuantity(String orderItemId);
  Future<void> decreaseItemQuantity(String orderItemId);
  Future<void> updateComment(String orderItemId, String comment);
  Future<void> switchOrder(String orderId, String newTableId);
  Future<void> mergeOrder(String sourceId, String targetId, OrderStatus newStatus);
  Future<void> switchOrderItem(String orderItemId, String newOrderId);

  Future<List<OrderItem>> getItems(String orderId);
  Future<OrderItem?> getItem(String orderItemId);

  Future<void> syncOrders();
}