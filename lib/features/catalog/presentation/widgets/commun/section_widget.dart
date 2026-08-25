import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final String? subtitle;

  const SectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15,10,15,10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE6E1EA),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF0EAFE,
                  ),
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: const Color(
                    0xFF6841C6,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          child,
        ],
      ),
    );
  }
}