import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String title;

  final String value;

  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: isTotal ? 20 : 15,
      fontWeight:
          isTotal ? FontWeight.bold : FontWeight.w500,
    );

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: style,
          ),
        ),
        Text(
          value,
          style: style,
        ),
      ],
    );
  }
}