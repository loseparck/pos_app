import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

class ChangeOrderStatus {
  final OrderRepository repository;
  ChangeOrderStatus(this.repository);

  Future<void> call(String orderId, OrderStatus status) async{
    repository.changeOrderStatus(orderId, status);
  }
}