import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';

import 'empty_order.dart';
import 'order_item_tile.dart';

class OrderItemsList extends ConsumerWidget {
  const OrderItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(orderItemsProvider);

    if (items.isEmpty) {
      return const EmptyOrder();
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, index) {
        return OrderItemTile(
          itemId: items[index].id,
        );
      },
    );
  }
}