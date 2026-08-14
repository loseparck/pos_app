import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class SwitchOrderItem {
  final OrderRepository repository;
  SwitchOrderItem(this.repository);

  Future<void> call(String orderItemId, String newOrderId) async{
    await repository.switchOrderItem(orderItemId, newOrderId);
  }
}