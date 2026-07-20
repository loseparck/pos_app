import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';

abstract class PaymentLocalDatasource {
  Future<PaymentSession?> createPayment(PaymentSession paymentSession);
  Future<PaymentTransaction?> ceatePaymentTransaction(PaymentTransaction transaction);
  Future<PaymentSession?> getPaymentById(String id);
  Future<PaymentSession?> getPaymentByOrder(String orderId);
  Future<PaymentTransaction?> getTransaction(String id);
  Future<List<PaymentTransaction>> getSessionTransactions(String sessionId);
}