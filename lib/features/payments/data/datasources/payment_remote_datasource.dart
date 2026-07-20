import 'package:pos_app/features/payments/data/models/dto/create_payment_session_dto.dart';
import 'package:pos_app/features/payments/data/models/dto/create_payment_transaction_dto.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';

abstract class PaymentRemoteDatasource {
  Future<PaymentSession> createPayment(CreatePaymentSessionDto paymentDto);
  Future<PaymentTransaction> ceatePaymentTransaction(CreatePaymentTransactionDto transaction);
  Future<PaymentSession> getPaymentById(String id);
  Future<PaymentSession> getPaymentByOrder(String orderId);
  Future<PaymentTransaction> getTransaction(String id);
  Future<List<PaymentTransaction>> getSessionTransactions(String sessionId);
}   