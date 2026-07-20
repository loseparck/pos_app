

import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

part 'create_payment_session_dto.g.dart';

@JsonSerializable()
class CreatePaymentSessionDto {
  final String id;
  final String orderId;
  final PaymentMode mode;
  final int partCounts;
  final String? createdById;
  final DateTime? createdAt;

  CreatePaymentSessionDto({
    required this.id,
    required this.orderId,
    required this.mode,
    this.partCounts = 0,
    this.createdById,
    this.createdAt,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  factory CreatePaymentSessionDto.fromJson(Map<String, dynamic> json)
      => _$CreatePaymentSessionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentSessionDtoToJson(this);
}