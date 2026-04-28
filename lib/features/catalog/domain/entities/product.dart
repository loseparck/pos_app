import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

class Product {
  final String id;
  final String name;
  final String? sku;
  final double price;
  final String? image;
  final String? description;
  final String? groupId;
  final String? codeBarres;
  final bool isActive;
  final bool status;
  final List<ProductOption>? options;

  Product({
    required this.name,
    required this.price,
    this.id = "",
    this.image,
    this.description,
    this.groupId,
    this.codeBarres,
    this.sku,
    this.status = true,
    this.isActive = true,
    this.options,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? sku,
    String? image,
    String? description,
    String? groupId,
    String? codeBarres,
    bool? status,
    List<ProductOption>? options,
    bool? isActive,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      sku: sku ?? this.sku,
      image: image ?? this.image,
      description: description ?? this.description,
      groupId: groupId ?? this.groupId,
      codeBarres: codeBarres ?? this.codeBarres,
      status: status ?? this.status,
      options: options ?? this.options,
      isActive: isActive ?? this.isActive,
    );
  }
}