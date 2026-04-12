import 'package:pos_app/features/payments/domain/entities/payment.dart';
import 'package:pos_app/features/payments/domain/entities/payment_items.dart';
import 'package:pos_app/features/payments/domain/entities/payment_split.dart';
import 'package:pos_app/features/payments/domain/entities/payment_total.dart';

abstract class PaymentEntity {
  final String? id;
  PaymentEntity({this.id});

  factory PaymentEntity.fromJson(Map<String, dynamic> json, PaymentType paymentType) {
    switch(paymentType){
      case PaymentType.total: return PaymentTotal.fromJson(json);
      case PaymentType.split: return PaymentSplit.fromJson(json);
      default: return PaymentItems.fromJson(json);
    }
  }

  Map<String, dynamic> toJson();

}