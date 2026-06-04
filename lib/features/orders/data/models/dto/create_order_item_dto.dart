
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_item_option_dto.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

part 'create_order_item_dto.g.dart';

@JsonSerializable()
class CreateOrderItemDto {
  final String id;
  final String orderId;
  final String? productId;
  final String productName;
  final String? comment;
  final int quantity;
  final double unitPrice;
  final double vat;
  final List<CreateOrderItemOptionDto> options;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? validatedAt;
  final String? createdById;

  CreateOrderItemDto({
    required this.id,
    required this.quantity, 
    required this.unitPrice, 
    required this.vat, 
    required this.status, 
    required this.createdAt,
    required this.productName, 
    required this.orderId, 
    this.productId, 
    this.comment, 
    required this.options, 
    this.validatedAt,
    this.createdById
    });

    @override
  String toString() {
    return toJson().toString();
  }

  factory CreateOrderItemDto.fromJson(Map<String, dynamic> json)
      => _$CreateOrderItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderItemDtoToJson(this);
}