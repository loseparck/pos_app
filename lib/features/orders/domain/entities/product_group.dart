class ProductGroup {
  final String id;
  final String name;
  final String? parentId;

  ProductGroup({
    required this.id,
    required this.name,
    this.parentId,
  });
}