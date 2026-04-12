class ProductGroup {

  final String id;
  final String name;
  final String? parentId;

  const ProductGroup({
    required this.name,
    this.parentId,
    this.id = "",
  });

  ProductGroup copyWith({
    String? id,
    String? name,
    String? parentId,
  }) {
    return ProductGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
    );
  }
}