
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';

part 'create_payment_transaction_dto.g.dart';

@JsonSerializable()
class CreatePaymentTransactionDto {
  final String id;
  final String sessionId;
  final String? discountId;
  final PaymentMethod paymentMethod;
  final double amountDue;
  final double amountReceived;
  final int paidPartCount;
  final Map<String, int> paidArticlesQty;
  final DateTime createdAt;
  final DateTime? validatedAt;
  final String? createdById;

  CreatePaymentTransactionDto({
    required this.id,
    required this.sessionId, 
    required this.paymentMethod, 
    required this.amountDue, 
    required this.amountReceived, 
    required this.createdAt,
    this.paidPartCount = 0, 
    this.discountId, 
    this.paidArticlesQty = const {}, 
    this.validatedAt,
    this.createdById
    });

    @override
  String toString() {
    return toJson().toString();
  }

  factory CreatePaymentTransactionDto.fromJson(Map<String, dynamic> json)
      => _$CreatePaymentTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentTransactionDtoToJson(this);
}