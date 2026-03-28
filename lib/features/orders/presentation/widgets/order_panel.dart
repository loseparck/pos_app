import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/presentation/widgets/order_panel_item.dart';

class OrderPanel extends ConsumerStatefulWidget {

  const OrderPanel({super.key});

  @override
  ConsumerState<OrderPanel> createState() => _OrderPanel();
}

class _OrderPanel extends ConsumerState<OrderPanel> {

  @override
  Widget build(BuildContext context) {
    Order? order = ref.watch(ordersProvider)!.selectedOrder;
    
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
                productName: item.name,
                productPrice: item.unitPrice,
                quantity: item.quantity,
                supplements: item.options,

                onAdd: () {
                  setState(() {
                    item.quantity++;
                  });
                },

                onRemove: () {
                  setState(() {
                    if (item.quantity > 1) {
                      item.quantity--;
                    }
                    else{
                      order.items.removeAt(index);
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