import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/payments/presentation/state/payment_notifier.dart';
import 'package:pos_app/features/payments/presentation/state/payment_state.dart';
import 'package:pos_app/features/payments/presentation/widgets/input_line.dart';
import 'package:pos_app/features/payments/presentation/widgets/line.dart';
import 'package:pos_app/features/payments/presentation/widgets/monnaie_line.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_dialog_item.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_mode_button.dart';
import '../state/payment_provider.dart';
import 'discount_block.dart';

class TabItems extends ConsumerWidget {

  const TabItems({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.read(ordersProvider);
    
    if (orderState == null || orderState.selectedOrder == null) {
      return const SizedBox();
    }

    final order = orderState.selectedOrder!;

    final state = ref.watch(paymentProvider);
    final notifier = ref.read(paymentProvider.notifier);

    List<OrderItem> items = fillItemsList(order);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 250,
            color: Colors.grey.shade100,
            child: ListView.builder(
              controller: ScrollController(),
              itemCount: items.length,
              itemBuilder: (ctext, index) {

                final item = items[index];
                final isSelected = state.selectedIds.contains(item.id);
                final isPaid = state.paidItems.contains(item.id);
                return PaymentDialogItem(
                  productName: item.name,
                  productPrice: item.unitPrice,
                  supplements: item.options,
                  backgroundColor: isPaid ? Colors.green : isSelected ? Colors.orange : Colors.white,
                  onAdd: isPaid ?  () {} : () {
                      if (isSelected) {
                        notifier.removeSelectedItem(item.id);
                      } else {
                        notifier.addSelectedItem(item.id);
                      }
                  },
                  onRemove: () {
                  },
                );
              },
            ),
          ),
        ),

        const SizedBox(width: 10),

        /// PARTIE DROITE
        Expanded(
          child: Column(
            children: [
             DiscountBlock(),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Line(label: "Total de la Commande", text: order.total.toStringAsFixed(2))),
                      const SizedBox(width: 20),
                      Expanded(child: Line(label: "Réduction", text: "-2€")),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(child: Line(label: "Total après Réduction", text: "23€"),),
                      const SizedBox(width: 20),
                      Expanded(child: Line(label: "TVA", text: order.totalVAT.toStringAsFixed(2))),
                    ],
                  ),

                  const Divider(),

                  _paymentItemSummary(state, items, notifier),
            
                  const SizedBox(height: 10),

                  PaymentModeButton(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _paymentItemSummary(PaymentState state, List<OrderItem> items, PaymentNotifier notifier) {
    final double total = items.fold(0.0, (sum, s) => sum + (state.selectedIds.contains(s.id) ? s.total : 0));
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: InputLine(label: "Montant donné", fieldKey: PaymentState.itemsChangeInput)),
            const SizedBox(width: 20,),
            Expanded(child: MonnaieLine(fieldKey: PaymentState.itemsChangeInput, total: total)),
          ],
        ),
        
        Line(label: "Total Selection", text: "$total"),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.green.shade400,
                  ),
                  onPressed: state.selectedIds.isNotEmpty ? (){
                    notifier.addItem();
                    
                  } : null,
                  child: Row(
                    children: [
                      const Icon(Icons.add_shopping_cart),
                      Text(
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        " Payer la selection"),
                    ],
                  )
                ),
            ],
          ),
        ),
      ],
    );
  }
}