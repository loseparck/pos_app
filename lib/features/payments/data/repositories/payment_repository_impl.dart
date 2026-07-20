import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/payments/data/datasources/payment_local_datasource.dart';
import 'package:pos_app/features/payments/data/datasources/payment_remote_datasource.dart';
import 'package:pos_app/features/payments/data/mappers/order_mappers.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';
//import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class PaymentRepositoryImpl implements PaymentRepository{
  PaymentRepositoryImpl(
    this._localDataSource, 
    this._remoteDataSource, 
    this._connectivity
  );

  final PaymentLocalDatasource _localDataSource;
  final PaymentRemoteDatasource _remoteDataSource;
  final ConnectivityService _connectivity;
  //final _uuid = const Uuid();

  @override
  Future<PaymentTransaction?> ceatePaymentTransaction(PaymentTransaction paymentTransaction) async {
    if(!kIsWeb) {
      final transaction = await _localDataSource.ceatePaymentTransaction(paymentTransaction);
      if(transaction != null){
        return transaction;
      }
    }
     
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.ceatePaymentTransaction(paymentTransaction.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return null;
  }

  @override
  Future<PaymentSession?> createPayment(PaymentSession paymentSession) async {
    if(!kIsWeb) {
      final payment = await _localDataSource.createPayment(paymentSession);
      if(payment != null){
        return payment;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.createPayment(paymentSession.toCreateDto());
    }

    return null;
  }

  @override
  Future<List<PaymentTransaction>> getSessionTransactions(String sessionId) async {
    final List<PaymentTransaction> optiotransactions = [];
    if(!kIsWeb) {
      optiotransactions.addAll(await _localDataSource.getSessionTransactions(sessionId));
      if(optiotransactions.isNotEmpty){
        return optiotransactions;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getSessionTransactions(sessionId);
    }

    return optiotransactions;
  }

  @override
  Future<PaymentSession?> getPaymentById(String id) async{
    if(!kIsWeb) {
      final payment = await _localDataSource.getPaymentById(id);
      if(payment != null){
        return payment;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getPaymentById(id);
    }

    return null;
  }

  @override
  Future<PaymentSession?> getPaymentByOrder(String orderId) async{
    if(!kIsWeb) {
      final payment = await _localDataSource.getPaymentByOrder(orderId);
      if(payment != null){
        return payment;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getPaymentByOrder(orderId);
    }

    return null;
  }

  @override
  Future<PaymentTransaction?> getTransaction(String id) async{
    if(!kIsWeb) {
      final transaction = await _localDataSource.getTransaction(id);
      if(transaction != null){
        return transaction;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getTransaction(id);
    }

    return null;
  }
}