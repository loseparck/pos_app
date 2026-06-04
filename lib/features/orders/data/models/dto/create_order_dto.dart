

import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/orders/data/models/dto/create_order_item_dto.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

part 'create_order_dto.g.dart';

@JsonSerializable()
class CreateOrderDto {
  final String id;
  final String? tableId;
  final String? groupId;
  final List<CreateOrderItemDto> items;
  final OrderStatus status;
  final DateTime? createdAt;
  final String? createdById;

  CreateOrderDto({
    required this.id,
    required this.items,
    required this.status,
    this.tableId,
    this.groupId,
    this.createdAt,
    this.createdById
  });

  @override
  String toString() {
    return toJson().toString();
  }

  factory CreateOrderDto.fromJson(Map<String, dynamic> json)
      => _$CreateOrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderDtoToJson(this);
}