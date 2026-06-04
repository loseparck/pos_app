import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/payments/domain/entities/payment_entity.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';
import 'package:json_annotation/json_annotation.dart';
class PaymentTotal extends PaymentEntity{
  
  final double? givenAmount;
  final Discount? discount;
  final PaymentMode? paymentMode;

  PaymentTotal({
    this.givenAmount = 0,
    this.discount,
    this.paymentMode = PaymentMode.cash,
    super.id,
  }); 

  PaymentTotal copyWith({
    double? givenAmount,
    Discount? discount,
    PaymentMode? paymentMode,
  }) {
    return PaymentTotal(
      id: id,
      givenAmount: givenAmount ?? this.givenAmount,
      paymentMode: paymentMode ?? this.paymentMode,
      discount: discount ?? this.discount,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  factory PaymentTotal.fromJson(Map<String, dynamic> json){
    return PaymentTotal(
      id: json['id'] as String,
      givenAmount: (json['givenAmount'] as num).toDouble(),
      paymentMode: $enumDecodeNullable(_$PaymentModeEnumMap, json['paymentMode']) ??
          PaymentMode.cash,
      discount: Discount.fromJson(json['discount'])
    );
  }

  @override
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'givenAmount': givenAmount,
      'paymentMode': _$PaymentModeEnumMap[paymentMode],
      'discount': discount?.toJson(),
    };
  }
}

const _$PaymentModeEnumMap = {
  PaymentMode.card: 'card',
  PaymentMode.cash: 'cash',
  PaymentMode.other: 'other',
};
