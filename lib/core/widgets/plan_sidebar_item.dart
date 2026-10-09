import 'package:flutter/material.dart';

class PlanSidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final Color iconColor;
  final Color textColor;

  const PlanSidebarItem({
    super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.iconColor = const Color(0xFF475569),
    this.textColor = const Color(0xFF1E293B),
  });

  @override
  State<PlanSidebarItem> createState() =>
      PlanSidebarItemState();
}

class PlanSidebarItemState
    extends State<PlanSidebarItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(
          bottom: 4,
        ),
        decoration: BoxDecoration(
          color: _hovered
              ? const Color(0xFFF8FAFC)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 11,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _hovered
                          ? const Color(0xFFEDE9FE)
                          : const Color(0xFFF1F5F9),
                      borderRadius:
                          BorderRadius.circular(11),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 19,
                      color: widget.iconColor,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.label,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: widget.textColor,
                          ),
                        ),

                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(
                            widget.subtitle!,
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  AnimatedOpacity(
                    duration:
                        const Duration(milliseconds: 150),
                    opacity: _hovered ? 1 : .5,
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      size: 19,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}