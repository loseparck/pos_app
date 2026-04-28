class ProductGroup {

  final String id;
  final String name;
  final String? parentId;
  final bool isActive;

  const ProductGroup({
    required this.name,
    this.parentId,
    this.id = "",
    this.isActive = true,
  });

  ProductGroup copyWith({
    String? id,
    String? name,
    String? parentId,
    bool? isActive,
  }) {
    return ProductGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      isActive: isActive ?? this.isActive,
    );
  }
}