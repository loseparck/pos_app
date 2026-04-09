import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Line extends ConsumerWidget {
  final String label;
  final String text;
  final Color? bkgroundColor;

  const Line({
    super.key,
    required this.label,
    required this.text,
    this.bkgroundColor
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
          style: TextStyle(fontWeight: FontWeight.bold),),
          Text(
            text, style: 
            TextStyle(
              fontWeight: FontWeight.bold, 
              backgroundColor: bkgroundColor ?? Colors.transparent)
            ),
        ],
      ),
    );
  }
}