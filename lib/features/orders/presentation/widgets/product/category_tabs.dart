import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';

import '../common/pos_chip.dart';
import 'category_chip.dart';

class CategoryTabs extends ConsumerWidget {
  const CategoryTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productsProvider).categories;

    final selectedCategoryId = ref.watch(
      posProvider.select(
        (state) => state.selectedCategoryId,
      ),
    );

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 8),
        itemBuilder: (_, index) {
          if (index == 0) {
            return PosChip(
              label: "Toutes",
              icon: Icons.apps,
              selected: selectedCategoryId == null,
              onTap: () {
                ref
                    .read(posProvider.notifier)
                    .selectCategory(null);
              },
            );
          }

          final Category category = categories[index - 1];

          return CategoryChip(
            category: category,
            selected: selectedCategoryId == category.id,
            onTap: () {
              ref
                  .read(posProvider.notifier)
                  .selectCategory(category.id);
            },
          );
        },
      ),
    );
  }
}