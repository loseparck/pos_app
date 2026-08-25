import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';

class ColorWidget extends StatefulWidget {
  final Color? selectedColor;
  final String title;
  final Function(Color?) onpressed;

  const ColorWidget({
    super.key,
    required this.title,
    this.selectedColor,
    required this.onpressed
  });

  @override
  State<ColorWidget> createState() =>
      _ColorWidgetState();
}

class _ColorWidgetState
    extends State<ColorWidget> {

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: widget.title,
      icon: Icons.palette_outlined,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _colorItem(null),
          ...const [
            Color(0xFFEF4444),
            Color(0xFFF97316),
            Color(0xFFF59E0B),
            Color(0xFF22C55E),
            Color(0xFF14B8A6),
            Color(0xFF0EA5E9),
            Color(0xFF3B82F6),
            Color(0xFF6366F1),
            Color(0xFF8B5CF6),
            Color(0xFFEC4899),
            Color(0xFF64748B),
            Color(0xFF334155),
          ].map(_colorItem),
        ],
      ),
    );
  }

  Widget _colorItem(Color? color) {
    final selected = color == null
        ? widget.selectedColor == null
        : widget.selectedColor?.value == color.value;

    return InkWell(
      onTap: () {
        widget.onpressed(color);
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 34,
        height: 34,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected
                ? const Color(
                    0xFF6841C6,
                  )
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? Colors.white,
            border: Border.all(
              color: color == null ? Colors.grey.shade400 : Colors.transparent,
            ),
          ),
          child: selected
              ? Icon(
                  color == null ? Icons.block : Icons.check,
                  size: 15,
                  color: color == null ? Colors.grey : Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}