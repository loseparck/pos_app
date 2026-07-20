import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

class PayOrder {
  final OrderRepository repository;
  PayOrder(this.repository);

  Future<void> call(String orderItemId, PaymentSession payment) async{
    repository.payOrder(orderItemId, payment);
  }
}