import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_dialog_widgets.dart';

class CounterField extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;
  final int stepValue;

  const CounterField({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 99,
    this.stepValue = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: optionBorder,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _button(
            Icons.remove,
            value > min
                ? () => onChanged(value - stepValue)
                : null,
          ),
          SizedBox(
            width: 35,
            child: Center(
              child: Text(
                '$value',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          _button(
            Icons.add,
            value < max
                ? () => onChanged(value + stepValue)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _button(
    IconData icon,
    VoidCallback? onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 34,
        height: 38,
        child: Icon(
          icon,
          size: 17,
          color: onPressed == null
              ? Colors.grey.shade300
              : optionText,
        ),
      ),
    );
  }
}
