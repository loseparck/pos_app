import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String value;

  final double fontSize;

  final FontWeight fontWeight;

  final Color? color;

  const PriceText({
    super.key,
    required this.value,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}