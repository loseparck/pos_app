// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentSessionDto _$CreatePaymentSessionDtoFromJson(
        Map<String, dynamic> json) =>
    CreatePaymentSessionDto(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      mode: $enumDecode(_$PaymentModeEnumMap, json['mode']),
      partCounts: (json['partCounts'] as num?)?.toInt() ?? 0,
      createdById: json['createdById'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CreatePaymentSessionDtoToJson(
        CreatePaymentSessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'partCounts': instance.partCounts,
      'createdById': instance.createdById,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$PaymentModeEnumMap = {
  PaymentMode.total: 'total',
  PaymentMode.split: 'split',
  PaymentMode.item: 'item',
};
