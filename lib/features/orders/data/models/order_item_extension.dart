import 'package:pos_app/features/orders/data/models/order_item_option_extention.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

extension OrderItemExtension on OrderItem {
  /// Prix des options (HT)
  double get optionsSubtotal =>
      options.fold<double>(
        0,
        (sum, option) => sum + option.subtotal,
      );

  /// Prix du produit (HT)
  double get productSubtotal =>
      unitPrice * quantity;

  /// Sous-total HT (produit + options)
  double get subtotal =>
      productSubtotal + optionsSubtotal;

  /// TVA du produit
  double get productVatAmount =>
      productSubtotal * vat / 100;

  /// TVA des options
  double get optionsVatAmount =>
      options.fold<double>(
        0,
        (sum, option) => sum + option.vatAmount,
      );

  /// TVA totale
  double get vatAmount =>
      productVatAmount + optionsVatAmount;

  /// Total TTC
  double get total =>
      subtotal + vatAmount;

  /// Nombre total d'options
  int get optionQuantity =>
      options.fold<int>(
        0,
        (sum, option) => sum + option.quantity,
      );

  /// Le produit possède des options
  bool get hasOptions => options.isNotEmpty;

  /// Produit annulé
  bool get isCancelled =>
      status == OrderStatus.cancelled;

  /// Produit payé
  bool get isPaid =>
      status == OrderStatus.paid;

  /// Produit encore modifiable
  bool get isEditable =>
      status == OrderStatus.draft;

  List<OrderItemOption> get sortedOptions {
    final copy = [...options];

    copy.sort(
      (a, b) => a.itemName.compareTo(b.itemName),
    );

    return copy;
  }
}