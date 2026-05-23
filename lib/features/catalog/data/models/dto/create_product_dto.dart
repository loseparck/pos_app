class CreateProductDto {
  final String id;
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
  final DateTime? createdAt;
  final String? createdById;

  const CreateProductDto({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.categoryId,
    this.isActive = true,
    this.options,
    this.codeBarres,
    this.sku,
    this.vat = 0,
    this.stockQuantity = 0,
    this.color,
    this.createdAt,
    this.createdById
  });

  factory CreateProductDto.fromJson(Map<String, dynamic> json) {
    return CreateProductDto(
      id: json['id'].toString(),
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
      createdAt: DateTime.tryParse(json['createdAt'].toString()),
      createdById: json['createdById']?.toString(), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById
    };
  }
}