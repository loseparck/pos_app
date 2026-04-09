import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/payments/presentation/state/payment_state.dart';
import 'package:pos_app/features/payments/presentation/widgets/input_line.dart';
import 'package:pos_app/features/payments/presentation/widgets/line.dart';
import 'package:pos_app/features/payments/presentation/widgets/monnaie_line.dart';
import 'package:pos_app/features/payments/presentation/widgets/payment_mode_button.dart';
import 'discount_block.dart';

class TabTotal extends ConsumerWidget {

  const TabTotal({super.key});
  
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

        Row(
          children: [
            Expanded(child: InputLine(label: "Montant donné", fieldKey: PaymentState.totalChangeInput)),
            const SizedBox(width: 20),
            Expanded(child: MonnaieLine(fieldKey: PaymentState.totalChangeInput, total: order.total)),
          ],
        ),
  
        const SizedBox(height: 10),

        PaymentModeButton(),
      ],
    );
  }
}