import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final String id;
  final String productId;
  final String orderId;
  final String productName;
  final String? comment;
  final int quantity;
  final double unitPrice;
  final double vat;
  final List<OrderItemOption> options;
  final OrderStatus status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;
  final DateTime? validatedAt;

  OrderItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.orderId,
   // this.synced = false,
    required this.options,
    this.status = OrderStatus.draft,
    this.validatedAt,
    this.vat = 0,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

  double get supplementsTotal =>
      options.fold(0, (sum, s) => sum + (s.unitPrice * s.quantity));

  double get supplementsVAT =>
      options.fold(0, (sum, s) => sum + s.vat);

  double get total => (unitPrice + supplementsTotal) * quantity;

  double get totalVAT => (vat + supplementsVAT) * quantity;

  OrderItem copyWith({
    String? id,
    String? productId,
    String? productName,
    int? quantity,
    OrderStatus? status,
    DateTime? validatedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? comment,
    double? unitPrice,
    double? vat,
    List<OrderItemOption>? options,
  }) {
    return OrderItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      comment: comment ?? this.comment,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      options: options ?? this.options,
      status: status ?? this.status,
      validatedAt: validatedAt ?? this.validatedAt,
      orderId: orderId
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory OrderItem.fromJson(Map<String, dynamic> json)
      => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}