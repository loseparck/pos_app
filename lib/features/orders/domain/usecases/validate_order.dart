import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class ValidateOrder {
  final OrderRepository repository;
  ValidateOrder(this.repository);

  Future<void> call(String orderId) async{
    repository.validateOrder(orderId);
  }
}