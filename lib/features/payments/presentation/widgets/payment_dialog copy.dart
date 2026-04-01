import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';
import 'payment_tabs.dart';
import 'payment_keypad.dart';
import 'tab_total.dart';
import 'tab_split.dart';
import 'tab_items.dart';

class PaymentDialoga extends ConsumerWidget {
  final double total;

  const PaymentDialoga({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider(total));

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Paiement"),

          PaymentTabs(total: total),

          Row(
            children: [
              Expanded(child: _buildContent(state.selectedTab, total)),
              SizedBox(width: 220, child: PaymentKeypad(total: total)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int tab, double total) {
    switch (tab) {
      case 0:
        return TabTotal(total: total);
      case 1:
        return TabSplit(total: total);
      case 2:
        return TabItems(total: total);
      default:
        return const SizedBox();
    }
  }
}