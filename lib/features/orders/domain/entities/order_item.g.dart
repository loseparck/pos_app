// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as String,
      productId: json['productId'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      vat: (json['vat'] as num).toDouble(),
      createdAt: (json['createdAt'] as DateTime),
      validatedAt: (json['validatedAt'] as DateTime),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'vat': instance.vat,
      'createdAt': instance.createdAt,
      'validatedAt': instance.validatedAt,
      'status': instance.status,
      'options': instance.options,
    };
