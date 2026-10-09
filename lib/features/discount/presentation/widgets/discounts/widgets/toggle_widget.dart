import 'package:flutter/material.dart';

class ToggleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final IconData? icon;
  final bool enabled;

  const ToggleWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
    this.activeColor =
        const Color(0xFF7C3AED),
    this.icon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: value
            ? activeColor.withValues(alpha: 0.045)
            : const Color(0xFFFAFAFC),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: value
              ? activeColor.withValues(alpha: 0.25)
              : const Color(0xFFE7E5EF),
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: activeColor.withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 18,
                color: activeColor,
              ),
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 1.3,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Switch.adaptive(
            value: value,
            onChanged:
                enabled ? onChanged : null,
            activeTrackColor: activeColor,
          ),
        ],
      ),
    );
  }
}