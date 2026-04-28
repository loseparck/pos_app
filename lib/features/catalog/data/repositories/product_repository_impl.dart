import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/catalog/data/datasources/product_local_datasource.dart';
import 'package:pos_app/features/catalog/data/datasources/product_remote_datasource.dart';
import 'package:pos_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivity
  );

  final ProductRemoteDataSource _remoteDataSource;
  final ProductLocalDataSource _localDataSource;
  final ConnectivityService _connectivity;

  final _uuid = const Uuid();

  @override
  Future<ProductOption> saveOption(ProductOption option) async {
    option = option.copyWith(
      id: _uuid.v4(),
      items: option.items.map((item) {
        if(item.id.isEmpty) {
          item = item.copyWith(id: _uuid.v4());
        }
        return item;
      }).toList()
    );
    
    if(!kIsWeb) {
      await _localDataSource.saveOption(option);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveOption(option.toCreateDto());
    }
    else {

    }

    return option;
  }
 
  @override
  Future<OptionItem> saveItem(OptionItem item) async {
    item = item.copyWith(
      id: _uuid.v4(),
    );

    if(!kIsWeb) {
      await _localDataSource.saveItem(item);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.saveItem(item.toCreateDto());
    }
    else {

    }

    return item;
  }

  @override
  Future<List<OptionItem>> getItems() {
    if(!kIsWeb) {
      return _localDataSource.getItems();
    } else {
      return _remoteDataSource.getItems();
    }
  }

  @override
  Future<OptionItem?> getItem(String id) async{
    if(!kIsWeb) {
      final item = await _localDataSource.getItem(id);
      if(item != null){
        return item.toEntity();
      }
      return null;
    } else {
      return _remoteDataSource.getItem(id);
    }
  }

  @override
  Future<List<OptionItem>> getItemByOptionId(String optionId) {
    if(!kIsWeb) {
      return _localDataSource.getItemByOptionId(optionId);
    } else {
      return _remoteDataSource.getItemByOptionId(optionId);
    }
  }

  @override
  Future<ProductOption?> getOption(String id) async{
    if(!kIsWeb) {
      final option = await _localDataSource.getOption(id);
      if(option != null){
        return option.toEntity();
      }
      return null;
    } else {
      return _remoteDataSource.getOption(id);
    }
  }

  @override
  Future<List<ProductOption>> getOptions() {
    if(!kIsWeb) {
      return _localDataSource.getOptions();
    } else {
      return _remoteDataSource.getOptions();
    }
  }
  
  @override
  Future<void> removeOption(String optionId) async {
    if(!kIsWeb) {
      await _localDataSource.removeOption(optionId);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.removeOption(optionId);
    }
    else {

    }
  }
  
  @override
  Future<void> removeItem(String itemId) async {
    if(!kIsWeb) {
      await _localDataSource.removeItem(itemId);
    }

    if(await _connectivity.isOnline()) {
     // return await _remoteDataSource.removeItem(itemId);
    }
    else {

    }
  }
  
  @override
  Future<OptionItem> updateItem(OptionItem item) {
    if(!kIsWeb) {
      return _localDataSource.updateItem(item);
    } else {
      return _remoteDataSource.updateItem(item.toUpdateDto(), item.id);
    }
  }
  
  @override
  Future<ProductOption> updateOption(ProductOption option) {
    if(!kIsWeb) {
      return _localDataSource.updateOption(option);
    } else {
      return _remoteDataSource.updateOption(option.toUpdateDto(), option.id);
    }
  }
  
  @override
  Future<void> removeItems(List<String> itemsId) async {
    if(!kIsWeb) {
      await _localDataSource.removeItems(itemsId);
    }

    if(await _connectivity.isOnline()) {
     // return await _remoteDataSource.removeItem(itemId);
    }
    else {

    }
  }

}