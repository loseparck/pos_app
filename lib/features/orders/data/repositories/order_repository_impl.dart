import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:pos_app/features/orders/data/mappers/order_mappers.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class OrderRepositoryImpl implements OrderRepository{
  OrderRepositoryImpl(
    this._localDataSource, 
    this._remoteDataSource, 
    this._connectivity
  );

  final OrderLocalDatasource _localDataSource;
  final OrderRemoteDatasource _remoteDataSource;
  final ConnectivityService _connectivity;
  final _uuid = const Uuid();

  @override
  Future<OrderItem> addItem(OrderItem orderItem) async {
    orderItem = orderItem.copyWith(
      options: orderItem.options.map((option) {
        if(option.id.isEmpty) {
          option = option.copyWith(id: _uuid.v4());
        }
        return option;
      }).toList()
    );
    
    if(!kIsWeb) {
      await _localDataSource.addItem(orderItem);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.addItem(orderItem.toCreateDto());
    }else if(!kIsWeb){
      //TODO QUEUE
    }

    return orderItem;
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    if(!kIsWeb) {
      await _localDataSource.cancelOrder(orderId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.cancelOrder(orderId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<Order> createOrder(Order order) async {
    /*order = order.copyWith(
      //id: _uuid.v4(),
      items: order.items.map((item) {
        if(item.id.isEmpty) {
          item = item.copyWith(
            //id: _uuid.v4(),
            options: item.options.map((option) {
              if(option.id.isEmpty) {
                option = option.copyWith(id: _uuid.v4());
              }
              return option;
            }).toList()
          );
        }
        return item;
      }).toList()
    );*/
    
    if(!kIsWeb) {
      await _localDataSource.createOrder(order);
    }

    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.createOrder(order.toCreateDto());
    }else if(!kIsWeb){
      //TODO QUEUE
    }

    return order;
  }

  @override
  Future<void> decreaseItemQuantity(String orderItemId) async{
    if(!kIsWeb) {
      await _localDataSource.decreaseItemQuantity(orderItemId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.decreaseItemQuantity(orderItemId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> deleteItem(String orderItemId) async {
    if(!kIsWeb) {
      await _localDataSource.deleteItem(orderItemId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.deleteItem(orderItemId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> deliverOrder(String orderId) async{
    if(!kIsWeb) {
      await _localDataSource.deliverOrder(orderId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.deliverOrder(orderId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<OrderItem?> getItem(String orderItemId) async {
    if(!kIsWeb) {
      final item = await _localDataSource.getItem(orderItemId);
      if(item != null){
        return item;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getItem(orderItemId);
    }

    return null;
  }

  @override
  Future<List<OrderItem>> getItems(String orderId) async {
    final  List<OrderItem> options = [];
    if(!kIsWeb) {
      options.addAll(await _localDataSource.getItems(orderId));
      if(options.isNotEmpty){
        return options;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getItems(orderId);
    }

    return options;
  }

  @override
  Future<Order?> getOrder(String orderId) async {
    if(!kIsWeb) {
      final order = await _localDataSource.getOrder(orderId);
      if(order != null){
        return order;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return _remoteDataSource.getOrder(orderId);
    }

    return null;
  }

  @override
  Future<List<Order>> getOrders() async {
    final  List<Order> options = [];
    if(!kIsWeb) {
      options.addAll(await _localDataSource.getOrders());
      if(options.isNotEmpty){
        return options;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getOrders();
    }

    return options;
  }

  @override
  Future<List<Order>> getActiveOrders() async {
    final  List<Order> options = [];
    if(!kIsWeb) {
      options.addAll(await _localDataSource.getActiveOrders());
      if(options.isNotEmpty){
        return options;
      }
    } 
    
    if(await _connectivity.isOnline()) {
      return await _remoteDataSource.getActiveOrders();
    }

    return options;
  }

  @override
  Future<void> increaseItemQuantity(String orderItemId) async {
    if(!kIsWeb) {
      await _localDataSource.increaseItemQuantity(orderItemId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.increaseItemQuantity(orderItemId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> payOrder(String orderId) async{
    if(!kIsWeb) {
      await _localDataSource.payOrder(orderId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.payOrder(orderId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }

  @override
  Future<void> syncOrders() {
    // TODO: implement syncOrders
    throw UnimplementedError();
  }

  @override
  Future<void> validateOrder(String orderId) async {
    if(!kIsWeb) {
      await _localDataSource.validateOrder(orderId);
    }
     
    if(await _connectivity.isOnline()) {
      await _remoteDataSource.validateOrder(orderId);
    } else if(!kIsWeb) {
      //TODO add to QUEUE
    }
  }
    
  /*@override
  Future<Order> createOrder(Order order) async {
    final model = OrderModel(
      id: order.id,
      items: order.items.cast(), 
      createdAt: order.createdAt, 
      synced: order.synced
    );

    await local.saveOrder(model);

    if(await connectivity.isOnline()){
      await remote.saveOrder(model);
      await local.markAsSynced(model.id);
    }
  }
    
  @override
  Future<List<Order>> getOrders() {
    return local.getUnsyncedOrders();
  }

  @override
  Future<void> syncOrders() async {
    final unsynced = await local.getUnsyncedOrders();
    for(final order in unsynced){
      await remote.saveOrder(order);
      await local.markAsSynced(order.id);
    }
  }
  */
}