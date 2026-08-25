import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SidebarItem extends ConsumerWidget {
  final IconData icon;
  final String label;
  final VoidCallback? action;
  final bool active;


  const SidebarItem({super.key, required this.icon, required this.label, this.action, this.active = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: active ? const Color(0xFF633DE0) : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: action,
          child: SizedBox(
            height: 35,
            child: Row(
              children: [
                const SizedBox(width: 9),
                Icon(
                  icon,
                  size: 16,
                  color: active ? Colors.white : const Color(0xFF6F6A78),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight:
                          active ? FontWeight.w600 : FontWeight.w400,
                      color:
                          active ? Colors.white : const Color(0xFF302D36),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}