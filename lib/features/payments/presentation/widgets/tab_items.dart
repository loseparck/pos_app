import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';
import 'discount_block.dart';
import 'payment_summary.dart';

class TabItems extends ConsumerWidget {
  final double total;

  const TabItems({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider(total));
    final notifier = ref.read(paymentProvider(total).notifier);

    final given = double.tryParse(
            state.fieldValues["given_amount_items"] ?? "0") ??
        0;

    return Column(
      children: [
        const DiscountBlock(),

        const SizedBox(height: 10),

        Wrap(
          spacing: 8,
          children: state.selectedIds.map((id) {
            final selected = state.selectedIds.contains(id);

            return ChoiceChip(
              label: Text(id),
              selected: selected,
              onSelected: (_) => notifier.selectItem(id),
            );
          }).toList(),
        ),

        const SizedBox(height: 10),

        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: state.fieldValues["given_amount_items"],
          ),
          decoration: const InputDecoration(
            labelText: "Montant donné",
            border: OutlineInputBorder(),
          ),
          onTap: () => notifier.setActiveField("given_amount_items"),
        ),

        const SizedBox(height: 10),

        PaymentSummary(
          total: total,
          given: given,
        ),

        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () => notifier.addItemsPayment(),
          child: const Text("Payer la sélection"),
        ),
      ],
    );
  }
}