import 'package:flutter/material.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';

import 'option_item_card.dart';

class OptionItemGrid extends StatelessWidget {
  final Option option;

  const OptionItemGrid({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = _calculateColumns(
          width,
        );
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: option.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            final item = option.items[index];

            return OptionItemCard(
              option: option,
              item: item,
            );
          },
        );
      },
    );
  }

  int _calculateColumns(
    double width,
  ) {
    const minCardWidth = 130.0;
    final columns = width ~/ minCardWidth;

    if (columns < 2) {
      return 2;
    }

    if (columns > 6) {
      return 6;
    }

    return columns;
  }
}
