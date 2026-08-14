import 'package:flutter/material.dart';

class PosCard extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final double elevation;

  final Color? color;

  final BorderRadius? borderRadius;

  const PosCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation = 1,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? EdgeInsets.zero,
      elevation: elevation,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ??
            BorderRadius.circular(18),
      ),
      child: Padding(
        padding:
            padding ??
            const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}