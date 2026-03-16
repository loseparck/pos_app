import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';

class OrderPanel extends ConsumerWidget {
  final Order? order;

  const OrderPanel({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if (order == null) {
      return const Center(child: Text("Aucune commande"));
    }

    return Column(
      children: [

        /// LIST ITEMS
        Expanded(
          child: ListView.builder(
            itemCount: order!.items.length,
            itemBuilder: (context, index) {

              final item = order!.items[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(
                    "${item.unitPrice} x ${item.quantity}"),
                trailing: Text(
                    "${item.total.toStringAsFixed(2)} €"),
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
                "${order!.total.toStringAsFixed(2)} €",
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