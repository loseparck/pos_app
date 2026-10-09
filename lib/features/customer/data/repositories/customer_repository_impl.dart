import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/customer/data/datasources/customer_local_datasource.dart';
import 'package:pos_app/features/customer/data/datasources/customer_remote_datasource.dart';
import 'package:pos_app/features/customer/data/mappers/customer_mappers.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class CustomerRepositoryImpl implements CustomerRepository {
  CustomerRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity
  );

  final CustomerRemoteDatasource _remoteDataSource;
  final CustomerLocalDatasource _localDataSource;
  final ConnectivityService _connectivity;

  final _uuid = const Uuid();

  @override
  Future<Customer> updateCustomer(Customer customer) async {
    if(!kIsWeb) {
      _localDataSource.updateCustomer(customer);
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.updateCustomer(customer.toUpdateDto(), customer.id);
    }
    else if(!kIsWeb) {
      //TODO add to QUEUE
    }
    return customer;
  }
  
  @override
  Future<Customer?> getCustomer(String id) async {
    if(!kIsWeb) {
      final customer = await _localDataSource.getCustomer(id);
      if(customer != null){
        return customer;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getCustomer(id);
    }

    return null;
  }

  @override
  Future<List<Customer>> getCustomers() async {
    final List<Customer> customers = [];
    if(!kIsWeb) {
      customers.addAll(await _localDataSource.getCustomers());
      if(customers.isNotEmpty){
        return customers;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getCustomers();
    }

    return customers;
  }

  @override
  Future<void> removeCustomer(String id) async {
    if(!kIsWeb) {
      await _localDataSource.removeCustomer(id);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeCustomer(id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<Customer> saveCustomer(Customer customer) async {
    customer = customer.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveCustomer(customer);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveCustomer(customer.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return customer;
  }
  
  @override
  Future<Customer?> changeCustomerState(String customerId, bool state) async {
    var customer;
    if(!kIsWeb) {
      customer = _localDataSource.changeCustomerState(customerId, state);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.changeCustomerState(customerId, state);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return customer;
  }

}