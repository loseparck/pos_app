import 'package:flutter/material.dart';

const Color optionPurple = Color(0xFF7352D6);
const Color optionPurpleLight = Color(0xFFF1EDFF);

const Color optionGreen = Color(0xFF16B968);
const Color optionGreenLight = Color(0xFFEAFBF2);

const Color optionText = Color(0xFF202124);
const Color optionSecondaryText = Color(0xFF6B6875);
const Color optionBorder = Color(0xFFE3E0E8);
const Color optionBackground = Color(0xFFF8F7FA);

class OptionDialogHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onClose;

  const OptionDialogHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: .11),//.withOpacity(.11),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: color,
            size: 25,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: optionText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: optionSecondaryText,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close_rounded),
          color: optionText,
          tooltip: 'Fermer',
        ),
      ],
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final Widget trailing;

  const SettingsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.trailing,
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
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(.09),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: accentColor,
              size: 18,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: optionSecondaryText,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class CounterField extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const CounterField({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 99,
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
                ? () => onChanged(value - 1)
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
                ? () => onChanged(value + 1)
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

class DialogFooter extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final String submitText;
  final Color submitColor;
  final IconData submitIcon;

  const DialogFooter({
    super.key,
    required this.onCancel,
    required this.onSubmit,
    required this.submitText,
    required this.submitColor,
    this.submitIcon = Icons.check_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: onCancel,
          style: OutlinedButton.styleFrom(
            foregroundColor: optionText,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(
              color: optionBorder,
            ),
          ),
          child: const Text('Annuler'),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: onSubmit,
          icon: Icon(submitIcon, size: 18),
          label: Text(submitText),
          style: ElevatedButton.styleFrom(
            backgroundColor: submitColor,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 23,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}