// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderItemDto _$CreateOrderItemDtoFromJson(Map<String, dynamic> json) =>
    CreateOrderItemDto(
      id: json['id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      vat: (json['vat'] as num).toDouble(),
      status: OrderStatus.fromLabel(json['status']) ?? OrderStatus.draft,
      createdAt: DateTime.parse(json['createdAt'] as String),
      productName: json['productName'] as String,
      orderId: json['orderId'] as String,
      productId: json['productId'] as String?,
      comment: json['comment'] as String?,
      options: (json['options'] as List<dynamic>)
          .map((e) =>
              CreateOrderItemOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      validatedAt: json['validatedAt'] == null
          ? null
          : DateTime.parse(json['validatedAt'] as String),
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$CreateOrderItemDtoToJson(CreateOrderItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'productName': instance.productName,
      'comment': instance.comment,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'vat': instance.vat,
      'options': instance.options,
      'status': instance.status.label,
      'createdAt': instance.createdAt.toIso8601String(),
      'validatedAt': instance.validatedAt?.toIso8601String(),
      'createdById': instance.createdById,
    };

