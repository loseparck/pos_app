import 'package:pos_app/features/orders/domain/entities/order.dart';

import 'order_item_extension.dart';

extension OrderExtension on Order {
  /// Nombre de lignes
  int get lineCount =>
      items.length;

  /// Nombre total d'articles
  int get quantity =>
      items.fold<int>(
        0,
        (sum, item) => sum + item.quantity,
      );

  /// Nombre total d'options
  int get optionQuantity =>
      items.fold<int>(
        0,
        (sum, item) => sum + item.optionQuantity,
      );

  /// Sous-total HT
  double get subtotal =>
      items.fold<double>(
        0,
        (sum, item) => sum + item.subtotal,
      );

  /// TVA
  double get vat =>
      items.fold<double>(
        0,
        (sum, item) => sum + item.vatAmount,
      );

  /// Total TTC
  double get total =>
      subtotal + vat;

  /// Nombre d'articles encore en brouillon
  int get draftCount =>
      items.where((e) => e.isEditable).length;

  /// Nombre d'articles payés
  int get paidCount =>
      items.where((e) => e.isPaid).length;

  /// Nombre d'articles annulés
  int get cancelledCount =>
      items.where((e) => e.isCancelled).length;

  /// Tous les articles sont payés
  bool get isFullyPaid =>
      items.isNotEmpty &&
      paidCount == items.length;

  /// Tous les articles sont annulés
  bool get isFullyCancelled =>
      items.isNotEmpty &&
      cancelledCount == items.length;

  /// Tous les articles sont encore modifiables
  bool get isEditable =>
      items.every((e) => e.isEditable);

  /// La commande contient au moins un article
  bool get isNotEmpty =>
      items.isNotEmpty;

  bool get isEmpty =>
      items.isEmpty;

  String get shortId => id.substring(0,8);
}