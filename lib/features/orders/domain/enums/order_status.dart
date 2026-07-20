import 'package:flutter/material.dart';

enum OrderStatus {
  draft(label: "draft", color:  Color(0xFF95A5A6), order: 0),
  waitingValidation(label: "waitingValidation", color:  Color(0xFF9B59B6), order: 1),
  waitingForPreparation(label: "waitingForPreparation", color:  Color(0xFF3498DB), order: 2),
  preparationInProgress(label: "preparationInProgress", color:  Color(0xFFE67E22), order: 3),
  toServe(label: "toServe", color:  Color(0xFF2ECC71), order: 4),
  served(label: "served", color:  Color(0xFF34495E), order: 5),
  toBeDelivered(label: "toBeDelivered", color:  Color(0xFF2ECC71), order: 4),
  delivred(label: "delivred", color:  Color(0xFF34495E), order: 5),
  waitingForPayment(label: "waitingForPayment", color:  Color(0xFFF1C40F), order: 6),
  paid(label: "paid", color:  Color(0xFF27AE60), order: 7),
  cancelled(label: "cancelled", color:  Color(0xFFC0392B), order: 8);

  const OrderStatus({
    required this.label,
    required this.color,
    required this.order,
  });

  final String label;
  final Color color;
  final int order;

  static OrderStatus? fromLabel(String label) {
    for (final value in OrderStatus.values) {
      if (value.label == label) {
        return value;
      }
    }
    return null;
  }
}

/*
const orderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.validated: 'validated',
  OrderStatus.waitingValidation: 'waitingValidation',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.delivred: 'delivred',
  OrderStatus.paid: 'paid',
};
*/