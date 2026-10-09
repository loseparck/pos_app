// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderDto _$CreateOrderDtoFromJson(Map<String, dynamic> json) =>
    CreateOrderDto(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CreateOrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(orderStatusEnumMap, json['status']),
      tableId: json['tableId'] as String?,
      groupId: json['groupId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$CreateOrderDtoToJson(CreateOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableId': instance.tableId,
      'groupId': instance.groupId,
      'items': instance.items,
      'status': orderStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdById': instance.createdById,
    };


