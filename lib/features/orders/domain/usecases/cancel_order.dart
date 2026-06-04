import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class CancelOrder {
  final OrderRepository repository;
  CancelOrder(this.repository);

  Future<void> call(String orderItemId) async{
    repository.cancelOrder(orderItemId);
  }
}