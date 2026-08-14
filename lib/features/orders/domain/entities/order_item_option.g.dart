// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemOption _$OrderItemOptionFromJson(Map<String, dynamic> json) =>
    OrderItemOption(
      id: json['id'] as String,
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String,
      optionId: json['optionId'] as String?,
      optionName: json['optionName'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      orderItemId: json['orderItemId'] as String,
      vat: (json['vat'] as num?)?.toDouble() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$OrderItemOptionToJson(OrderItemOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderItemId': instance.orderItemId,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'optionId': instance.optionId,
      'optionName': instance.optionName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'vat': instance.vat,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdById': instance.createdById,
    };
