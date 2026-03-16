import 'package:dio/dio.dart';
import 'package:pos_app/features/orders/data/models/order_model.dart';

abstract class OrderRemoteDatasource {
  Future<void> sendOrder(OrderModel order);
}

class OrderRemoteDatasourceImpl implements OrderRemoteDatasource {
  final Dio client;

  OrderRemoteDatasourceImpl(this.client);

  @override
  Future<void> sendOrder(OrderModel order) async{
    await client.post('/orders', data: order.toJson());
  }
}