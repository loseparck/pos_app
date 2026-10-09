import 'package:flutter/material.dart';

extension MoneyExtension on double {
  String get money => "${toStringAsFixed(2)} DH";
  
}

extension IntExtension on int {
  String get quantityLabel => "x$this";

  String get label => toString();

   String get articles => "$this article${this > 1 ? 's' : ''}";
}

int fromStringtoCents(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 0;
  }

  final normalized = value
      .trim()
      .replaceAll(' ', '')
      .replaceAll(',', '.');

  final amount = double.tryParse(normalized);

  if (amount == null) {
    return 0;
  }

  return (amount * 100).round();
}

int fromDoubletoCents(double? amount) {
  if (amount == null ) {
    return 0;
  }

  return (amount * 100).round();
}

int fromControllerToCents(
  TextEditingController controller,
) {
  return fromStringtoCents(controller.text);
}

String fromCentstoString(int? cents) {
  if (cents == null) {
    return '0';
  }

  return (cents / 100).toStringAsFixed(2);
}

/// Met directement un montant en euros dans un TextEditingController.
///
/// Exemple:
/// centsToController(1250, controller)
/// controller.text == "12.50"
void fromCentsToController(
  int? cents,
  TextEditingController controller,
) {
  controller.text = fromCentstoString(cents);
}

double fromCentsToDouble(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 0.0;
  }

  final normalized = value
      .trim()
      .replaceAll(' ', '')
      .replaceAll(',', '.');

  return double.tryParse(normalized) ?? 0.0;
}

double fromCentsAsIntToDouble(int? cents) {
  if (cents == null) {
    return 0.0;
  }

  return (cents / 100);
}