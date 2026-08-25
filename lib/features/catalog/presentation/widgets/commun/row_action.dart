import 'package:flutter/material.dart';

class RowAction extends StatelessWidget {
  final IconData icon;
  final bool danger;
  final VoidCallback onPressed;

  const RowAction({super.key, 
    required this.icon,
    required this.onPressed,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: danger
              ? const Color(0xFFFFF1F2)
              : const Color(0xFFF8F7FF),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: danger
                ? const Color(0xFFFECACA)
                : const Color(0xFFE9E5FF),
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: danger
              ? const Color(0xFFEF4444)
              : const Color(0xFF6D28D9),
        ),
      ),
    );
  }
}
