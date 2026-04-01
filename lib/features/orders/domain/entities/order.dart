import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/payment.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String id;
  final String? tableId;
  final String? groupId;
  final List<OrderItem> items;
  final DateTime createdAt;
  final bool synced;
  final OrderStatus status;
  final Payment? payment;

  Order({
    required this.id,
    required this.items,
    required this.createdAt,
    this.synced = false,
    this.tableId,
    this.groupId,
    this.status = OrderStatus.draft,
    this.payment,
  });

  double get total => items.fold(0, (sum , item) => sum + item.total);

  double get totalVAT => items.fold(0, (sum , item) => sum + item.vat);

  Order copyWith({
    List<OrderItem>? items,
    OrderStatus? status,
    Payment? payment,
  }) {
    return Order(
      id: id,
      tableId: tableId,
      items: items ?? this.items,
      status: status ?? this.status,
      createdAt: createdAt,
      payment: payment ?? this.payment,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Order.fromJson(Map<String, dynamic> json)
      => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}