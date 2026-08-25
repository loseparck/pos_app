import 'package:flutter/material.dart';

class CustomInputDecoration {

  static InputDecoration dropDownDecoration({
    required String label,
    String? hint,
    IconData? icon,
    String? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: icon == null
          ? null
          : Icon(
              icon,
              size: 18,
            ),
      suffixText: suffix,
      filled: true,
      fillColor: const Color(0xFFFCFBFD),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 13,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: const BorderSide(
          color: Color(0xFFE1DCE5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: const BorderSide(
          color: Color(0xFFE1DCE5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: const BorderSide(
          color: Color(0xFF6841C6),
          width: 1.4,
        ),
      ),
    );
  }
}