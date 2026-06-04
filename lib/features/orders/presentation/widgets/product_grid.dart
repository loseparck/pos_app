import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
//import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/presentation/widgets/product_option_dialog.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

import 'product_card.dart';

final currentGroupProvider =
    StateProvider<String?>((ref) => null);

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  static const selectedCategory = null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchQuery = ref.watch(productSearchQueryProvider);
    final orderNotifier = ref.read(ordersProvider.notifier);
    final planNotifier = ref.read(planProvider.notifier);
    final state = ref.watch(productsProvider);
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
              if (p.options != null && p.options!.isNotEmpty) {
                return ProductCard(
                  isGroup: false,
                  name: p.name,
                  price: p.price,
                  image: p.image,
                  description: p.description,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => ProductOptionDialog(
                        product: p,
                        onSelected: (selectedOptions) {
                          orderNotifier.addProduct(p, selectedOptions);
                          planNotifier.changeTableState(TableStatus.draft);
                        },
                      ),
                    );
                  },
                ); 
                // afficher le dialog pour choisir les options
                
              } else {
                return ProductCard(
                  isGroup: false,
                  name: p.name,
                  price: p.price,
                  image: p.image,
                  description: p.description,
                  onTap: () {
                    orderNotifier.addProduct(p, {});
                    planNotifier.changeTableState(TableStatus.draft);
                  },
                ); 
              }
            },
          );
        },
      );
    }

    /// 📦 MODE NORMAL
    return Column(
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {

                      final items = <Widget>[];

                      // Bouton retour
                      if (state.selectedCategory != null) {
                        items.add(
                          ProductCard(
                            isGroup: true,
                            icon: Icons.arrow_back,
                            name: "Retour",
                            onTap: () {
                              ref
                                  .read(productsProvider.notifier)
                                  .changeSeletedCategory(
                                    state.selectedCategory?.parentId,
                                  );
                            },
                          ),
                        );
                      }

                      // Catégories
                      final categories = state.categories
                          .where((c) => c.parentId == state.selectedCategoryId);

                      for (final c in categories) {
                        items.add(
                          ProductCard(
                            isGroup: true,
                            name: c.name,
                            onTap: () {
                              ref
                                  .read(productsProvider.notifier)
                                  .changeSeletedCategory(c.id);
                            },
                          ),
                        );
                      }

                      // Produits
                      final products = state.products
                          .where((p) => p.category?.id == state.selectedCategoryId);

                      for (final p in products) {
                        items.add(
                          ProductCard(
                            isGroup: false,
                            name: p.name,
                            price: p.price,
                            image: p.image,
                            description: p.description,
                            onTap: () {
                              if (p.options != null && p.options!.isNotEmpty) {

                                showDialog(
                                  context: context,
                                  builder: (_) => ProductOptionDialog(
                                    product: p,
                                    onSelected: (selectedOptions) {
                                      orderNotifier.addProduct(
                                        p, selectedOptions,
                                      );

                                      planNotifier.changeTableState(
                                        TableStatus.draft,
                                      );
                                    },
                                  ),
                                );

                              } else {

                                orderNotifier.addProduct(p, {});

                                planNotifier.changeTableState(
                                  TableStatus.draft,
                                );
                              }
                            },
                          ),
                        );
                      }

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: 1,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return items[index];
                        },
                      );
                    },
                  ),
                ),
                /// GRID
                /*Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1,
                    ),
                    itemCount: 3,
                    
                    itemBuilder: (context, index) {

                      if(selectedCategory != null){
                        if(index == 0){
                          return ProductCard(
                            isGroup: true,
                            icon: Icons.arrow_back,
                            name: "Retour",
                            onTap: () {
                              ref
                                  .read(productsProvider.notifier).changeSeletedCategory(state.selectedCategory?.parentId);
                                  
                            },
                          );
                        }
                        index = index - 1;
                      }

                      state.categories.where((c) => c.parentId == state.selectedCategoryId).map((c)
                      {
                        return ProductCard(
                          isGroup: true,
                          name: c.name,
                          onTap: () {
                            ref
                                  .read(productsProvider.notifier).changeSeletedCategory(c.id);
                          },
                        );
                      });

                      state.products.where((p) => p.category?.id == state.selectedCategoryId).map((p)
                      {
                        return ProductCard(
                          isGroup: false,
                          name: p.name,
                          price: p.price,
                          image: p.image,
                          description: p.description,
                          onTap: () {
                            if (p.options != null && p.options!.isNotEmpty) {
                              // afficher le dialog pour choisir les options
                              showDialog(
                                context: context,
                                builder: (_) => ProductOptionDialog(
                                  product: p,
                                  onSelected: (selectedOptions) {
                                    orderNotifier.addProduct(p, options: selectedOptions);
                                    planNotifier.changeTableState(TableStatus.draft);
                                  },
                                ),
                              );
                            } else {
                              // ajout direct
                              orderNotifier.addProduct(p);
                              planNotifier.changeTableState(TableStatus.draft);
                            }
                          }
                        );
                      });
                    },
                  ),
                ),*/
              ],
            );
    
    
    /*groupsAsync.when(
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
                          if (p.options != null && p.options!.isNotEmpty) {
                            // afficher le dialog pour choisir les options
                            showDialog(
                              context: context,
                              builder: (_) => ProductOptionDialog(
                                product: p,
                                onSelected: (selectedOptions) {
                                  orderNotifier.addProduct(p, options: selectedOptions);
                                  planNotifier.changeTableState(TableStatus.draft);
                                },
                              ),
                            );
                          } else {
                            // ajout direct
                            orderNotifier.addProduct(p);
                            planNotifier.changeTableState(TableStatus.draft);
                          }
                        }
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );*/
  }
}