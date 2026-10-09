import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

extension ProductImageExtension on Product {

  String? get imagePath {
    return image;
  }

  bool get hasImage {
    return imagePath != null &&
           imagePath!.isNotEmpty;
  }

}

class Product {
  final String id;
  final String name;
  final String? sku;
  final String? description;
  final String? barcode;

  final Category? category;
  final Supplier? supplier;

  final int salePrice;
  final int purchasePrice;
  final int costPrice;
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

  final List<Option>? options;

  final String? createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  

  Product({
    this.id = '',
    required this.name,
    this.sku,
    this.description,
    this.barcode,
    this.category,
    this.supplier,
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
    this.unit = 'Piece',
    this.image,
    this.color,
    this.options = const [],
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    
  });

  Product copyWith({
    String? id,
    String? name,
    String? sku,
    String? description,
    String? barcode,
    Category? category,
    Supplier? supplier,
    int? salePrice,
    int? purchasePrice,
    int? costPrice,
    double? taxRate,
    bool? isActive,
    bool? stockEnabled,
    bool? weighted,
    bool? service,
    bool? favorite,
    bool? allowNegativeStock,
    double? stockQuantity,
    double? stockMin,
    double? stockMax,
    double? reorderPoint,
    String? unit,
    String? image,
    int? color, 
    List<Option>? options,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool? resetCategory,
    bool resetImage = false,
    bool resetColor = false,
    bool? resetSupplier,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      description: description ?? this.description,
      barcode: barcode ?? this.barcode,
      salePrice: salePrice ?? this.salePrice,
      taxRate: taxRate ?? this.taxRate,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      image: image ?? this.image,
      color: resetColor ? null : color ?? this.color,
      isActive: isActive ?? this.isActive,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      options: options ?? this.options,
      category: resetCategory == true ? null : category ?? this.category,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      costPrice: costPrice ?? this.costPrice,
      stockEnabled: stockEnabled ?? this.stockEnabled,
      weighted: weighted ?? this.weighted,
      service: service ?? this.service,
      favorite: favorite ?? this.favorite,
      stockMin: stockMin ?? this.stockMin,
      stockMax: stockMax ?? this.stockMax,
      allowNegativeStock: allowNegativeStock ?? this.allowNegativeStock,
      reorderPoint: reorderPoint ?? this.reorderPoint,
      unit: unit ?? this.unit,
      supplier: resetSupplier == true ? null : supplier ?? this.supplier,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      sku: json['sku'],
      description: json['description'],
      barcode: json['barcode'],
      category: json['category'] != null ? Category.fromJson(json['category'] as Map<String, dynamic>) : null,
      supplier: json['supplier'] != null ? Supplier.fromJson(json['supplier'] as Map<String, dynamic>) : null,
      salePrice: (json['salePrice'] as num?)?.toInt() ?? 0,
      purchasePrice: (json['purchasePrice'] as num?)?.toInt() ?? 0,
      costPrice: (json['costPrice'] as num?)?.toInt() ?? 0,
      taxRate: (json['taxRate'] as num?)?.toDouble() ?? 20,
      isActive: json['isActive'] ?? true,
      stockEnabled: json['stockEnabled'] ?? true,
      weighted: json['weighted'] ?? false,
      service: json['service'] ?? false,
      favorite: json['favorite'] ?? false,
      allowNegativeStock: json['allowNegativeStock'] ?? false,
      stockQuantity: (json['stockQuantity'] as num?)?.toDouble() ?? 0,
      stockMin: (json['stockMin'] as num?)?.toDouble() ?? 0,
      stockMax: (json['stockMax'] as num?)?.toDouble() ?? 0,
      reorderPoint: (json['reorderPoint'] as num?)?.toDouble() ?? 0,
      unit: json['unit'] ?? 'Pièce',
      image: json['image'],
      color: json['color'] as int?,
      options: json['options'] != null
          ? (json['options'] as List).map((x) => Option.fromJson(x)).toList()
          : [],
      createdById: json['createdById'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sku': sku,
      'description': description,
      'barcode': barcode,
      'category': category?.toJson(),
      'supplier': supplier?.toJson(),
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
      'options': options?.map((x) => x.toJson()).toList(),
      'createdById': createdById,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}