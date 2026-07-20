// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTransaction _$PaymentTransactionFromJson(Map<String, dynamic> json) =>
    PaymentTransaction(
      id: json['id'] as String,
      validatedAt: DateTime.parse(json['validatedAt'] as String),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      amountDue: (json['amountDue'] as num).toDouble(),
      amountReceived: (json['amountReceived'] as num).toDouble(),
      session: PaymentSession.fromJson(json['session'] as Map<String, dynamic>),
      paidPartCount: (json['paidPartCount'] as num?)?.toInt() ?? 0,
      paidArticlesQty: (json['paidArticlesQty'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      discount: json['discount'] == null
          ? null
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$PaymentTransactionToJson(PaymentTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'validatedAt': instance.validatedAt.toIso8601String(),
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'amountDue': instance.amountDue,
      'amountReceived': instance.amountReceived,
      'paidPartCount': instance.paidPartCount,
      'paidArticlesQty': instance.paidArticlesQty,
      'discount': instance.discount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdById': instance.createdById,
      'session': instance.session,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.card: 'card',
  PaymentMethod.other: 'other',
};
