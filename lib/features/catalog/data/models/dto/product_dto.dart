import 'create_product_option_dto.dart';

class ProductDto {
  final String id;
  final String name;
  final String? sku;
  final double price;
  final String? description;
  final String? image;
  final String? groupId;
  final String? codeBarres;
  final bool isActive;
  final List<CreateProductOptionDto> options;

  const ProductDto({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.image,
    this.groupId,
    required this.isActive,
    required this.options,
    this.codeBarres,
    this.sku,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      description: json['description']?.toString(),
      image: json['image']?.toString(),
      groupId: json['groupId']?.toString(),
      isActive: json['isActive'] == true,
      options: (json['options'] as List<dynamic>? ?? [])
          .map((e) => CreateProductOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeBarres: json['codeBarres']?.toString(),
      sku: json['sku']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'groupId': groupId,
      'isActive': isActive,
      'options': options.map((e) => e.toJson()).toList(),
      'codeBarres': codeBarres,
      'sku': sku,
    };
  }
}