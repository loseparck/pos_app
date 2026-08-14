import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/orders/data/models/order_item_extension.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/price_text.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/quantity_badge.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/status_badge.dart';

import 'order_item_option_tile.dart';

class OrderItemTile  extends ConsumerWidget {
  final String itemId;

  const OrderItemTile({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(orderItemProvider(itemId));
    final selectedId = ref.watch(selectedOrderItemIdProvider);
    final isSelected = selectedId == item?.id;
    
    if(item == null){
      return Text("No Item Found");
    }
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        if( ref.read(selectedOrderItemIdProvider.notifier).state == item.id){
          ref.read(selectedOrderItemIdProvider.notifier).state = null;
        } else {
          ref.read(selectedOrderItemIdProvider.notifier).state = item.id;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.only(top: 4, left: 6, right: 8, bottom: 4),
        decoration: BoxDecoration(
          color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
             color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                QuantityBadge(
                    quantity: item.quantity,
                ),

                const SizedBox(width: 6),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),

                      if (item.comment?.isNotEmpty ?? false)
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 2),
                          child: Text(
                            item.comment!,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(width: 6),
                StatusBadge(
                  label: item.status.label,
                  icon: item.status.icon,
                  color: item.status.color,
                ),

                const SizedBox(width: 6),

                PriceText(
                        value: item.total.money,
                    ),
              ],
            ),

            if (item.hasOptions) ...[
              const SizedBox(height: 4),

              const Divider(height: 1),

              //const SizedBox(height: ),

              ...item.options.map(
                (option) => OrderItemOptionTile(
                  option: option,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}