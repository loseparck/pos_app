import 'package:flutter/material.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_dialog_widgets.dart';

class TableShapeSelector extends StatelessWidget {
  final TableShape selectedShape;
  final ValueChanged<TableShape> onChanged;

  const TableShapeSelector({
    super.key,
    required this.selectedShape,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: optionPurple.withValues(alpha: .09),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(
                  Icons.crop_square_rounded,
                  color: optionPurple,
                  size: 19,
                ),
              ),
              const SizedBox(width: 11),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forme',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: optionText,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Choisissez la forme de cette table',
                    style: TextStyle(
                      fontSize: 10.5,
                      color: optionSecondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _ShapeButton(
                  shape: TableShape.square,
                  label: 'Carré',
                  icon: Icons.crop_square_rounded,
                  selected: selectedShape == TableShape.square,
                  onTap: () => onChanged(TableShape.square),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _ShapeButton(
                  shape: TableShape.circle,
                  label: 'Cercle',
                  icon: Icons.circle_outlined,
                  selected: selectedShape == TableShape.circle,
                  onTap: () => onChanged(TableShape.circle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShapeButton extends StatelessWidget {
  final TableShape shape;
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ShapeButton({
    required this.shape,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          //height: 68,
          decoration: BoxDecoration(
            color: selected
                ? optionPurpleLight
                : optionBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? optionPurple
                  : optionBorder,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 25,
                      color: selected
                          ? optionPurple
                          : optionSecondaryText,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: selected
                            ? optionPurple
                            : optionText,
                      ),
                    ),
                  ],
                ),
              ),

              if (selected)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: const BoxDecoration(
                      color: optionPurple,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 11,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}