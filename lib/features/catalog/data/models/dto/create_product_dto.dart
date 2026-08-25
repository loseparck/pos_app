class CreateProductDto {
  final String id;
  final String name;
  final String? sku;
  final String? description;
  final String? barcode;

  final String? categoryId;

  final double salePrice;
  final double purchasePrice;
  final double costPrice;
  final double taxRate;

  final bool isActive;
  final bool stockEnabled;
  final bool weighted;
  final bool service;
  final bool favorite;
  final bool allowNegativeStock;

  final double stockQuantity;
  final double stockMin;
  final double stockMax;
  final double reorderPoint;

  final String unit;

  final String? image;
  final int? color;

  final List<String>? options;

  final String? createdById;
  final DateTime? createdAt;

  const CreateProductDto({
    this.id = '',
    required this.name,
    this.sku,
    this.description,
    this.barcode,
    this.categoryId,
    this.salePrice = 0,
    this.purchasePrice = 0,
    this.costPrice = 0,
    this.taxRate = 20,
    this.isActive = true,
    this.stockEnabled = true,
    this.weighted = false,
    this.service = false,
    this.favorite = false,
    this.allowNegativeStock = true,
    this.stockQuantity = 0,
    this.stockMin = 0,
    this.stockMax = 0,
    this.reorderPoint = 0,
    this.unit = 'Pièce',
    this.image,
    this.color,
    this.options = const [],
    this.createdById,
    this.createdAt,
  });

  factory CreateProductDto.fromJson(Map<String, dynamic> json) {
    return CreateProductDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      sku: json['sku'],
      description: json['description'],
      barcode: json['barcode'],
      categoryId: json['categoryId']?.toString(),
      salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0,
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble() ?? 0,
      costPrice: (json['costPrice'] as num?)?.toDouble() ?? 0,
      taxRate: (json['taxRate'] as num?)?.toDouble() ?? 20,
      isActive: json['isActive'] ?? true,
      stockEnabled: json['stockEnabled'] ?? true,
      weighted: json['weighted'] ?? false,
      service: json['service'] ?? false,
      favorite: json['favorite'] ?? false,
      allowNegativeStock: json['allowNegativeStock'] ?? true,
      stockQuantity: (json['stockQuantity'] as num?)?.toDouble() ?? 0,
      stockMin: (json['stockMin'] as num?)?.toDouble() ?? 0,
      stockMax: (json['stockMax'] as num?)?.toDouble() ?? 0,
      reorderPoint: (json['reorderPoint'] as num?)?.toDouble() ?? 0,
      unit: json['unit'] ?? 'Pièce',
      image: json['image'],
      color: json['color'] as int?,
      options: json['options'] != null
          ? (json['options'] as List).map((x) => x as String).toList()
          : [],
      createdById: json['createdById'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sku': sku,
      'description': description,
      'barcode': barcode,
      'categoryId': categoryId,
      'salePrice': salePrice,
      'purchasePrice': purchasePrice,
      'costPrice': costPrice,
      'taxRate': taxRate,
      'isActive': isActive,
      'stockEnabled': stockEnabled,
      'weighted': weighted,
      'service': service,
      'favorite': favorite,
      'allowNegativeStock': allowNegativeStock,
      'stockQuantity': stockQuantity,
      'stockMin': stockMin,
      'stockMax': stockMax,
      'reorderPoint': reorderPoint,
      'unit': unit,
      'image': image,
      'color': color,
      'options': options,
      'createdById': createdById,
      'createdAt': createdAt?.toIso8601String()
    };
  }
}