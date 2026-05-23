import 'package:pos_app/features/orders/domain/entities/discount.dart';
import 'package:pos_app/features/payments/domain/entities/payment_entity.dart';
import 'package:pos_app/features/payments/domain/entities/payment_total.dart';

class PaymentSplit extends PaymentEntity {
  final Discount? discount;
  final int numberOfParts;
  List<PaymentTotal> paymentDetails;

  PaymentSplit({
    this.numberOfParts = 1,
    required this.paymentDetails,
    this.discount,
    super.id,
  });
  
  PaymentSplit copyWith({
    Discount? discount,
    int? numberOfParts,
    List<PaymentTotal>? paymentDetails,
  }) {
    return PaymentSplit(
      id: id,
      numberOfParts: numberOfParts ?? this.numberOfParts,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      discount: discount ?? this.discount,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  factory PaymentSplit.fromJson(Map<String, dynamic> json){
    return PaymentSplit(
      id: json['id'] as String,
      numberOfParts: (json['numberOfParts'] as num).toInt(),
      paymentDetails:  (json['paymentDetails'] as List<dynamic>)
          .map((e) => PaymentTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
      discount: Discount.fromJson(json['discount']),
      
    );
  }

  @override
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'numberOfParts': numberOfParts,
      'paymentDetails': paymentDetails,
      'discount': discount?.toJson(),
    };
  }
}

