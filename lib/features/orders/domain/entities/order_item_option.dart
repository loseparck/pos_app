import 'package:json_annotation/json_annotation.dart';

part 'order_item_option.g.dart';

@JsonSerializable()
class OrderItemOption {
  final String id;
  final String orderItemId;
  final String? itemId;
  final String itemName;
  final String? optionId;
  final String? optionName;
  final int quantity;
  final double unitPrice;
  final double vat;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;

  OrderItemOption({
    required this.id,
    required this.itemId,
    required this.itemName,
    this.optionId,
    this.optionName,
    required this.quantity,
    required this.unitPrice,
    required this.orderItemId,
    this.vat = 0,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

  OrderItemOption copyWith({
    String? id,
    String? itemId,
    String? itemName,
    int? quantity,
    double? unitPrice,
    double? vat,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? orderItemId,
  }) {
    return OrderItemOption(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      unitPrice: unitPrice ?? this.unitPrice,
      vat: vat ?? this.vat,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById,
      orderItemId: orderItemId ?? this.orderItemId,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory OrderItemOption.fromJson(Map<String, dynamic> json)
      => _$OrderItemOptionFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemOptionToJson(this);
}