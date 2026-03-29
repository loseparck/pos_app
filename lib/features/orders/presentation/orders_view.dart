import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:pos_app/features/orders/presentation/widgets/payment_dialog.dart';
import 'package:pos_app/features/orders/presentation/widgets/product_grid.dart';
import 'package:pos_app/features/orders/presentation/widgets/order_panel.dart';
import 'package:pos_app/features/plan/data/repositories/plan_group_provider.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';
import 'package:pos_app/features/plan/presentation/state/plan_group_state.dart';
import 'package:pos_app/features/plan/presentation/state/plan_state_notifier.dart';


class OrdersView extends ConsumerWidget {
  final String supportId;
  final bool isTable;

  const OrdersView({
    super.key,
    required this.supportId,
    this.isTable = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final groupState = ref.watch(planGroupProvider);
    
    final orderNotifier = ref.read(ordersProvider.notifier);
    final planNotifier = ref.read(planGroupProvider.notifier);
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
                    _showCancelOrderDialog(context, orderNotifier, planNotifier);
                  },
                  child: const Text("Annuler"),
                ),

                const SizedBox(width: 8),

                /// ENREGISTRER
                ElevatedButton(
                  onPressed: () {
                    orderNotifier.saveOrder();
                    planNotifier.changeTableState(TableStatus.validated);
                  },
                  child: const Text("Enregistrera"),
                ),

                const SizedBox(width: 8),

                /// PAIEMENT
                ElevatedButton(
                  onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) =>
                                const PaymentDialog(),
                          );
                        },
                  child: const Text("Paiement"),
                ),

                const Spacer(),

                Text(planNotifier.getName(isTable)),

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

  void _showCancelOrderDialog(
    BuildContext context, OrdersNotifier orderNotifier, PlanGroupNotifier planNotifier
  ) {
    showDialog(
      context: context,
       builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Confirmation Suppression Commande"),
          ],
        ),
        content: Text(
          "Vous voulez bien supprimer cette commande ?"
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  const Color.fromARGB(255, 240, 140, 133)),
            onPressed: () {
              orderNotifier.cancelOrder(context);
              planNotifier.changeTableState(TableStatus.empty);
              Navigator.pop(context);
            }, 
            child: const Text("Oui"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  const Color.fromARGB(255, 125, 224, 130)),
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text("Non"),
          ),
        ],
       )
    );
  }

}