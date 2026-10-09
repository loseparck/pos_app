import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? icon;
  final bool required;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? suffixText;
  final bool enabled;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.icon,
    this.required = false,
    this.maxLines = 1,
    this.keyboardType,
    this.prefixText,
    this.suffixText,
    this.enabled = true,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF7C3AED);
    const border = Color(0xFFE7E5EF);
    const textColor = Color(0xFF1E293B);
    const hintColor = Color(0xFF94A3B8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
            children: required
                ? const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 7),
        TextFormField(
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          style: const TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: hintColor,
              fontSize: 14,
            ),
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    size: 19,
                    color: const Color(0xFF94A3B8),
                  )
                : null,
            prefixText: prefixText,
            suffixText: suffixText,
            filled: true,
            fillColor: enabled
                ? Colors.white
                : const Color(0xFFF8FAFC),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: border,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}