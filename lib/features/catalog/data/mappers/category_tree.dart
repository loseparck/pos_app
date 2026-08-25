import 'package:pos_app/features/catalog/domain/entities/category.dart';


class CategoryTreeNode {
  final Category category;
  final List<CategoryTreeNode> children;

  const CategoryTreeNode({
    required this.category,
    this.children = const [],
  });

  bool get hasChildren => children.isNotEmpty;
}

class CategoryTree {
  const CategoryTree._();

  static List<CategoryTreeNode> build(
    List<Category> categories,
  ) {
    final Map<String?, List<Category>> grouped = {};

    for (final category in categories) {
      grouped.putIfAbsent(category.parentId, () => []);
      grouped[category.parentId]!.add(category);
    }

    List<CategoryTreeNode> buildLevel(String? parentId) {
      final children = grouped[parentId] ?? [];

      return children.map((category) {
        return CategoryTreeNode(
          category: category,
          children: buildLevel(category.id),
        );
      }).toList();
    }

    return buildLevel(null);
  }
}