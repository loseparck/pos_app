import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

class Order{
  final String id;
  final String? tableId;
  final List<OrderItem> items;
  final DateTime createdAt;
  final bool synced;
  final OrderStatus status;

  Order({
    required this.id,
    required this.items,
    required this.createdAt,
    this.synced = false,
    this.tableId,
    this.status = OrderStatus.draft,
  });

  double get total => items.fold(0, (sum , item) => sum + item.subtotal);

  Order copyWith({
    List<OrderItem>? items,
    OrderStatus? status,
  }) {
    return Order(
      id: id,
      tableId: tableId,
      items: items ?? this.items,
      status: status ?? this.status,
      createdAt: createdAt,
    );
  }
}