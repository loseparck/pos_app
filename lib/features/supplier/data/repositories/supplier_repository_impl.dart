import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/supplier/data/datasources/supplier_local_datasource.dart';
import 'package:pos_app/features/supplier/data/datasources/supplier_remote_datasource.dart';
import 'package:pos_app/features/supplier/data/mappers/supplier_mappers.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SupplierRepositoryImpl implements SupplierRepository {
  SupplierRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity
  );

  final SupplierRemoteDatasource _remoteDataSource;
  final SupplierLocalDatasource _localDataSource;
  final ConnectivityService _connectivity;

  final _uuid = const Uuid();

  @override
  Future<Supplier> updateSupplier(Supplier supplier) async {
    if(!kIsWeb) {
      _localDataSource.updateSupplier(supplier);
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.updateSupplier(supplier.toUpdateDto(), supplier.id);
    }
    else if(!kIsWeb) {
      //TODO add to QUEUE
    }
    return supplier;
  }
  
  @override
  Future<Supplier?> getSupplier(String id) async {
    if(!kIsWeb) {
      final supplier = await _localDataSource.getSupplier(id);
      if(supplier != null){
        return supplier;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getSupplier(id);
    }

    return null;
  }

  @override
  Future<List<Supplier>> getSuppliers() async {
    final List<Supplier> suppliers = [];
    if(!kIsWeb) {
      suppliers.addAll(await _localDataSource.getSuppliers());
      if(suppliers.isNotEmpty){
        return suppliers;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getSuppliers();
    }

    return suppliers;
  }

  @override
  Future<void> removeSupplier(String id) async {
    if(!kIsWeb) {
      await _localDataSource.removeSupplier(id);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeSupplier(id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<Supplier> saveSupplier(Supplier supplier) async {
    supplier = supplier.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveSupplier(supplier);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveSupplier(supplier.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return supplier;
  }
  
  @override
  Future<Supplier?> changeSupplierState(String supplierId, bool state) async {
    var supplier;
    if(!kIsWeb) {
      supplier = _localDataSource.changeSupplierState(supplierId, state);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.changeSupplierState(supplierId, state);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return supplier;
  }

}