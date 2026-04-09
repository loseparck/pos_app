import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';

class PaymentTabs extends ConsumerWidget {
  final String label;
  final int index;
  
  const PaymentTabs({
    super.key,
    required this.label,
    required this.index
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(paymentProvider).selectedTab;
    final notifier =  ref.read(paymentProvider.notifier);
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: notifier.checkIfEnableTitle(index) ? () => notifier.selectTab(index) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}