import 'package:flutter/material.dart';

import 'responsive_grid_delegate.dart';

class ResponsiveGrid extends StatelessWidget {
  final int itemCount;

  final IndexedWidgetBuilder itemBuilder;

  final double minItemWidth;

  final double? maxItemWidth;

  final double childAspectRatio;

  final double spacing;

  final EdgeInsetsGeometry padding;

  final ScrollController? controller;

  final ScrollPhysics? physics;

  final bool primary;

  final bool shrinkWrap;

  const ResponsiveGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.minItemWidth = 180,
    this.maxItemWidth,
    this.childAspectRatio = .85,
    this.spacing = 16,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.physics,
    this.primary = false,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final delegate = ResponsiveGridDelegate(
          availableWidth: constraints.maxWidth,
          minItemWidth: minItemWidth,
          //maxItemWidth: maxItemWidth,
          spacing: spacing,
        );

        return GridView.builder(
          controller: controller,
          primary: primary,
          shrinkWrap: shrinkWrap,
          physics:
              physics ??
              const BouncingScrollPhysics(),
          padding: padding,
          itemCount: itemCount,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                delegate.crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}

class GridBreakpoints {
  static const product = (
    minWidth: 130.0,
    maxWidth: 180.0,
    spacing: 16.0,
    ratio: .82,
  );

  static const table = (
    minWidth: 150.0,
    maxWidth: 180.0,
    spacing: 16.0,
    ratio: 1.0,
  );

  static const employee = (
    minWidth: 260.0,
    maxWidth: 320.0,
    spacing: 20.0,
    ratio: .72,
  );
}