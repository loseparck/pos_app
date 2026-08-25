import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool primary;
  final bool danger;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key, 
    required this.icon,
    required this.label,
    this.onPressed,
    this.primary = false,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 16,
      ),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: danger
            ? const Color(0xFFDC2626)
            : primary
                ? const Color(0xFF6D28D9)
                : const Color(0xFF334155),
        backgroundColor: primary
            ? const Color(0xFFF3EEFF)
            : danger
                ? const Color(0xFFFFF7F7)
                : Colors.white,
        side: BorderSide(
          color: danger
              ? const Color(0xFFFECACA)
              : primary
                  ? const Color(0xFFE9DDFF)
                  : const Color(0xFFE2E8F0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 12,
        ),
      ),
    );
  }
}