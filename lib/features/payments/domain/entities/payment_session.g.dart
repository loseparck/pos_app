// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSession _$PaymentSessionFromJson(Map<String, dynamic> json) =>
    PaymentSession(
      id: json['id'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      history: (json['history'] as List<dynamic>?)
              ?.map(
                  (e) => PaymentTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mode: $enumDecode(_$PaymentModeEnumMap, json['mode']),
      partCounts: (json['partCounts'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$PaymentSessionToJson(PaymentSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'history': instance.history,
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'partCounts': instance.partCounts,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdById': instance.createdById,
    };

const _$PaymentModeEnumMap = {
  PaymentMode.total: 'total',
  PaymentMode.split: 'split',
  PaymentMode.item: 'item',
};
