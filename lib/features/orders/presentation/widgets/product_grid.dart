import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';

import '../../../catalog/application/providers/group_provider.dart';
import '../../../catalog/application/providers/product_provider.dart';

import 'product_card.dart';

final currentGroupProvider =
    StateProvider<String?>((ref) => null);

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchQuery = ref.watch(productSearchQueryProvider);
    final groupId = ref.watch(currentGroupProvider);

    /// 🔎 MODE RECHERCHE
    if (searchQuery.isNotEmpty) {

      final searchAsync =
          ref.watch(productSearchProvider(searchQuery));

      return searchAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text(e.toString())),

        data: (products) {

          return GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {

              final p = products[index];

              return ProductCard(
                isGroup: false,
                name: p.name,
                price: p.price,
                image: p.image,
                description: p.description,
                onTap: () {
                  ref
                      .read(ordersProvider.notifier)
                      .addProduct(p);
                },
              );
            },
          );
        },
      );
    }

    /// 📦 MODE NORMAL

    final groupsAsync =
        ref.watch(productGroupsProvider(groupId));

    final productsAsync =
        ref.watch(productProvider(groupId));

    return groupsAsync.when(
      loading: () =>
          const Center(child: CircularProgressIndicator()),

      error: (e, _) => Center(child: Text(e.toString())),

      data: (groups) {

        return productsAsync.when(
          loading: () =>
              const Center(child: CircularProgressIndicator()),

          error: (e, _) => Center(child: Text(e.toString())),

          data: (products) {

            final int totalItems;
                //groups.length + products.length;
            if (groupId != null) {
              totalItems = groups.length + products.length + 1;
            } else {
              totalItems = groups.length + products.length;
            }
            return Column(
              children: [
                /// GRID
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1,
                    ),
                    itemCount: totalItems,
                    itemBuilder: (context, index) {

                      if(groupId != null){
                        if(index == 0){
                          return ProductCard(
                            isGroup: true,
                            icon: Icons.arrow_back,
                            name: "Retour",
                            onTap: () {
                              final parent = ref.read(
                                groupParentProvider(groupId),
                              );

                              ref
                                  .read(currentGroupProvider.notifier)
                                  .state = parent;
                            },
                          );
                        }
                        index = index - 1;
                      }

                      if (index < groups.length) {

                        final g = groups[index];

                        return ProductCard(
                          isGroup: true,
                          name: g.name,
                          onTap: () {
                            ref
                                .read(currentGroupProvider.notifier)
                                .state = g.id;
                          },
                        );
                      }

                      final productIndex = index - groups.length;
                      final p = products[productIndex];

                      return ProductCard(
                        isGroup: false,
                        name: p.name,
                        price: p.price,
                        image: p.image,
                        description: p.description,
                        onTap: () {
                          ref
                              .read(ordersProvider.notifier)
                              .addProduct(p);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}