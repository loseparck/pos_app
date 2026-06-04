
import 'package:json_annotation/json_annotation.dart';

part 'create_order_item_option_dto.g.dart';

@JsonSerializable()
class CreateOrderItemOptionDto {
  final String id;
  final String orderItemId;
  final String? optionId;
  final String optionName;
  final int quantity;
  final double unitPrice;
  final double vat;
  final DateTime createdAt;
  final String? createdById;

  CreateOrderItemOptionDto({
    required this.id,
    required this.orderItemId,
    required this.quantity, 
    required this.unitPrice, 
    required this.vat,
    required this.createdAt, 
    this.optionId, 
    required this.optionName,
    this.createdById
    });

    @override
  String toString() {
    return toJson().toString();
  }

  factory CreateOrderItemOptionDto.fromJson(Map<String, dynamic> json)
      => _$CreateOrderItemOptionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderItemOptionDtoToJson(this);
}