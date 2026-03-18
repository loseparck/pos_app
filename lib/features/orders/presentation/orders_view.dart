import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/presentation/widgets/payment_dialog.dart';
import 'package:pos_app/features/orders/presentation/widgets/product_grid.dart';
import 'package:pos_app/features/orders/presentation/widgets/order_panel.dart';


class OrdersView extends ConsumerWidget {
  final String tableId;

  const OrdersView({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersProvider);

    return Scaffold(
      body: Column(
        children: [

          /// =============================
          /// TOP BAR POS
          /// =============================

          Container(
            height: 60,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [

                /// ANNULER
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(ordersProvider.notifier)
                        .cancelOrder("");

                    Navigator.pop(context);
                  },
                  child: const Text("Annuler"),
                ),

                const SizedBox(width: 8),

                /// ENREGISTRER
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(ordersProvider.notifier)
                        .saveOrder();
                  },
                  child: const Text("Enregistrer"),
                ),

                const SizedBox(width: 8),

                /// PAIEMENT
                ElevatedButton(
                  onPressed: ordersState == null
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (_) =>
                                const PaymentDialog(),
                          );
                        },
                  child: const Text("Paiement"),
                ),

                const Spacer(),

                /// RETOUR
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Retour"),
                ),
              ],
            ),
          ),

          /// =============================
          /// MAIN CONTENT
          /// =============================

          Expanded(
            child: Row(
              children: [

                /// =============================
                /// ORDER PANEL (LEFT)
                /// =============================

                SizedBox(
                  width: 350,
                  child: OrderPanel(
                  ),
                ),

                const VerticalDivider(width: 1),

                /// =============================
                /// PRODUCT AREA
                /// =============================

                Expanded(
                  child: Column(
                    children: [

                      /// SEARCH BAR
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Rechercher produit...",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            ref
                                .read(
                                  productSearchQueryProvider
                                      .notifier,
                                )
                                .state = value;
                          },
                        ),
                      ),

                      /// PRODUCT GRID
                      const Expanded(
                        child: ProductGrid(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}