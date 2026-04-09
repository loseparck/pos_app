import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';

class PaymentKeypad extends ConsumerWidget {

  const PaymentKeypad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider);
    final notifier = ref.read(paymentProvider.notifier);
    final keys = [
      "1","2","3",
      "4","5","6",
      "7","8","9",
      ".","0","⌫",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (_, index) {
        final key = keys[index];
        final activeField = ref.watch(paymentProvider).activeField;
        return ElevatedButton(
          onPressed: () {
            if (activeField.isEmpty) return;
            if(!notifier.isPaymentFieldReadOnly(activeField)){
             final current = state.fieldValues[activeField];
              if (current == null) return;
              if (key == "." && current.text.contains(".")) return;
                if (key == "⌫") {
                  if (current.text.isNotEmpty) {
                    ref.read(paymentProvider.notifier).updateField(activeField,  current.text.substring(0, current.text.length - 1));
                  }
                } else {
                   ref.read(paymentProvider.notifier).updateField(activeField, current.text + key);
                }
            }
          },
          child: Text(key),
        );
      },
    );
  }
}