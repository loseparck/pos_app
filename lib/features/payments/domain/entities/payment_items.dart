import 'package:pos_app/features/payments/domain/entities/payment_entity.dart';
import 'package:pos_app/features/payments/domain/entities/payment_item.dart';

class PaymentItems extends PaymentEntity{
  List<PaymentItem> itemsPaid;

  PaymentItems({
    required this.itemsPaid,
    super.id
  }); 

  PaymentItems copyWith({
    List<PaymentItem>? itemsPaid,
  }) {
    return PaymentItems(
      id: id,
      itemsPaid: itemsPaid ?? this.itemsPaid
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  factory PaymentItems.fromJson(Map<String, dynamic> json){
    return PaymentItems(
      id: json['id'] as String,
      itemsPaid:  (json['paymentDetails'] as List<dynamic>)
          .map((e) => PaymentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      
    );
  }

  @override
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'itemsPaid': itemsPaid,
    };
  }
}
