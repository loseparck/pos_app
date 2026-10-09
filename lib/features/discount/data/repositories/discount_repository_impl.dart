import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/discount/data/datasources/discount_local_datasource.dart';
import 'package:pos_app/features/discount/data/datasources/discount_remote_datasource.dart';
import 'package:pos_app/features/discount/data/mappers/discount_mappers.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class DiscountRepositoryImpl implements DiscountRepository {
  DiscountRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity
  );

  final DiscountRemoteDatasource _remoteDataSource;
  final DiscountLocalDatasource _localDataSource;
  final ConnectivityService _connectivity;

  final _uuid = const Uuid();

  @override
  Future<Discount> updateDiscount(Discount discount) async {
    if(!kIsWeb) {
      _localDataSource.updateDiscount(discount);
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.updateDiscount(discount.toUpdateDto(), discount.id);
    }
    else if(!kIsWeb) {
      //TODO add to QUEUE
    }
    return discount;
  }
  
  @override
  Future<Discount?> getDiscount(String id) async {
    if(!kIsWeb) {
      final discount = await _localDataSource.getDiscount(id);
      if(discount != null){
        return discount;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getDiscount(id);
    }

    return null;
  }

  @override
  Future<List<Discount>> getDiscounts() async {
    final List<Discount> discounts = [];
    if(!kIsWeb) {
      discounts.addAll(await _localDataSource.getDiscounts());
      if(discounts.isNotEmpty){
        return discounts;
      }
    }

    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getDiscounts();
    }

    return discounts;
  }

  @override
  Future<void> removeDiscount(String id) async {
    if(!kIsWeb) {
      await _localDataSource.removeDiscount(id);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeDiscount(id);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<Discount> saveDiscount(Discount discount) async {
    discount = discount.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveDiscount(discount);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveDiscount(discount.toCreateDto());
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return discount;
  }
  
  @override
  Future<Discount?> changeDiscountState(String discountId, bool state) async {
    var discount;
    if(!kIsWeb) {
      discount = _localDataSource.changeDiscountState(discountId, state);
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.changeDiscountState(discountId, state);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }

    return discount;
  }

}