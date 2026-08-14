import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

class MergeOrder {
  final OrderRepository repository;
  MergeOrder(this.repository);

  Future<void> call(String sourceId, String targetId, OrderStatus newStatus) async{
    await repository.mergeOrder(sourceId, targetId, newStatus);
  }
}