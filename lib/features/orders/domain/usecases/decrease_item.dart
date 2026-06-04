import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class DecreaseItem {
  final OrderRepository repository;
  DecreaseItem(this.repository);

  Future<void> call(String orderItemId) async{
    repository.decreaseItemQuantity(orderItemId);
  }
}