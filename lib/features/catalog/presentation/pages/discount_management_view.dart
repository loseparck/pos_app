import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_view.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/product_view.dart';

class DiscountManagementView extends StatefulWidget {
  const DiscountManagementView({
    super.key,
  });

  @override
  State<DiscountManagementView> createState() =>
      _DiscountManagementViewState();
}

class _DiscountManagementViewState
    extends State<DiscountManagementView> {

   int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),
        body: SafeArea(
          child: Column(
            children: [
              _buildTopNavigation(),
              Expanded(
                child: IndexedStack(
                    index: _step,
                    children: [
                      ProductView(),
                      OptionView(),
                    ],
                  ),
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8E7F0),
          ),
        ),
      ),
      child: Row(
        children: [
          _TopTab(
            icon: Icons.inventory_2_outlined,
            label: 'Produits',
            selected: _step == 0,
            onTap: () async {
              setState(() {
                _step = 0;
              });
            },
          ),

          const SizedBox(width: 4),

          _TopTab(
            icon: Icons.tune_rounded,
            label: 'Options',
            selected:  _step == 1,
            onTap: () async {
              setState(() {
                _step = 1;
              });
            },
          ),
/*
          const SizedBox(width: 4),

          const _TopTab(
            icon: Icons.percent_rounded,
            label: 'Réductions',
          ),*/
        ],
      ),
    );
  }
}

class _TopTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const _TopTab({
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFFF2EDFF)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: selected
                ? Border.all(
                    color: const Color(0xFFE4D8FF),
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 19,
                color: selected
                    ? const Color(0xFF6D28D9)
                    : const Color(0xFF475569),
              ),
              const SizedBox(width: 9),
              Text(
                label,
                style: TextStyle(
                  fontWeight:
                      selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected
                      ? const Color(0xFF5B21B6)
                      : const Color(0xFF334155),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

