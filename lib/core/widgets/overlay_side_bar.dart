import 'package:flutter/material.dart';

class OverlaySideBar extends StatelessWidget {
  final GestureTapCallback? gestureOnTap;
  final VoidCallback? onClosePressed;
  final Widget item;
  final String headerTitle;
  final String headerSubTitle;
  final String footerTitle;
  final String footerSubTitle;
  final IconData headerIcon;
  final IconData footerIcon;
  final bool showHeader;
  final bool showFooter;

  const OverlaySideBar({
    super.key,
    required this.item,
    this.gestureOnTap,
    this.onClosePressed,
    this.headerTitle = 'Plus d’actions',
    this.headerSubTitle = 'Gestion et navigation',
    this.footerTitle = 'Mode restaurant',
    this.footerSubTitle = 'Plan de salle',
    this.headerIcon = Icons.more_horiz_rounded,
    this.footerIcon = Icons.restaurant_rounded,
    this.showFooter = true,
    this.showHeader = true
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: gestureOnTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              color: Colors.black.withValues(alpha: 0.18),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          top: 0,
          right: 0,
          bottom: 0,
          width: 320,
          child: Material(
            color: Colors.white,
            elevation: 20,
            shadowColor: Colors.black.withValues(alpha: .15),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      18,
                      14,
                      18,
                    ),
                    child: Row(
                      children: [
                        if(showHeader) ...[
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              headerIcon,
                              color: Color(0xFF0F172A),
                              size: 22,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  headerTitle,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  headerSubTitle,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          const Spacer()
                        ],

                        IconButton(
                          tooltip: 'Fermer',
                          onPressed: onClosePressed,
                          icon: const Icon(
                            Icons.close_rounded,
                            size: 20,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(
                    height: 1,
                    color: Color(0xFFE2E8F0),
                  ),
                  item,
                  if(showFooter)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8FAFC),
                        border: Border(
                          top: BorderSide(
                            color: Color(0xFFE2E8F0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE9FE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              footerIcon,
                              size: 18,
                              color: Color(0xFF6D28D9),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  footerTitle,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF334155),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  footerSubTitle,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ]
    );
  }
}