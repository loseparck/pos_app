import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/responsive_grid.dart';

import 'empty_product_view.dart';
import 'product_card.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(filteredProductsProvider);
    
    if (products.isEmpty) {
      return const EmptyProductView();
    }

    return ResponsiveGrid(
      minItemWidth: GridBreakpoints.product.minWidth,
      maxItemWidth: GridBreakpoints.product.maxWidth,
      spacing: GridBreakpoints.product.spacing,
      childAspectRatio: GridBreakpoints.product.ratio,
      itemCount: products.length,
      itemBuilder: (_, i) => ProductCard(product: products[i]),
    );
  }
}