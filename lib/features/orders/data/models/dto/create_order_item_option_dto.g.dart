// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_item_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderItemOptionDto _$CreateOrderItemOptionDtoFromJson(
        Map<String, dynamic> json) =>
    CreateOrderItemOptionDto(
      id: json['id'] as String,
      orderItemId: json['orderItemId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      vat: (json['vat'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      optionId: json['optionId'] as String?,
      optionName: json['optionName'] as String,
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$CreateOrderItemOptionDtoToJson(
        CreateOrderItemOptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderItemId': instance.orderItemId,
      'optionId': instance.optionId,
      'optionName': instance.optionName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'vat': instance.vat,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdById': instance.createdById,
    };
