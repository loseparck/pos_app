import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';
import 'discount_block.dart';
import 'payment_summary.dart';

class TabSplit extends ConsumerWidget {
  final double total;

  const TabSplit({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider(total));
    final notifier = ref.read(paymentProvider(total).notifier);

    final parts =
        int.tryParse(state.fieldValues["split_count"] ?? "1") ?? 1;

    final given = double.tryParse(
            state.fieldValues["given_amount_split"] ?? "0") ??
        0;

    final partAmount = total / parts;

    return Column(
      children: [
        const DiscountBlock(),
        const SizedBox(height: 10),

        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: state.fieldValues["split_count"],
          ),
          decoration: const InputDecoration(
            labelText: "Nombre de parts",
            border: OutlineInputBorder(),
          ),
          onTap: () => notifier.setActiveField("split_count"),
        ),

        const SizedBox(height: 10),

        Text("Montant par part : ${partAmount.toStringAsFixed(2)}"),

        const Divider(),

        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: state.fieldValues["given_amount_split"],
          ),
          decoration: const InputDecoration(
            labelText: "Montant donné",
            border: OutlineInputBorder(),
          ),
          onTap: () => notifier.setActiveField("given_amount_split"),
        ),

        const SizedBox(height: 10),

        PaymentSummary(
          total: partAmount,
          given: given,
        ),

        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () => notifier.addPart(),
          child: const Text("Payer une part"),
        ),
      ],
    );
  }
}