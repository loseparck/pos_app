import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class RemoveItem {
  final OrderRepository repository;
  RemoveItem(this.repository);

  Future<void> call(String orderItemId) async{
    await repository.deleteItem(orderItemId);
  }
}