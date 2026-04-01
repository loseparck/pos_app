import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  final double total;
  final double given;

  const PaymentSummary({
    super.key,
    required this.total,
    required this.given,
  });

  @override
  Widget build(BuildContext context) {
    final change = given - total;

    return Column(
      children: [
        _line("Total", total),
        _line("Montant donné", given),
        _line(
          "Monnaie",
          change,
          color: change < 0 ? Colors.red : Colors.green,
        ),
      ],
    );
  }

  Widget _line(String label, double value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}