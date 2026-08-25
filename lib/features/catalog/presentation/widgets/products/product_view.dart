import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/dialog_action.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/empty_state.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/header_text.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/category_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/category_tree_view.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/confirmation_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/product_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/product_row.dart';

class ProductView extends ConsumerStatefulWidget{

  const ProductView({
    super.key,
  });

  @override
  ConsumerState<ProductView> createState() =>
      _ProductViewState();
}

class _ProductViewState
    extends ConsumerState<ProductView> with WidgetsBindingObserver{

  String? _selectedCategoryId;
  bool _isKeyboardVisible = false;
  String _search = '';
  String _sortBy = 'Nom';
  bool _ascending = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsProvider);
    final List<Category> categories = state.categories;
    final filtredProducts = _filteredAndSortedProducts;
    
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CategoryTreeView(
            categories: categories,
            selectedCategoryId: _selectedCategoryId,
            onCategorySelected: (category) {
              setState(() {
                _selectedCategoryId =
                    category.id == '__all__'
                        ? null
                        : category.id;
              });
            },
            onAddCategory: () {
              _addCategory();
            },
            onEditCategory: (category) {
              _editCategory(category);
            },
            onDeleteCategory: (category) {
              _deleteCategory(category);
            },
          ),
        ),

        Expanded(
          flex: 5, 
          child: _buildProductsArea(filtredProducts),
        ),
      ],
    );
  }

  List<Product> get _filteredAndSortedProducts {
    Iterable<Product> result = ref.read(productsProvider).products;

    if (_selectedCategoryId != null) {
      final categoryIds = _getCategoryAndDescendants(
        _selectedCategoryId!,
      );

      result = result.where(
        (product) =>
            product.category != null &&
            categoryIds.contains(product.category!.id),
      );
    }

    if (_search.isNotEmpty) {
      final query = _search.toLowerCase();

      result = result.where(
        (product) {
          return product.name
                  .toLowerCase()
                  .contains(query) ||
            (product.sku != null && product.sku!
                .toLowerCase()
                .contains(_search.toLowerCase())) ||
            (product.barcode != null && product.barcode!.contains(_search));
        },
      );
    }

    final products = result.toList();

    products.sort(
      (a, b) {
        int comparison;

        switch (_sortBy) {
          case 'Prix':
            comparison = a.salePrice.compareTo(b.salePrice);
            break;

          case 'Code':
            comparison = (a.barcode ?? "").compareTo(
              b.barcode ?? "",
            );
            break;

          case 'Stock':
            comparison = (a.stockQuantity).compareTo(b.stockQuantity);
            break;

          case 'Nom':
          default:
            comparison = a.name
                .toLowerCase()
                .compareTo(
                  b.name.toLowerCase(),
                );
        }

        return _ascending
            ? comparison
            : -comparison;
      },
    );

    return products;
  }

  Set<String> _getCategoryAndDescendants(
    String categoryId,
  ) {
    final ids = <String>{
      categoryId,
    };

    bool added;

    do {
      added = false;

      for (final category in  ref.watch(productsProvider).categories) {
        if (category.parentId != null &&
            ids.contains(category.parentId) &&
            !ids.contains(category.id)) {
          ids.add(category.id);
          added = true;
        }
      }
    } while (added);

    return ids;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = View.of(context).viewInsets.bottom;
    final newValue = bottomInset > 0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  Widget _buildProductsArea(
    List<Product> products,
  ) {
    final productNotifier = ref.read(productsProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _buildProductsToolbar(),

          const SizedBox(height: 14),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE7E5EF),
                ),
              ),
              child: Column(
                children: [
                  _buildSearchAndSort(),

                  const Divider(
                    height: 1,
                    color: Color(0xFFEAEAF0),
                  ),

                  _buildTableHeader(),

                  const Divider(
                    height: 1,
                    color: Color(0xFFEAEAF0),
                  ),

                  Expanded(
                    child: products.isEmpty
                        ? EmptyState(title: 'Aucun produit', subTitle: 'Aucun produit ne correspond à votre recherche.')
                        : ListView.separated(
                            itemCount: products.length,
                            separatorBuilder: (_, __) =>
                                const Divider(
                              height: 1,
                              color: Color(0xFFF0F0F4),
                            ),
                            itemBuilder: (_, index) {
                              final product =
                                  products[index];

                              return ProductRow(
                                product: product,
                                onEdit:  () {_editProduct(product);},
                                onDelete: () {_confirmDeleteItem(product);},
                                onToggle:  (value) {productNotifier.updateProduct( product.copyWith(isActive: value));},
                              );
                            },
                          ),
                  ),
                  if(!_isKeyboardVisible)
                    _buildPagination(products.length),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsToolbar() {
    return Row(
      children: [
        ActionButton(
          icon: Icons.add_box_outlined,
          label: 'Nouveau Produit',
          primary: true,
          onPressed: _addProduct,
        ),

        const Spacer(),

        ActionButton(
          icon: Icons.print_outlined,
          label: 'Imprimer',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.picture_as_pdf_outlined,
          label: 'PDF',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.download_outlined,
          label: 'Importer',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.upload_outlined,
          label: 'Exporter',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchAndSort() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _search = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText:
                    'Rechercher un produit, SKU ou code-barres...',
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF94A3B8),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 20,
                  color: Color(0xFF64748B),
                ),
                suffixIcon: _search.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _search = '';
                          });
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                        ),
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFFF8F8FC),
                contentPadding:
                    const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color(0xFF8B5CF6),
                    width: 1.3,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          const Text(
            'Trier par',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(width: 8),

          Container(
            height: 46,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _sortBy,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Nom',
                    child: Text('Nom'),
                  ),
                  DropdownMenuItem(
                    value: 'Prix',
                    child: Text('Prix'),
                  ),
                  DropdownMenuItem(
                    value: 'Code',
                    child: Text('Code'),
                  ),
                  DropdownMenuItem(
                    value: 'Stock',
                    child: Text('Stock'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _sortBy = value;
                  });
                },
              ),
            ),
          ),

          const SizedBox(width: 8),

          Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              tooltip: _ascending
                  ? 'Croissant'
                  : 'Décroissant',
              onPressed: () {
                setState(() {
                  _ascending = !_ascending;
                });
              },
              icon: Icon(
                _ascending
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 18,
                color: const Color(0xFF5B21B6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      child: Row(
        children: [

          const Expanded(
            flex: 4,
            child: HeaderText(
              'Produit',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'SKU',
            ),
          ),

          const Expanded(
            flex: 3,
            child: HeaderText(
              'Code barre',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Prix',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Qté en stock',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Statut',
            ),
          ),

          const SizedBox(
            width: 60,
            child: HeaderText(
              'Actions',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination(int count) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Text(
            'Affichage de 1 à $count sur $count produits',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_left_rounded,
            ),
          ),

          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF5B21B6),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right_rounded,
            ),
          ),

          const SizedBox(width: 12),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Row(
              children: [
                Text(
                  '10 / page',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 17,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addCategory() async {
    final category = await CategoryDialog.show(
      context: context,
      categories: ref.read(productsProvider).categories,
      parentId: _selectedCategoryId
    );
    if(category != null){
      ref.read(productsProvider.notifier).addCategory(category);
    }  
  }

  void _editCategory(
    Category category,
  ) async {
    final updatedCategory = await CategoryDialog.show(
      context: context,
      category: category,
      categories: ref.read(productsProvider).categories,
    );
    if(updatedCategory != null){
      ref.read(productsProvider.notifier).updateCategory(updatedCategory);
    }
  }

  void _deleteCategory(
    Category category,
  ) {
    final notifier = ref.read(productsProvider.notifier);
    showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(body: "Action à faire pour les sous Categories les Produits lié à cette Category ?",
        actions: [
          DialogAction(
            label: "Supprimer Tout",
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade200),
            onPressed: () async {
              final categoryId = _selectedCategoryId;
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
              final categoryId = _selectedCategoryId;
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
        ],)
      );
  }
  
  void _addProduct() async {
    final Product? product = await ProductEditorDialog.show(
      context: context,
      product: null,
      categories: ref.read(productsProvider).categories,
      options:  ref.read(productsProvider).options,
      parentCategory: _selectedCategoryId != null ? ref.read(productsProvider).getCategoryById(_selectedCategoryId!): null
    );

    if(product != null){
      ref.read(productsProvider.notifier).addProduct(product);
    }
  }

  void _editProduct(Product product) async {
    final Product? result = await ProductEditorDialog.show(
      context: context,
      product: product,
      categories: ref.read(productsProvider).categories,
      options:  ref.read(productsProvider).options,
      parentCategory: _selectedCategoryId != null ? ref.read(productsProvider).getCategoryById(_selectedCategoryId!): null
    );
    if(result != null){
      ref.read(productsProvider.notifier).updateProduct(result);
    }
  }

  Future<void> _confirmDeleteItem(
    Product product,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Supression d'un produit!",
          ),
          content: Text(
            "le produit ${product.name} sera supprimé.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Annuler'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      ref.read(productsProvider.notifier).removeProduct(product.id);
    }
  }
}