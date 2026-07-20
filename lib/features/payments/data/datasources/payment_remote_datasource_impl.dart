import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/payments/data/datasources/payment_remote_datasource.dart';
import 'package:pos_app/features/payments/data/models/dto/create_payment_session_dto.dart';
import 'package:pos_app/features/payments/data/models/dto/create_payment_transaction_dto.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';

class PaymentRemoteDatasourceImpl implements PaymentRemoteDatasource {
  final Dio _dio;

  PaymentRemoteDatasourceImpl(this._dio);

  @override
  Future<PaymentTransaction> ceatePaymentTransaction(CreatePaymentTransactionDto transaction) async {
     final response = await _dio.post(
      '${ApiEndpoints.payments}/transactions',
      data: transaction.toJson(),
    );
    
    return PaymentTransaction.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<PaymentSession> createPayment(CreatePaymentSessionDto paymentDto) async {
     final response = await _dio.post(
      ApiEndpoints.payments,
      data: paymentDto.toJson(),
    );
    
    return PaymentSession.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<PaymentTransaction>> getSessionTransactions(String sessionId) async {
    final response = await _dio.get(
      '${ApiEndpoints.payments}/$sessionId/transactions'
    );

    return (response.data['data'] as List<dynamic>).map((e) => PaymentTransaction.fromJson(e)).toList();
  }

  @override
  Future<PaymentSession> getPaymentById(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.payments}/$id'
    );

    return PaymentSession.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<PaymentSession> getPaymentByOrder(String orderId) async {
    final response = await _dio.get(
      '${ApiEndpoints.payments}/order/$orderId'
    );

    return PaymentSession.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<PaymentTransaction> getTransaction(String id) async {
    final response = await _dio.get(
      '${ApiEndpoints.payments}/transaction/$id'
    );

    return PaymentTransaction.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}