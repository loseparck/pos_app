import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/dialog_action.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/category_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/category_expansion_tile.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/confirmation_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/product_dialog.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {

  String? selectedCategoryId;
  String searchQuery = "";
  int searchType = 0;

  int currentPage = 0;
  int rowsPerPage = 5;

  List<Product> _applySearch(List<Product> list) {
    return list.where((p) {
      if (searchQuery.isEmpty) return true;

      switch (searchType) {
        case 0:
          return p.name.toLowerCase().contains(searchQuery.toLowerCase());
        case 1:
          return p.price.toString().contains(searchQuery);
        case 2:
          return p.codeBarres != null ? p.codeBarres!.contains(searchQuery) : false;
        default:
          return true;
      }
    }).toList();
  }

  List<Product> _paginate(List<Product> products) {
    final start = currentPage * rowsPerPage;
    final end = start + rowsPerPage;

    if (start >= products.length) return [];

    return products.sublist(
      start,
      end > products.length ? products.length : end,
    );
  }

  void openProductDialog(Product p) {
    showDialog(
      context: context,
      builder: (_) => ProductDialog(product: p),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(productsProvider.notifier);
    final state = ref.watch(productsProvider);
    final products = state.products;

    final filtered = _applySearch(
      selectedCategoryId == null
          ? products
          : products.where((p) => p.category?.id == selectedCategoryId).toList(),
    );

    final paginated = _paginate(filtered);

    final categories = state.categories;

    final categoriesByParentId = <String?, List<Category>>{};

    for (final c in categories) {
      final parentId = c.parent?.id;
      categoriesByParentId.putIfAbsent(parentId, () => []).add(c);
    }
    return Column(
      
      children: [
        const SizedBox(height: 10),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          children: [
            _action("Categorie", onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => CategoryDialog(parentId: selectedCategoryId,));
            }, color: Colors.green.shade400, icon: Icons.add_circle_outline_rounded),
            _action("Categorie", onPressed: selectedCategoryId != null ? () {
                showDialog(
                  context: context,
                  builder: (_) => CategoryDialog(categoryId: selectedCategoryId));
            } : null, color: Colors.orange.shade200, icon: Icons.mode_edit_outline_outlined),
            _action("Categorie", onPressed: selectedCategoryId != null ? () {
                showDialog(
                  context: context,
                  builder: (_) => ConfirmationDialog(body: "Action à faire pour les sous Categories les Produits lié à cette Category ?",
                    actions: [
                      DialogAction(
                        label: "Supprimer Tout",
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade200),
                        onPressed: () async {
                          final categoryId = selectedCategoryId;
                          if (categoryId == null) return;
                          try {
                            await notifier.removeCategoryWithChildren(categoryId);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          } catch (e) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Erreur lors de la suppression")),
                            );
                          }
                        },
                      ),
                      DialogAction(
                        label: "Les déplacer vers la Categorie Parent",
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade200 ),
                        onPressed: () async {
                          final categoryId = selectedCategoryId;
                          if (categoryId == null) return;
                          try {
                            await notifier.removeCategory(categoryId);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          } catch (e) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Erreur lors de la suppression")),
                            );
                          }
                        },
                      ),
                       DialogAction(
                        label: "Annuler",
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],));
            } : null, color: Colors.red.shade300, icon: Icons.delete_forever),
            _action("Produit", onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => ProductDialog(categoryId: selectedCategoryId,));
            }, color: Colors.green.shade400, icon: Icons.add_circle_outline_rounded),
            _action("Imprimer"),
            _action("PDF"),
            _action("Importer"),
            _action("Exporter"),
            _action("Aide"),
          ],
        ),

        const SizedBox(height: 10),

        /// 🔽 MAIN
        Expanded(
          child: Row(
            children: [

              /// 🌳 TREE
              Container(
                alignment: Alignment.topLeft,
                width: 250,
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey.shade300)),
                ),
                child: SingleChildScrollView(
                  child: _buildTreeRoot(categoriesByParentId),
                ),
              ),

              /// 📄 DROITE
              Expanded(
                child: Column(
                  children: [

                    /// 🔍 RECHERCHE
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [

                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Recherche...",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                  currentPage = 0;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 8),

                          _searchTypeButton("Nom", 0),
                          _searchTypeButton("Prix", 1),
                          _searchTypeButton("Code", 2),
                        ],
                      ),
                    ),

                    /// 📊 TABLE
                    Expanded(
                      child: Column(
                        children: [

                          /// TABLE
                          Expanded(
                            child: SingleChildScrollView(
                              child: 
                              SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text("Nom")),
                                    DataColumn(label: Text("Sku")),
                                    DataColumn(label: Text("Code barre")),
                                    DataColumn(label: Text("Prix")),
                                    DataColumn(label: Text("Qte en Stock")),
                                    DataColumn(label: Text("Actif")),
                                    DataColumn(label: Text("")),
                                  ],
                                  rows: paginated.map((p) {
                                    return DataRow(cells: [
                                      DataCell(Text(p.name), onTap: () => openProductDialog(p)),
                                      DataCell(Text(p.sku ?? ''), onTap: () => openProductDialog(p)),
                                      DataCell(Text(p.codeBarres ?? ''), onTap: () => openProductDialog(p)),
                                      DataCell(Text("${p.price} €"), onTap: () => openProductDialog(p)),
                                      DataCell(Text("${p.stockQuantity ?? 0}"), onTap: () => openProductDialog(p)),
                                      DataCell(
                                        Switch(
                                            value: p.isActive,
                                            onChanged: (val) async {
                                              try {
                                                await notifier.updateProduct(p.copyWith(isActive: val));
                                              } catch (e) {
                                                if (!context.mounted) return;
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text("Erreur lors de la mise à jour"))
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      DataCell(
                                        IconButton(
                                          color: Colors.red.shade300,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => ConfirmationDialog(
                                                body: "Veillez confirmez la suppression du Produit '${p.name}'",
                                                actions: [
                                                  DialogAction(
                                                    label: "Supprimer",
                                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade200),
                                                    onPressed: () async {
                                                      try {
                                                        await notifier.removeProduct(p.id);
                                                        if (!context.mounted) return;
                                                        Navigator.pop(context);
                                                      } catch (e) {
                                                        if (!context.mounted) return;
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          const SnackBar(content: Text("Erreur lors de la suppression")),
                                                        );
                                                      }
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.delete_forever_outlined),
                                        ),
                                      ),
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),

                          /// 📄 PAGINATION
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              IconButton(
                                icon: const Icon(Icons.chevron_left),
                                onPressed: currentPage > 0
                                    ? () {
                                        setState(() {
                                          currentPage--;
                                        });
                                      }
                                    : null,
                              ),

                              Text("Page ${currentPage + 1}"),

                              IconButton(
                                icon: const Icon(Icons.chevron_right),
                                onPressed:
                                    (currentPage + 1) * rowsPerPage < filtered.length
                                        ? () {
                                            setState(() {
                                              currentPage++;
                                            });
                                          }
                                        : null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _action(String label, {VoidCallback? onPressed, IconData? icon, Color? color}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 2,
        children: [
          if(icon != null) Icon(icon, color:  Colors.grey.shade800),
          Text(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey.shade800), label),
        ],
      )
    );
  }

  Widget _searchTypeButton(String label, int index) {
    final selected = searchType == index;

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          setState(() {
            searchType = index;
            currentPage = 0;
          });
        },
      ),
    );
  }

  Widget _buildTreeRoot(Map<String?, List<Category>> categoriesByParentId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🌟 ROOT
        ListTile(
          title: const Text(
            "Produits",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          selected: selectedCategoryId == null,
          onTap: () {
            if(selectedCategoryId != null){
              setState(() {
                selectedCategoryId = null;
                currentPage = 0;
              });
            }
          },
        ),

        /// 🌳 GROUPES
        _buildTree(null, 0, categoriesByParentId),
      ],
    );
  }

  Widget _buildTree(
  String? parentId,
  int level,
  Map<String?, List<Category>> categoriesByParentId,
) {
  final children = categoriesByParentId[parentId] ?? [];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children.map((g) {
      final hasChildren = (categoriesByParentId[g.id] ?? []).isNotEmpty;
      final isSelected = selectedCategoryId == g.id;

      if (!hasChildren) {
        return Padding(
          padding: EdgeInsets.only(left: level * 3),
          child: ListTile(
            selectedTileColor: Colors.blueGrey.shade500,
            selectedColor: Colors.black,
            title: Text(g.name),
            selected: isSelected,
            onTap: () {
              if (!isSelected) {
                setState(() {
                  selectedCategoryId = g.id;
                  currentPage = 0;
                });
              }
            },
          ),
        );
      }

      return CategoryExpansionTile(
        name: g.name,
        isSelected: isSelected,
        level: level,
        onSelect: () {
          setState(() {
            selectedCategoryId = g.id;
            currentPage = 0;
          });
        },
        children: [
          _buildTree(g.id, level + 1, categoriesByParentId),
        ],
      );
    }).toList(),
  );
}
}