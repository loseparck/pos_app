import 'package:flutter/material.dart';

class CounterField extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;
  final double width;

  const CounterField({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.width = 120,
  });

  void _decrement() {
    if (value > min) {
      onChanged(value - 1);
    }
  }

  void _increment() {
    if (value < max) {
      onChanged(value + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Row(
        children: [
          _button(
            icon: Icons.remove,
            onPressed:
                value > min ? _decrement : null,
          ),
          Expanded(
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ),
          _button(
            icon: Icons.add,
            onPressed:
                value < max ? _increment : null,
          ),
        ],
      ),
    );
  }

  Widget _button({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 36,
      height: 40,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        iconSize: 17,
        splashRadius: 18,
        icon: Icon(
          icon,
          color: onPressed == null
              ? const Color(0xFFCBD5E1)
              : const Color(0xFF64748B),
        ),
      ),
    );
  }
}