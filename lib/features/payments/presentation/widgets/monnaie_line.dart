import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/payments/presentation/widgets/line.dart';
import '../state/payment_provider.dart';

class MonnaieLine extends ConsumerWidget {
  final String fieldKey;
  final double total;

  const MonnaieLine({
    super.key,
    required this.fieldKey,
    this.total = 0
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(paymentProvider);
    
    final controller = state.fieldValues[fieldKey]!;
    
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final text = value.text;
        final given = double.tryParse(text) ?? 0;
        final monnaie = given - total;
        final color = monnaie < 0 ? Colors.red : null;
        return Line(label: "Monnaie", text: monnaie.toStringAsFixed(2), bkgroundColor: color);
      },
    );
  }
}