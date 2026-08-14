import 'dart:math';

import 'package:flutter/foundation.dart';

@immutable
class ResponsiveGridDelegate {
  final double availableWidth;

  final double minItemWidth;

  final double spacing;

  const ResponsiveGridDelegate({
    required this.availableWidth,
    required this.minItemWidth,
    this.spacing = 16,
  });

  /*int get crossAxisCount {
  
    final count = max(
      1,
      ((availableWidth + spacing) / (minItemWidth + spacing)).floor(),
    );
    
    return count;
  }
*/
int get crossAxisCount {

   return max(
      1,
      ((availableWidth + spacing) /
      (minItemWidth + spacing)).floor(),
   );

}
/*
  double get itemWidth {
    var columns = crossAxisCount;

    var width =
        (availableWidth - ((columns - 1) * spacing)) /
            columns;

    if (maxItemWidth == null) {
      return width;
    }

    while (columns > 1 && width > maxItemWidth!) {
      columns--;

      width =
          (availableWidth - ((columns - 1) * spacing)) /
              columns;
    }
  
    return width;
  }
*/

  double get itemWidth {

    return (availableWidth -
            ((crossAxisCount-1)*spacing))
            / crossAxisCount;

  }

  /*int get effectiveCrossAxisCountd {
    var columns = crossAxisCount;

    var width =
        (availableWidth - ((columns - 1) * spacing)) /
            columns;

    if (maxItemWidth == null) {
      return columns;
    }

    while (columns > 1 && width > maxItemWidth!) {
      columns--;

      width =
          (availableWidth - ((columns - 1) * spacing)) /
              columns;
    }

    return columns;
  }*/
}