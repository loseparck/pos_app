import 'package:pos_app/features/orders/domain/entities/discount.dart';
import 'package:pos_app/features/orders/domain/entities/payment_total.dart';

class PaymentItem {
  final String? id;
  final Discount? discount;
  final List<String> orderIds;
  final PaymentTotal? paymentDetail;

  PaymentItem({
    required this.orderIds,
    this.paymentDetail,
    this.discount,
    this.id,
  });

  PaymentItem copyWith({
    Discount? discount,
    int? numberOfParts,
    PaymentTotal? paymentDetail,
    List<String>? orderIds
  }) {
    return PaymentItem(
      id: id,
      orderIds: orderIds ?? this.orderIds,
      paymentDetail: paymentDetail ?? this.paymentDetail,
      discount: discount ?? this.discount,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  factory PaymentItem.fromJson(Map<String, dynamic> json){
    return PaymentItem(
      id: json['id'] as String,
      paymentDetail: PaymentTotal.fromJson(json['paymentDetail']),
      orderIds: json['orderIds'],
      discount: Discount.fromJson(json['discount']),
      
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'paymentDetail': paymentDetail?.toJson(),
      'orderIds': orderIds,
      'discount': discount?.toJson(),
    };
  }
}