import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:pos_app/features/orders/presentation/widgets/order_panel_item.dart';

class OrderPanel extends ConsumerStatefulWidget {

  const OrderPanel({super.key});

  @override
  ConsumerState<OrderPanel> createState() => _OrderPanel();
}

class _OrderPanel extends ConsumerState<OrderPanel> {

  /*Color getBackgroundColor(OrderStatus orderStatus,OrderStatus itemStatus) {
    if(orderStatus == OrderStatus.paid)
    {
      return Colors.green.shade100;
    }
    switch (itemStatus) {
      case OrderStatus.draft:
        return Colors.orange.shade100;
      case OrderStatus.paid:
        return Colors.green.shade100;
      case OrderStatus.cancelled:
        return Colors.red.shade100;
      default:
        return Colors.white;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Order? order = ref.watch(ordersProvider).selectedOrder;
    final notifier = ref.read(ordersProvider.notifier);
    if (order == null) {
      return const Center(child: Text("Aucune commande"));
    }
    
    return Column(
      children: [

        /// LIST ITEMS
        Expanded(
          child: ListView.builder(
            itemCount: order.items.length,
            itemBuilder: (ctext, index) {

              final item = order.items[index];
              return OrderPanelItem(
                productName: item.productName,
                productPrice: item.unitPrice,
                quantity: item.quantity,
                supplements: item.options,
                backgroundColor: order.status == OrderStatus.paid ? order.status.color : item.status.color,
                onAdd: item.status != OrderStatus.draft ? null : () {
                  notifier.increaseQuantity(item.id, order.id);
                },

                onRemove: item.status != OrderStatus.draft ? null : () {
                  setState(() {
                    if (item.quantity > 1) {
                      notifier.decreaseQuantity(item.id, order.id);
                    }
                    else{
                      if(notifier.isDraftAvailable()){
                        notifier.changeOrderStatus(notifier.getOrderStatus());
                      }
                      notifier.removeItem(item.id, order.id);
                    }
                  });
                },

              );
            },
          ),
        ),

        /// TOTAL
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TOTAL",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                "${order.total.toStringAsFixed(2)} €",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }
}