

import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';

extension OrderItemOptionExtension on OrderItemOption {
  /// Sous-total HT
  double get subtotal =>
      unitPrice * quantity;

  /// TVA
  double get vatAmount =>
      subtotal * vat / 100;

  /// Total TTC
  double get total =>
      subtotal + vatAmount;
}