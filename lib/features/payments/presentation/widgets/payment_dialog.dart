import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/payments/domain/entities/payment.dart';
import 'package:pos_app/features/payments/presentation/state/payment_provider.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_keypad.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_tabs.dart';
import 'package:pos_app/features/payments/presentation/widgets/tab_items.dart';
import 'package:pos_app/features/payments/presentation/widgets/tab_split.dart';
import 'package:pos_app/features/payments/presentation/widgets/tab_total.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

class PaymentDialog extends ConsumerStatefulWidget {
  const PaymentDialog({super.key});

  @override
  ConsumerState<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends ConsumerState<PaymentDialog> {  
  List<OrderItem> fillItemsList(Order? order){
    List<OrderItem> items = [];
    for(OrderItem item in order!.items){
      for (int i = 0; i < item.quantity; i++) {
        items.add(item.copyWith(id: "${item.id}-$i", quantity: 1));
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.read(ordersProvider);
    
    if (orderState == null || orderState.selectedOrder == null) {
      return const SizedBox();
    }

    final order = orderState.selectedOrder!;
    final notifier = ref.watch(paymentProvider.notifier);
    List<OrderItem> items = fillItemsList(order);
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text("Paiement", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      PaymentTabs(label: "Total", index: 0),
                      PaymentTabs(label: "Split", index: 1),
                      PaymentTabs(label: "Items", index: 2),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),
            
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: _buildContent(),
                  ),
                ),
                
                const VerticalDivider(),
                SizedBox(
                  width: 220,
                  child: PaymentKeypad(),
                ),
                const VerticalDivider(width: 5),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.green.shade400,
                      ),
                      onPressed: !notifier.checkIfEnableSave(items.length) ? null : (){
                        Payment? payment = ref.read(paymentProvider.notifier).savePayment();
                        if(payment != null){
                          ref.read(ordersProvider.notifier).payOrder(payment);
                          ref.read(planProvider.notifier).changeTableState(TableStatus.empty);
                          Navigator.pop(context);
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.price_check_rounded),
                          Text(
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            " Enregistrer le Paiement"),
                        ],
                      )
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    var selectedTab = ref.watch(paymentProvider).selectedTab;
    switch (selectedTab) {
      case 0:
        return TabTotal();
      case 1:
        return TabSplit();
      case 2:
        return TabItems();
      default:
        return const SizedBox();
    }
  }
}