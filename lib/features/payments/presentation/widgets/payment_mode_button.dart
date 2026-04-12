import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';
import '../state/payment_provider.dart';

class PaymentModeButton extends ConsumerWidget {
  const PaymentModeButton({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(child: buildButton(ref, "Espèce", PaymentMode.cash)),
        const SizedBox(width: 8),
        Expanded(child: buildButton(ref, "Carte", PaymentMode.card)),
        const SizedBox(width: 8),
        Expanded(child: buildButton(ref, "Autre", PaymentMode.other)),
      ],
    ); 
  }

  Widget buildButton(WidgetRef ref, String label, PaymentMode mode){
    final state = ref.watch(paymentProvider);
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) =>
          state.mode == mode ? Colors.black : Colors.white
        ),
      ),
      onPressed: () {
        ref.read(paymentProvider.notifier).selectMode(mode);
      },
      child: Text(
        label,
        style: TextStyle(
          
          color: state.mode == mode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}