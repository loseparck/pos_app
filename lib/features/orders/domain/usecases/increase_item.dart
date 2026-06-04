import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class IncreaseItem {
  final OrderRepository repository;
  IncreaseItem(this.repository);

  Future<void> call(String orderItemId) async{
    repository.increaseItemQuantity(orderItemId);
  }
}