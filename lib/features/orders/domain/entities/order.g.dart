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
      createdAt: DateTime.parse(json['createdAt'] as String),
      synced: json['synced'] as bool? ?? false,
      tableId: json['tableId'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.draft,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'tableId': instance.tableId,
      'items': instance.items,
      'createdAt': instance.createdAt.toIso8601String(),
      'synced': instance.synced,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.saved: 'saved',
  OrderStatus.paid: 'paid',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.waitingValidation: 'waitingValidation',
};
