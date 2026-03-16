class Product {
  final String id;
  final String name;
  final String? sku;
  final double price;
  final String? image;
  final String? description;
  final String? groupId;
  final String? codeBarres;
  final bool status;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.image,
    this.description,
    this.groupId,
    this.codeBarres,
    this.sku,
    this.status = true,
  });
}