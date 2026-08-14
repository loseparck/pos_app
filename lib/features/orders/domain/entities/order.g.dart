// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableId: json['tableId'] as String?,
      groupId: json['groupId'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.draft,
      payment: json['payment'] == null
          ? null
          : PaymentSession.fromJson(json['payment'] as Map<String, dynamic>),
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

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'tableId': instance.tableId,
      'groupId': instance.groupId,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'payment': instance.payment,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdById': instance.createdById,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.waitingValidation: 'waitingValidation',
  OrderStatus.waitingForPreparation: 'waitingForPreparation',
  OrderStatus.preparationInProgress: 'preparationInProgress',
  OrderStatus.toServe: 'toServe',
  OrderStatus.served: 'served',
  OrderStatus.toBeDelivered: 'toBeDelivered',
  OrderStatus.delivred: 'delivred',
  OrderStatus.waitingForPayment: 'waitingForPayment',
  OrderStatus.paid: 'paid',
  OrderStatus.cancelled: 'cancelled',
};
