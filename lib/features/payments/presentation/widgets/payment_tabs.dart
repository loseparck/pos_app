import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';

class PaymentTabs extends ConsumerWidget {
  final double total;

  const PaymentTabs({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider(total));
    final notifier = ref.read(paymentProvider(total).notifier);

    return Row(
      children: [
        _tab("Total", 0, state, notifier),
        _tab("Split", 1, state, notifier),
        _tab("Items", 2, state, notifier),
      ],
    );
  }

  Widget _tab(String label, int index, state, notifier) {
    final selected = state.selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => notifier.selectTab(index),
        child: Container(
          color: selected ? Colors.blue : Colors.grey,
          padding: const EdgeInsets.all(12),
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}