import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color accentColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.accentColor =
        const Color(0xFF7C3AED),
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFC),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: const Color(0xFFE7E5EF),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: accentColor.withValues(
                alpha: 0.10,
              ),
              borderRadius:
                  BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              size: 19,
              color: accentColor,
            ),
          ),
          const SizedBox(width: 11),
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
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 12),
            trailing!,
          ],
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(11),
      child: content,
    );
  }
}