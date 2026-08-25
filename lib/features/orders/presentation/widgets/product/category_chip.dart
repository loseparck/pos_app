import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';

import '../common/pos_chip.dart';

class CategoryChip extends StatelessWidget {
  final Category category;

  final bool selected;

  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PosChip(
      label: category.name,
      icon: Icons.drafts,//category.icon,
      selected: selected,
      selectedColor:  category.color != null ? Color(int.parse(category.color ?? '')) : null,
      onTap: onTap,
    );
  }
}