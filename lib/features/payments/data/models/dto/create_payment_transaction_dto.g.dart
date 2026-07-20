// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentTransactionDto _$CreatePaymentTransactionDtoFromJson(
        Map<String, dynamic> json) =>
    CreatePaymentTransactionDto(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      amountDue: (json['amountDue'] as num).toDouble(),
      amountReceived: (json['amountReceived'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      paidPartCount: (json['paidPartCount'] as num?)?.toInt() ?? 0,
      discountId: json['discountId'] as String?,
      paidArticlesQty: (json['paidArticlesQty'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      validatedAt: json['validatedAt'] == null
          ? null
          : DateTime.parse(json['validatedAt'] as String),
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$CreatePaymentTransactionDtoToJson(
        CreatePaymentTransactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'discountId': instance.discountId,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'amountDue': instance.amountDue,
      'amountReceived': instance.amountReceived,
      'paidPartCount': instance.paidPartCount,
      'paidArticlesQty': instance.paidArticlesQty,
      'createdAt': instance.createdAt.toIso8601String(),
      'validatedAt': instance.validatedAt?.toIso8601String(),
      'createdById': instance.createdById,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.card: 'card',
  PaymentMethod.other: 'other',
};
