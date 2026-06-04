import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';

class AddItem {
  final OrderRepository repository;
  AddItem(this.repository);

  Future<OrderItem> call(OrderItem orderItem) async{
    return await repository.addItem(orderItem);
  }
}