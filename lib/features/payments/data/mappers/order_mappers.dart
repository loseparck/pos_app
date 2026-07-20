import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/payments/data/models/dto/create_payment_session_dto.dart';
import 'package:pos_app/features/payments/data/models/dto/create_payment_transaction_dto.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';


extension PaymentSessionMapper on PaymentSession {
  CreatePaymentSessionDto toCreateDto() {
    return CreatePaymentSessionDto(
      id: id,
      orderId: order.id,
      mode: mode,
      partCounts: partCounts ?? 0,
      createdById: createdById,
    );
  }

  PaymentSessionDriftCompanion toDrift() {
    return PaymentSessionDriftCompanion(
      id: Value(id),
      orderId: Value(order.id),
      partCounts: Value(partCounts ?? 0),
      mode: Value(paymentModeEnumMap[mode] ?? 'draft'),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById),
    );
  }
}

extension CreateOrderDtoMapper on CreatePaymentSessionDto {
  PaymentSession toEntity() {
    return PaymentSession(
      id: id,
      order: Order(id: orderId, items: []),
      mode: mode,
      partCounts: partCounts,
      createdAt: createdAt,
      createdById: createdById
    );
  }

  PaymentSessionDriftCompanion toDrift() {
    return PaymentSessionDriftCompanion(
      id: Value(id),
      orderId: Value(orderId),
      partCounts: Value(partCounts),
      mode: Value(paymentModeEnumMap[mode] ?? 'draft'),
      createdAt:  Value(createdAt ?? DateTime.now()),
      createdById:  Value(createdById),
      updatedAt:  Value(DateTime.now()),
    );
  }
}

extension PaymentSessionDriftMapper on PaymentSessionDriftData {
  PaymentSession toEntity({List<PaymentTransaction>? history}) {
    return PaymentSession(
      id: id,
      order: Order(id: orderId, items: []),
      partCounts: partCounts,
      mode: $enumDecodeNullable(paymentModeEnumMap, mode) ?? PaymentMode.total,
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
      history: history ?? []
    );
  }
}

extension PaymentTransactionMapper on PaymentTransaction {
  CreatePaymentTransactionDto toCreateDto() {
    return CreatePaymentTransactionDto(
      id: id,
      sessionId: session.id,
      discountId: discount?.id,
      paymentMethod: paymentMethod,
      amountDue:amountDue,
      amountReceived:amountReceived,
      paidPartCount:paidPartCount,
      paidArticlesQty: paidArticlesQty,
      createdAt:createdAt ?? DateTime.now(),
      validatedAt: validatedAt,
      createdById:createdById,
    );
  }

  PaymentTransactionDriftCompanion toDrift() {
    return PaymentTransactionDriftCompanion(
      id: Value(id),
      sessionId: Value(session.id),
      discountId: Value(discount?.id),
      paymentMethod: Value(paymentMethodEnumMap[paymentMethod] ?? 'cash'),
      amountDue: Value(amountDue),
      amountReceived: Value(amountReceived),
      paidPartCount: Value(paidPartCount),
      paidArticlesQty: Value(paidArticlesQty),
      validatedAt: Value(validatedAt),
      createdAt: Value(createdAt ?? DateTime.now()),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById)
    );  
  }
}

extension PaymentTransactionDtoMapper on CreatePaymentTransactionDto {
  PaymentTransaction toEntity() {
    return PaymentTransaction(
      id: id,
      paidArticlesQty: paidArticlesQty,
      paidPartCount: paidPartCount,
      amountReceived: amountReceived,
      amountDue: amountDue,
      paymentMethod: paymentMethod,
      validatedAt: validatedAt ?? DateTime.now(),
      discount: discountId != null ? Discount(id: discountId!, name: '') : null,
      createdAt: createdAt,
      createdById: createdById,
      session: PaymentSession(id: sessionId, order: Order(id: '', items: []), mode: PaymentMode.total),
    );
  }

  PaymentTransactionDriftCompanion toDrift() {
    return PaymentTransactionDriftCompanion(
       id: Value(id),
      sessionId: Value(sessionId),
      discountId: Value(discountId),
      paymentMethod: Value(paymentMethodEnumMap[paymentMethod] ?? 'cash'),
      amountDue: Value(amountDue),
      amountReceived: Value(amountReceived),
      paidPartCount: Value(paidPartCount),
      paidArticlesQty: Value(paidArticlesQty),
      validatedAt: Value(validatedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(DateTime.now()),
      createdById: Value(createdById)
    );
  }
}

extension PaymentTransactionDriftMapper on PaymentTransactionDriftData {
  PaymentTransaction toEntity() {
    return PaymentTransaction(
      id: id,
      paidArticlesQty: paidArticlesQty,
      paidPartCount: paidPartCount,
      amountReceived: amountReceived,
      amountDue: amountDue,
      paymentMethod: $enumDecodeNullable(paymentMethodEnumMap, paymentMethod) ?? PaymentMethod.cash,
      validatedAt: validatedAt ?? DateTime.now(),
      discount: discountId != null ? Discount(id: discountId!, name: '') : null,
      createdAt: createdAt,
      createdById: createdById,
      session: PaymentSession(id: sessionId, order: Order(id: '', items: []), mode: PaymentMode.total),
    );
  }
}