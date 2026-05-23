import 'package:flutter/material.dart';

class DialogAction {
  final String label;
  final Future<void> Function()? onPressed;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final bool isOutlined;

  const DialogAction({
    required this.label,
    this.onPressed,
    this.style,
    this.textStyle,
    this.isOutlined = false,
  });
}