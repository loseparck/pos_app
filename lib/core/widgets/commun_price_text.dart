import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/double_extension.dart';

class CommunPriceText extends StatelessWidget {
  final num price;

  final TextStyle? style;

  final Color? color;

  final FontWeight? fontWeight;

  final double? fontSize;

  final TextAlign textAlign;

  const CommunPriceText({
    super.key,
    required this.price,
    this.style,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(
          color: color,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize,
        );

    return Text(
      price.currency,
      textAlign: textAlign,
      style: style ?? defaultStyle,
    );
  }
}