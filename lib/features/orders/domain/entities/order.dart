import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String id;
  final String? tableId;
  final String? groupId;
  final List<OrderItem> items;
  final OrderStatus status;
  final PaymentSession? payment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;

  Order({
    required this.id,
    required this.items,
    this.tableId,
    this.groupId,
    this.status = OrderStatus.draft,
    this.payment,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

  double get total => items.fold(0, (sum , item) => sum + item.total);

  double get totalVAT => items.fold(0, (sum , item) => sum + item.vat);

  double get totalItems => items.fold(0, (sum , item) => sum + item.quantity);

  Order copyWith({
    String? id,
    List<OrderItem>? items,
    OrderStatus? status,
    PaymentSession? payment,
    String? tableId,
    String? groupId,
    DateTime? updatedAt
  }) {
    return Order(
      id: id ?? this.id,
      tableId: tableId ?? this.tableId,
      items: items ?? this.items,
      status: status ?? this.status,
      groupId: groupId ?? this.groupId,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt,
      createdById: createdById,
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