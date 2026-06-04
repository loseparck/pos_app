import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class PayOrder {
  final OrderRepository repository;
  PayOrder(this.repository);

  Future<void> call(String orderItemId) async{
    repository.payOrder(orderItemId);
  }
}