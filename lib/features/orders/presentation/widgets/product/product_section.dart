import 'package:flutter/material.dart';
import 'package:pos_app/features/orders/presentation/widgets/order/order_item_actions.dart';
import 'package:pos_app/features/orders/presentation/widgets/product/product_search_bar.dart';

import '../common/pos_card.dart';
import 'category_tabs.dart';
import 'product_grid.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PosCard(
      child: Column(
        children: [
          ProductSearchBar(),

          SizedBox(height: 16),

          CategoryTabs(),

          SizedBox(height: 16),

          Expanded(
            child: ProductGrid(),
          ),
          
          Spacer(),

          OrderItemActions(),
        ],
      ),
    );
  }
}