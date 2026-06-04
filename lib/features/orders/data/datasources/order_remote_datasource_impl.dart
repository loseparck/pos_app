import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_dto.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_item_dto.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';

class OrderRemoteDatasourceImpl implements OrderRemoteDatasource {
  final Dio _dio;

  OrderRemoteDatasourceImpl(this._dio);

  @override
  Future<OrderItem> addItem(CreateOrderItemDto orderItem) async {
    final response = await _dio.post(
      '${ApiEndpoints.orders}/items',
      data: orderItem.toJson(),
    );
    
    return OrderItem.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    final response = await _dio.patch(
      '${ApiEndpoints.orders}/$orderId/cancel'
    );
    if(response.data == null){

    }
    //TODO check if reseult Ok
  }

  @override
  Future<Order> createOrder(CreateOrderDto order) async {
    final response = await _dio.post(
      ApiEndpoints.orders,
      data: order.toJson(),
    );
    
    return Order.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> decreaseItemQuantity(String orderItemId) async{
    final response = await _dio.patch(
      '${ApiEndpoints.orders}/items/$orderItemId/increase'
    );

    if(response.data == null){

    }
    //TODO check if reseult Ok
  }

  @override
  Future<void> deleteItem(String orderItemId) async {
    final response = await _dio.delete(
      '${ApiEndpoints.orders}/items/$orderItemId'
    );
    if(response.data == null){

    }
    //TODO check if reseult Ok
  }

  @override
  Future<void> deliverOrder(String orderId) async {
    final response = await _dio.patch(
      '${ApiEndpoints.orders}/$orderId/deliver'
    );
    if(response.data == null){

    }
    //TODO check if reseult Ok
  }

  @override
  Future<OrderItem> getItem(String orderItemId) async {
    final response = await _dio.get(
      '${ApiEndpoints.orders}/items/$orderItemId'
    );

    return OrderItem.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<OrderItem>> getItems(orderId) async {
    final response = await _dio.get(
      '${ApiEndpoints.orders}/$orderId/items',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => OrderItem.fromJson(e)).toList();
  }

  @override
  Future<Order> getOrder(String orderId) async {
    final response = await _dio.get(
      '${ApiEndpoints.orders}/$orderId'
    );

    return Order.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<Order>> getOrders() async {
    final response = await _dio.get(
      ApiEndpoints.orders,
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => Order.fromJson(e)).toList();
  }

  @override
  Future<List<Order>> getActiveOrders() async {
    final response = await _dio.get(
      '${ApiEndpoints.orders}/active',
    );
    
    return (response.data['data'] as List<dynamic>).map((e) => Order.fromJson(e)).toList();
  }

  @override
  Future<void> increaseItemQuantity(String orderItemId) async {
    final response = await _dio.patch(
      '${ApiEndpoints.orders}/items/$orderItemId/decrease'
    );
    if(response.data == null){

    }
    //TODO check if reseult Ok
  }

  @override
  Future<void> payOrder(String orderId) async {
    final response = await _dio.patch(
      '${ApiEndpoints.orders}/$orderId/pay'
    );
    if(response.data == null){

    }
    //TODO check if reseult Ok
  }

  @override
  Future<void> validateOrder(String orderId) async {
    final response = await _dio.patch(
      '${ApiEndpoints.orders}/$orderId/validate'
    );
    if(response.data == null){

    }
    //TODO check if reseult Ok
  }
}