import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final String id;
  final String productId;
  final String name;
  int quantity;
  final double unitPrice;
  final double vat;
  final List<OptionItem>? options;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? validatedAt;
  final bool synced;

  OrderItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.createdAt,
    this.synced = false,
    this.options,
    this.status = OrderStatus.draft,
    this.validatedAt,
    this.vat = 0,
  });

  double get supplementsTotal =>
      options!.fold(0, (sum, s) => sum + s.price);

  double get supplementsVAT =>
      options!.fold(0, (sum, s) => sum + s.vat);

  double get total => (unitPrice + supplementsTotal) * quantity;

  double get totalVAT => (vat + supplementsVAT) * quantity;

  OrderItem copyWith({
    String? id,
    int? quantity,
    OrderStatus? status,
    DateTime? validatedAt,
  }) {
    return OrderItem(
      id: id ?? this.id,
      productId: productId,
      name: name,
      unitPrice: unitPrice,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt,
      options: options,
      synced: synced,
      status: status ?? this.status,
      validatedAt: validatedAt ?? this.validatedAt,
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