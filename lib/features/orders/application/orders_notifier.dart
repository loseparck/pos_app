import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/product.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, Order?>(
        (ref) => OrdersNotifier());

class OrdersNotifier extends StateNotifier<Order?> {
  OrdersNotifier() : super(null);

  void createDraft(String tableId) {
    state = Order(
      id: UniqueKey().toString(),
      tableId: tableId,
      items: [],
      status: OrderStatus.draft,
      createdAt: DateTime.now(),
    );
  }

  void addProduct(Product product) {

    /// récupérer la commande actuelle
    Order? order = state;

    /// si aucune commande → créer une draft
    order ??= Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: [],
        createdAt: DateTime.now(),
      );

    final items = [...order.items];

    /// vérifier si produit déjà dans la commande
    final index =
        items.indexWhere((i) => i.productId == product.id);

    if (index != -1) {

      final existing = items[index];

      items[index] = existing.copyWith(
        quantity: existing.quantity + 1,
      );

    } else {

      items.add(
        OrderItem(
          productId: product.id,
          name: product.name,
          quantity: 1,
          unitPrice: product.price,
        ),
      );
    }

    final newOrder = order.copyWith(items: items);

    state = newOrder;
  }
  /*void addProduct(Product product) {
    final existing = state!.items
        .where((i) => i.productId == product.id)
        .toList();

    if (existing.isNotEmpty) {
      state = state!.copyWith(
        items: state!.items.map((i) {
          if (i.productId == product.id) {
            return i.copyWith(
                quantity: i.quantity + 1);
          }
          return i;
        }).toList(),
      );
    } else {
      state = state!.copyWith(
        items: [
          ...state!.items,
          OrderItem(
            productId: product.id,
            name: product.name,
            unitPrice: product.price,
            quantity: 1,
            options: [],
          )
        ],
      );
    }
  }*/

  void saveOrder() {
    state = state!.copyWith(
        status: OrderStatus.saved);
  }

  void cancelOrder() {
    state = null;
  }

  void payOrder() {
    state = state!.copyWith(
        status: OrderStatus.paid);
  }
}