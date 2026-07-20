import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

part 'payment_transaction.g.dart';

@JsonSerializable()
class PaymentTransaction {
  final String id;
  final DateTime validatedAt;
  final PaymentMethod paymentMethod; 
  final double amountDue;        // Montant net demandé pour ce groupe
  final double amountReceived;   // Ce que le client a donné
  
  // Ce qui a été encaissé durant CETTE transaction précise
  final int paidPartCount; 
  final Map<String, int> paidArticlesQty;
  
  // Les réductions appliquées uniquement aux éléments de CETTE transaction
  final Discount? discount;

  final DateTime? createdAt;
  final String? createdById;


  final PaymentSession session;

  const PaymentTransaction({
    required this.id,
    required this.validatedAt,
    required this.paymentMethod,
    required this.amountDue,
    required this.amountReceived,
    required this.session,
    this.paidPartCount = 0,
    this.paidArticlesQty = const {},
    this.discount,
    this.createdAt,
    this.createdById,
  });

  double get netReturned => amountReceived - amountDue;

  
  @override
  String toString() {
    return toJson().toString();
  }

  factory PaymentTransaction.fromJson(Map<String, dynamic> json)
      => _$PaymentTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTransactionToJson(this);
}