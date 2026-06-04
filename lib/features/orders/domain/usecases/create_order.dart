import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';

class CreateOrder {
  final OrderRepository repository;
  CreateOrder(this.repository);

  Future<Order> call(Order order) async{
    return await repository.createOrder(order);
  }
}