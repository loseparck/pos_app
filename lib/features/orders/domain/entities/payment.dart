import 'package:pos_app/features/orders/domain/entities/discount.dart';
import 'package:pos_app/features/orders/domain/entities/payment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

enum PaymentType{total, split, order}

class Payment {
  final String? id;
  final PaymentType type;
  final PaymentEntity details;
  final Discount? discount;
  final String? orderId;

  Payment({
    required this.details,
    this.type = PaymentType.total,
    this.discount,
    this.id,
    this.orderId
  }); 

  Payment copyWith({
    Discount? discount,
    PaymentType? type,
    PaymentEntity? details,
  }) {
    return Payment(
      id: id,
      type: type ?? this.type,
      details: details ?? this.details,
      discount: discount ?? this.discount,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  factory Payment.fromJson(Map<String, dynamic> json){
    return Payment(
      id: json['id'] as String,
      type: $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']) ??
          PaymentType.total,
      details: PaymentEntity.fromJson(json['details'], $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']) ?? PaymentType.total),
      discount: Discount.fromJson(json['discount']),
      
    );
  }

  

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'type': _$PaymentTypeEnumMap[type],
      'details': details.toJson(),
      'discount': discount?.toJson(),
    };
  }
}

const _$PaymentTypeEnumMap = {
  PaymentType.total: 'total',
  PaymentType.split: 'split',
  PaymentType.order: 'order',
};
