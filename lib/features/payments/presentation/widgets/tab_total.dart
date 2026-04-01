import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';
import 'discount_block.dart';
import 'payment_summary.dart';

class TabTotal extends ConsumerWidget {
  final double total;

  const TabTotal({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider(total));
    final notifier = ref.read(paymentProvider(total).notifier);

    final given = double.tryParse(
            state.fieldValues["given_amount"] ?? "0") ??
        0;

    return Column(
      children: [
        const DiscountBlock(),
        const SizedBox(height: 10),

        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: state.fieldValues["given_amount"],
          ),
          decoration: const InputDecoration(
            labelText: "Montant donné",
            border: OutlineInputBorder(),
          ),
          onTap: () => notifier.setActiveField("given_amount"),
        ),

        const SizedBox(height: 10),

        PaymentSummary(
          total: total,
          given: given,
        ),
      ],
    );
  }
}