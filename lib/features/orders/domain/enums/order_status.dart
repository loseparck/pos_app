import 'package:flutter/material.dart';

extension OrderStatusExtension on OrderStatus {
  String get printedLabel {
    switch (this) {
      case OrderStatus.draft:
        return "Brouillon";

      case OrderStatus.waitingForPreparation || OrderStatus.waitingValidation:
        return "En attente";

      case OrderStatus.preparationInProgress:
        return "Préparation";

      case OrderStatus.toServe || OrderStatus.toBeDelivered:
        return "Prête";

      case OrderStatus.served:
        return "Servie";

      case OrderStatus.delivred:
        return "Livrée";

      case OrderStatus.paid:
        return "Payée";

      case OrderStatus.cancelled:
        return "Annulée";

      case OrderStatus.waitingForPayment:
        return "En Attente du Paiement";

      case OrderStatus.ended:
        return "Terminé";
    }
  }
}

enum OrderStatus {
  draft(label: "draft", color:  Color(0xFF95A5A6), order: 0, icon: Icons.drafts),
  waitingValidation(label: "waitingValidation", color:  Color(0xFF9B59B6), order: 1, icon: Icons.drafts),
  waitingForPreparation(label: "waitingForPreparation", color:  Color(0xFF3498DB), order: 2, icon: Icons.drafts),
  preparationInProgress(label: "preparationInProgress", color:  Color(0xFFE67E22), order: 3, icon: Icons.drafts),
  toServe(label: "toServe", color:  Color(0xFF2ECC71), order: 4, icon: Icons.drafts),
  served(label: "served", color:  Color(0xFF34495E), order: 5, icon: Icons.drafts),
  toBeDelivered(label: "toBeDelivered", color:  Color(0xFF2ECC71), order: 4, icon: Icons.drafts),
  delivred(label: "delivred", color:  Color(0xFF34495E), order: 5, icon: Icons.drafts),
  waitingForPayment(label: "waitingForPayment", color:  Color(0xFFF1C40F), order: 6, icon: Icons.drafts),
  paid(label: "paid", color:  Color(0xFF27AE60), order: 7, icon: Icons.drafts),
  cancelled(label: "cancelled", color:  Color(0xFFC0392B), order: 8, icon: Icons.drafts),
  ended(label: "ended", color:  Color(0xFF27AE60), order: 9, icon: Icons.drafts);

  const OrderStatus({
    required this.label,
    required this.color,
    required this.order,
    required this.icon,
  });

  final String label;
  final Color color;
  final int order;
  final IconData icon;

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