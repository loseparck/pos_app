import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_input_decoration.dart';

class CustomTextField extends StatelessWidget {
    final TextEditingController controller;
    final String label;
    final String? hint;
    final bool required;
    final IconData? icon;
    final int maxLines;

  const CustomTextField({
    super.key, 
    required this.controller,
    required this.label,
    this.hint,
    this.required = false,
    this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
   return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: CustomInputDecoration.dropDownDecoration(
        label: label,
        hint: hint,
        icon: icon,
      ),
      validator: required
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return '$label est obligatoire';
              }

              return null;
            }
          : null,
    );
  }
}