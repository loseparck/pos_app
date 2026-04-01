import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';

class PaymentKeypad extends ConsumerWidget {
  final double total;

  const PaymentKeypad({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(paymentProvider(total).notifier);

    final keys = [
      "1","2","3",
      "4","5","6",
      "7","8","9",
      ".","0","⌫",
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: keys.length,
      gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
      ),
      itemBuilder: (_, i) {
        final key = keys[i];

        return ElevatedButton(
          onPressed: () => notifier.appendKey(key),
          child: Text(key),
        );
      },
    );
  }
}