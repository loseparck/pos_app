import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/payment_provider.dart';

class InputLine extends ConsumerWidget {
  final String label;
  final String fieldKey;

  const InputLine({
    super.key,
    required this.label,
    required this.fieldKey
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider);
    final notifier = ref.read(paymentProvider.notifier);

    return GestureDetector(
      onTap: () {
         ref.read(paymentProvider.notifier).setActiveField(fieldKey);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: TextField(
          readOnly: notifier.isPaymentFieldReadOnly(fieldKey),
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: state.activeField == fieldKey ? Colors.blue : Colors.grey,
                width: 2,
              ),
            ),
          ),
          controller: state.fieldValues[fieldKey],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          onTap: () {
            ref.read(paymentProvider.notifier).setActiveField(fieldKey);
          },
        ),
      ),
    );
  }
}