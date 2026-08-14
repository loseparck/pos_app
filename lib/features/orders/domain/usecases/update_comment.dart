import 'package:pos_app/features/orders/data/repositories/order_repository.dart';

class UpdateComment {
  final OrderRepository repository;
  UpdateComment(this.repository);

  Future<void> call(String orderItemId, String comment) async{
    await repository.updateComment(orderItemId, comment);
  }
}