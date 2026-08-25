import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/data/mappers/category_tree.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';

class CategoryTreeView extends StatefulWidget {
  final List<Category> categories;
  final String? selectedCategoryId;

  final ValueChanged<Category>? onCategorySelected;
  final VoidCallback? onAddCategory;

  final ValueChanged<Category>? onEditCategory;
  final ValueChanged<Category>? onDeleteCategory;

  const CategoryTreeView({
    super.key,
    required this.categories,
    this.selectedCategoryId,
    this.onCategorySelected,
    this.onAddCategory,
    this.onEditCategory,
    this.onDeleteCategory,
  });

  @override
  State<CategoryTreeView> createState() => _CategoryTreeViewState();
}

class _CategoryTreeViewState extends State<CategoryTreeView> {
  final Set<String> _expandedIds = {};

  String _search = '';

  @override
  Widget build(BuildContext context) {
    final tree = CategoryTree.build(widget.categories);

    final filteredTree = _searchTree(
      tree,
      _search,
    );

    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Color(0xFFE8E7F0),
          ),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildSearch(),
          const SizedBox(height: 8),
          Expanded(
            child: _buildTree(filteredTree),
          ),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(22, 22, 22, 12),
      child: Row(
        children: [
          Icon(
            Icons.folder_outlined,
            size: 20,
            color: Color(0xFF4F46E5),
          ),
          SizedBox(width: 10),
          Text(
            'Catégories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _search = value.trim().toLowerCase();
          });
        },
        decoration: InputDecoration(
          hintText: 'Rechercher...',
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 13,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 19,
            color: Color(0xFF94A3B8),
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7EB),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7EB),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF8B5CF6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTree(List<CategoryTreeNode> nodes) {
    if (nodes.isEmpty) {
      return const Center(
        child: Text(
          'Aucune catégorie',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13,
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      children: [
        _buildAllCategoriesItem(),

        const SizedBox(height: 6),

        ...nodes.map(
          (node) => _buildNode(
            node,
            depth: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildAllCategoriesItem() {
    final selected = widget.selectedCategoryId == null;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        widget.onCategorySelected?.call(
          const Category(
            id: '__all__',
            name: 'Toutes les catégories',
          ),
        );
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFF3EEFF)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              Icons.folder_open_outlined,
              size: 19,
              color: selected
                  ? const Color(0xFF6D28D9)
                  : const Color(0xFF475569),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                'Toutes les catégories',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: selected
                      ? const Color(0xFF6D28D9)
                      : const Color(0xFF334155),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNode(
    CategoryTreeNode node, {
    required int depth,
  }) {
    final category = node.category;

    final hasChildren = node.children.isNotEmpty;

    final expanded = _expandedIds.contains(
      category.id,
    );

    final selected =
        widget.selectedCategoryId == category.id;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: depth * 22.0,
          ),
          child: _CategoryTreeItem(
            category: category,
            hasChildren: hasChildren,
            expanded: expanded,
            selected: selected,

            onExpand: hasChildren
                ? () {
                    setState(() {
                      if (expanded) {
                        _expandedIds.remove(
                          category.id,
                        );
                      } else {
                        _expandedIds.add(
                          category.id,
                        );
                      }
                    });
                  }
                : null,

            onTap: () {
              widget.onCategorySelected?.call(
                category,
              );
            },

            onLongPress: () {
              _showCategoryActions(
                category,
              );
            },
          ),
        ),

        if (hasChildren && expanded)
          ...node.children.map(
            (child) => _buildNode(
              child,
              depth: depth + 1,
            ),
          ),
      ],
    );
  }

  Future<void> _showCategoryActions(
    Category category,
  ) async {
    final action = await showDialog<_CategoryAction>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 380,
            ),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3EEFF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.folder_outlined,
                      color: Color(0xFF6D28D9),
                      size: 26,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Que souhaitez-vous faire ?',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _CategoryActionButton(
                    icon: Icons.edit_outlined,
                    label: 'Modifier la catégorie',
                    color: const Color(0xFF6D28D9),
                    background: const Color(0xFFF5F3FF),
                    onTap: () {
                      Navigator.pop(
                        context,
                        _CategoryAction.edit,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  _CategoryActionButton(
                    icon: Icons.delete_outline_rounded,
                    label: 'Supprimer la catégorie',
                    color: const Color(0xFFDC2626),
                    background: const Color(0xFFFFF1F2),
                    onTap: () {
                      Navigator.pop(
                        context,
                        _CategoryAction.delete,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Annuler',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (!mounted || action == null) {
      return;
    }

    switch (action) {
      case _CategoryAction.edit:
        widget.onEditCategory?.call(category);
        break;

      case _CategoryAction.delete:
        await _confirmDelete(category);
        break;
    }
  }

  Future<void> _confirmDelete(
    Category category,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Supprimer la catégorie ?',
          ),
          content: Text(
            'La catégorie "${category.name}" sera supprimée.',
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
      widget.onDeleteCategory?.call(
        category,
      );
    }
  }

  List<CategoryTreeNode> _searchTree(
    List<CategoryTreeNode> nodes,
    String search,
  ) {
    if (search.isEmpty) {
      return nodes;
    }

    final result = <CategoryTreeNode>[];

    for (final node in nodes) {
      final nameMatches = node.category.name
          .toLowerCase()
          .contains(search);

      final children = _searchTree(
        node.children,
        search,
      );

      if (nameMatches || children.isNotEmpty) {
        result.add(
          CategoryTreeNode(
            category: node.category,
            children: children,
          ),
        );

        if (children.isNotEmpty) {
          _expandedIds.add(
            node.category.id,
          );
        }
      }
    }

    return result;
  }

  Widget _buildAddButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        18,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: OutlinedButton.icon(
          onPressed: widget.onAddCategory,
          icon: const Icon(
            Icons.add_rounded,
            size: 20,
          ),
          label: const Text(
            'Nouvelle catégorie',
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF5B21B6),
            side: const BorderSide(
              color: Color(0xFF8B5CF6),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryTreeItem extends StatelessWidget {
  final Category category;

  final bool hasChildren;
  final bool expanded;
  final bool selected;

  final VoidCallback? onExpand;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const _CategoryTreeItem({
    required this.category,
    required this.hasChildren,
    required this.expanded,
    required this.selected,
    this.onExpand,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFF4F0FF)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: hasChildren
                  ? IconButton(
                      onPressed: onExpand,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        expanded
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_right_rounded,
                        size: 19,
                        color: const Color(0xFF64748B),
                      ),
                    )
                  : null,
            ),

            Expanded(
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(9),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        hasChildren
                            ? Icons.folder_outlined
                            : Icons.folder_open_outlined,
                        size: 18,
                        color: selected
                            ? const Color(0xFF6D28D9)
                            : const Color(0xFF475569),
                      ),

                      const SizedBox(width: 9),

                      Expanded(
                        child: Text(
                          category.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: selected
                                ? const Color(0xFF5B21B6)
                                : const Color(0xFF334155),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _CategoryAction {
  edit,
  delete,
}

class _CategoryActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color background;
  final VoidCallback onTap;

  const _CategoryActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}