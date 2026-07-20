import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';

abstract class PaymentRepository {

  Future<PaymentSession?> createPayment(PaymentSession payment);
  Future<PaymentTransaction?> ceatePaymentTransaction(PaymentTransaction transaction);
  Future<PaymentSession?> getPaymentById(String id);
  Future<PaymentSession?> getPaymentByOrder(String orderId);
  Future<PaymentTransaction?> getTransaction(String id);
  Future<List<PaymentTransaction>> getSessionTransactions(String sessionId);

  /*Future<Order> createOrder(Order order);
  Future<void> validateOrder(String orderId);
  Future<void> cancelOrder(String orderId);
  Future<void> deliverOrder(String orderId);
  Future<void> payOrder(String orderId);

  Future<List<Order>> getOrders();
  Future<List<Order>> getActiveOrders();
  Future<Order?> getOrder(String orderId);

  Future<OrderItem> addItem(OrderItem orderItem);
  Future<void> deleteItem(String orderItemId);
  Future<void> increaseItemQuantity(String orderItemId);
  Future<void> decreaseItemQuantity(String orderItemId);

  Future<List<OrderItem>> getItems(String orderId);
  Future<OrderItem?> getItem(String orderItemId);

  Future<void> syncOrders(); */
}