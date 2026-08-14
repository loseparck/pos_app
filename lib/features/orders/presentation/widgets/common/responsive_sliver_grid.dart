import 'package:flutter/material.dart';

import 'responsive_grid_delegate.dart';

class ResponsiveSliverGrid extends StatelessWidget {
  final int itemCount;

  final IndexedWidgetBuilder itemBuilder;

  final double minItemWidth;

  final double? maxItemWidth;

  final double childAspectRatio;

  final double spacing;

  const ResponsiveSliverGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.minItemWidth = 180,
    this.maxItemWidth,
    this.childAspectRatio = .85,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (_, constraints) {
        final delegate = ResponsiveGridDelegate(
          availableWidth: constraints.crossAxisExtent,
          minItemWidth: minItemWidth,
          //maxItemWidth: maxItemWidth,
          spacing: spacing,
        );

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            itemBuilder,
            childCount: itemCount,
          ),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                //delegate.effectiveCrossAxisCount,
                delegate.crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
        );
      },
    );
  }
}