import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/pos_action_dialog.dart';
import 'package:pos_app/features/orders/presentation/widgets/order/show_transfert_table_dialog.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository_provider.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_modal.dart';
import 'package:pos_app/features/plan/application/plan_notifier.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';


import '../widgets/app_bar/pos_app_bar.dart';
import '../widgets/order/order_panel.dart';
import '../widgets/product/product_section.dart';

class PosPage extends ConsumerWidget {
  final bool isTable;

  const PosPage({
    super.key, 
    this.isTable = true,
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersProvider);
    final orderNotifier = ref.read(ordersProvider.notifier);
    final planNotifier = ref.read(planProvider.notifier);
    final order = ordersState.selectedOrder;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            PosAppBar(
              order: ordersState.selectedOrder,
              tableId: planNotifier.getName(isTable),
              onSave: !orderNotifier.isDraftAvailable()
                    ? null : () {
                      orderNotifier.saveOrder();
                      planNotifier.changeTableState(TableStatus.waitingForService);
                    },
              onCancel: order == null || order.status == OrderStatus.paid || order.status == OrderStatus.delivred || order.status == OrderStatus.cancelled || order.items.isEmpty
                    ? null : () {
                      _showCancelOrderDialog(context, orderNotifier, planNotifier);
                    },
              onClean: order?.status == OrderStatus.paid || order?.status == OrderStatus.delivred || order?.status == OrderStatus.cancelled 
                    ? () {
                      orderNotifier.clearOrder();
                      ref.read(paymentsProvider.notifier).clearPayment(order?.id ?? "");
                      planNotifier.changeTableState(TableStatus.empty);
                    } : null,
              onTransfert: order == null || order.status == OrderStatus.paid || order.items.isEmpty ? null : () async {
                final targetTableId = await showTransferTableDialog(
                  context: context,
                  plans: ref.read(planProvider).plans,
                  tables: ref.read(planProvider).tables,
                  currentTableId: ref.read(planProvider).selectedTableId,
                );

                if (targetTableId != null) {
                  RestaurantTable table = planNotifier.getTable(targetTableId);
                  if(table.status != TableStatus.empty){
                    await showPosActionDialog<bool>(
                      context: context,
                      title: 'Fusionner la commande ?',
                      content:
                          'La table sélectionnée (${planNotifier.getNameById(targetTableId)}) est déjà occupé, Voulez-vous Fusionner les 2 tables ?',
                      actions: [
                        const PosDialogAction<bool>(
                          label: 'Annuler',
                          onPressed: null,
                        ),
                        PosDialogAction<bool>(
                          label: 'Fusionner',
                          icon: Icons.swap_horiz,
                          onPressed: () { orderNotifier.fusionOrMove(targetTableId);},
                        ),
                      ],
                    );
                  } else {
                    await showPosActionDialog<bool>(
                      context: context,
                      title: 'Transférer la commande ?',
                      content:
                          'La commande sera transférée vers la table sélectionnée (${planNotifier.getNameById(targetTableId)}).',
                      actions: [
                        const PosDialogAction<bool>(
                          label: 'Annuler',
                          onPressed: null,
                        ),
                        PosDialogAction<bool>(
                          label: 'Transférer',
                          icon: Icons.swap_horiz,
                          onPressed: () { orderNotifier.fusionOrMove(targetTableId);},
                        ),
                      ],
                    );
                  }
                  
                }
              },
              //onTicket: ,
              onPay: order == null || order.status == OrderStatus.paid || order.status == OrderStatus.delivred || order.status == OrderStatus.cancelled || order.status == OrderStatus.draft
                    ? null : () {
                      showDialog( 
                        context: context,
                        builder: (_) => PaymentModal(
                          orderId: order.id, 
                          payOrder: (payment) {
                            orderNotifier.payOrder(payment); 
                            planNotifier.changeTableState(TableStatus.paid);
                          },
                        )
                      );
                    },
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 430,
                      child: OrderPanel(
                        order: ordersState.selectedOrder
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: ProductSection(
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            const Text("Confirmation Annulation Commande"),
          ],
        ),
        content: Text(
          "Vous voulez bien annuler cette commande ?"
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  const Color.fromARGB(255, 240, 140, 133)),
            onPressed: () {
              orderNotifier.cancelOrder();
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