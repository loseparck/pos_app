import 'package:pos_app/features/orders/data/repositories/order_repository_impl.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';

class CreateOrder {
  final OrderRepository repository;
  CreateOrder(this.repository);

  Future<void> call(List<OrderItem> items) async{
    final order = Order(
      id: DateTime.now().millisecond.toString(),
      items: items, 
      createdAt: DateTime.now(),
      );
      await repository.createOrder(order);
  }
}