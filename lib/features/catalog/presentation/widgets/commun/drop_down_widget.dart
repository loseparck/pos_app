import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_input_decoration.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String label;
  final T? value;
  final String? hint;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const DropDownWidget({
    super.key, 
    required this.label,
    required this.value,
    this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue : value,
      isExpanded: true,
      decoration: CustomInputDecoration.dropDownDecoration(
        label: label,
      ),
      hint: hint == null ? null : Text(hint!),
      items: items,
      onChanged: onChanged,
    );
  }
}