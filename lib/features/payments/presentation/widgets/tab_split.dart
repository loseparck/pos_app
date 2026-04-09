import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/payments/presentation/state/payment_state.dart';
import 'package:pos_app/features/payments/presentation/widgets/input_line.dart';
import 'package:pos_app/features/payments/presentation/widgets/line.dart';
import 'package:pos_app/features/payments/presentation/widgets/monnaie_line.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_mode_button.dart';
import '../state/payment_provider.dart';
import 'discount_block.dart';

class TabSplit extends ConsumerWidget {

  const TabSplit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.read(ordersProvider);
    
    if (orderState == null || orderState.selectedOrder == null) {
      return const SizedBox();
    }

    final order = orderState.selectedOrder!;
    return Column(
      children: [
        DiscountBlock(),

        const SizedBox(height: 10),

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

        _paymentSplitSummary(ref, order.total),
          
        const SizedBox(height: 10),

        PaymentModeButton(),
      ],
    );
  }

  Widget _paymentSplitSummary(WidgetRef ref, double total) {
    final notifier = ref.read(paymentProvider.notifier);
    final state = ref.watch(paymentProvider);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child:  InputLine(label: "Nombre de parts", fieldKey: PaymentState.partCountInput)),
            const SizedBox(width: 20,),
            Expanded(child:  _partLine(PaymentState.partCountInput,  total, state)),
          ],
        ),

        const Divider(),

        Row(
          children: [
            Expanded(child: InputLine(label: "Montant donné", fieldKey: PaymentState.splitChangeInput)),
            const SizedBox(width: 20,),
            Expanded(
              child: MonnaieLine(
                fieldKey: PaymentState.splitChangeInput,
                total: total / (int.tryParse(state.fieldValues[PaymentState.partCountInput]?.text ?? "1") ?? 1)
              )
            ),
          ],
        ),

        Row(
          children: [
            Expanded(child: Line(label: "Nombre de Parts payé", text: "${notifier.getPaidPartCount()}")),
            const SizedBox(width: 20,),
            Expanded(child: Line(label: "Nombre de Parts Restantes", text: notifier.getPartToPayCount())),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.green.shade400,
                  ),
                  onPressed: notifier.isAddPartEnabled() ? (){
                    ref.read(paymentProvider.notifier).addPart(); //addPart();
                  } : null,
                  child: Row(
                    children: [
                      const Icon(Icons.group_add_outlined),
                      Text(
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        " Payer une part"),
                    ],
                  )
                ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _partLine(String fieldKey, double total, PaymentState state) {
    final controller = state.fieldValues[fieldKey]!;
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final text = value.text;
        final parts = double.tryParse(text) ?? 1;
        final monnaie = total / parts;
        return Line(label: "Montant pour cette Part", text: monnaie.toStringAsFixed(2));
      },
    );
  }
}