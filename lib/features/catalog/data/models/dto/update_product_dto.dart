class UpdateProductDto {
  final String name;
  final String? description;
  final String? sku;
  final double price;
  final double? vat;
  final double? stockQuantity;
  final int? color;
  final String? categoryId;
  final String? codeBarres;
  final bool isActive;
  final List<String>? options;
  final DateTime? updatedAt;

  const UpdateProductDto({
    required this.name,
    required this.price,
    this.description,
    this.categoryId,
    this.isActive = true,
    required this.options,
    this.codeBarres,
    this.sku,
    this.vat = 0,
    this.stockQuantity = 0,
    this.color,
    this.updatedAt
  });

  factory UpdateProductDto.fromJson(Map<String, dynamic> json) {
    return UpdateProductDto(
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      sku: json['sku']?.toString(),
      vat: double.tryParse(json['vat'].toString()) ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0,
      stockQuantity: double.tryParse(json['stockQuantity'].toString()) ?? 0,
      color: int.tryParse(json['color'].toString()) ?? 0,
      categoryId: json['categoryId']?.toString(),
      codeBarres: json['codeBarres']?.toString(),
      isActive: json['isActive'] == true,
      options: (json['options'] as List?)?.map((e) => e as String).toList(),
      updatedAt: DateTime.tryParse(json['updatedAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'categoryId': categoryId,
      'isActive': isActive,
      'options': options,
      'codeBarres': codeBarres,
      'sku': sku,
      'vat': vat,
      'stockQuantity': stockQuantity,
      'color': color,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}