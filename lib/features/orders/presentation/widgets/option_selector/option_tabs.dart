import 'package:flutter/material.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';

import 'option_tab.dart';

class OptionTabs extends StatelessWidget {
  final List<Option> options;
  final int currentIndex;
  final ValueChanged<int> onSelected;

  const OptionTabs({
    super.key,
    required this.options,
    required this.currentIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return OptionTab(
            option: options[index],
            selected: currentIndex == index,
            onTap: () => onSelected(index),
          );
        },
      ),
    );
  }
}