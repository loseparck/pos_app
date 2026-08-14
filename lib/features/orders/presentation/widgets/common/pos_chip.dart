import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/core/theme/app_radius.dart';

class PosChip extends StatelessWidget {
  final String label;

  final IconData? icon;

  final Widget? trailing;

  final bool selected;

  final VoidCallback? onTap;

  final Color? selectedColor;

  final Color? unselectedColor;

  const PosChip({
    super.key,
    required this.label,
    this.icon,
    this.trailing,
    this.selected = false,
    this.onTap,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final background =
        selected ? (selectedColor ?? AppColors.primary) : (unselectedColor ?? Colors.white);

    final foreground =
        selected ? Colors.white : AppColors.text;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.chip,
        border: Border.all(
          color: selected ? background : AppColors.border,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadius.chip,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 18,
                    color: foreground,
                  ),
                  const SizedBox(width: 6),
                ],

                Text(
                  label,
                  style: TextStyle(
                    color: foreground,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                if (trailing != null) ...[
                  const SizedBox(width: 8),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}