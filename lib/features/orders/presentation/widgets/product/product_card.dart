import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/theme/app_spacing.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/presentation/dialogs/show_option_selector_dialog.dart';
import 'package:pos_app/features/orders/presentation/widgets/product/product_name.dart';
import 'package:pos_app/features/orders/presentation/widgets/product/show_product_note_dialog.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

import '../common/pos_card.dart';
import 'product_image.dart';
import 'product_price.dart';

class ProductCard extends ConsumerWidget {
  final Product product;
  final VoidCallback? onLongPress;

  const ProductCard({
    super.key,
    required this.product,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PosCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () async {
          final List<OrderItemOption> options;
          if (product.options == null || product.options!.isEmpty) {
            options = [];
          } else {
            options = await showOptionSelectorDialog(
              context: context,
              ref: ref,
              product: product,
            ) ?? [];
          }

          final note = await showProductNoteDialog(context);
          ref.read(ordersProvider.notifier).addItem(product, options, note: note);
          ref.read(planProvider.notifier).changeTableState(TableStatus.occuped);
        },
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ProductImage(
                product: product,
              ),
            ),
            Padding(
              padding: AppSpacing.card,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductName(
                    product: product,
                  ),
                  const SizedBox(height: 6),
                  ProductPrice(
                    price: product.salePrice,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
