import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class SwitchOrder {
  final OrderRepository repository;
  SwitchOrder(this.repository);

  Future<void> call(String orderId, String newTableId) async{
    await repository.switchOrder(orderId, newTableId);
  }
}