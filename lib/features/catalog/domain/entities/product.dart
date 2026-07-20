import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

class Product {
  final String id;
  final String name;
  final String? sku;
  final String? description;
  final String? codeBarres;
  final double price;
  final double vat;
  final double? stockQuantity;
  final String? image;
  final int? color;
  final bool isActive;
  final String? createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final List<Option>? options;
  final Category? category;
  

  Product({
    required this.name,
    required this.price,
    this.id = "",
    this.image,
    this.description,
    this.codeBarres,
    this.sku,
    this.isActive = true,
    this.options,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
    this.vat = 0,
    this.stockQuantity = 0,
    this.color,
    this.category,
  });

  Product copyWith({
    String? id,
    String? name,
    String? sku,
    String? description,
    String? codeBarres,
    double? price,
    double? vat,
    double? stockQuantity,
    String? image,
    int? color,
    bool? isActive,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    List<Option>? options,
    Category? category
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      description: description ?? this.description,
      codeBarres: codeBarres ?? this.codeBarres,
      price: price ?? this.price,
      vat: vat ?? this.vat,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      image: image ?? this.image,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      options: options ?? this.options,
      category: category ?? this.category,
    );
  }

  Product copyCategory({
    Category? category
  }) {
    return Product(
      id: id,
      name: name,
      sku: sku,
      description: description,
      codeBarres: codeBarres,
      price: price,
      vat: vat,
      stockQuantity: stockQuantity,
      image: image,
      color: color,
      isActive: isActive,
      createdById: createdById,
      createdAt: createdAt ,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      options: options,
      category: category,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String?,
      description: json['description'] as String?,
      codeBarres: json['codeBarres'] as String?,
      price: double.tryParse(json['price'].toString()) ?? 0,
      vat: double.tryParse(json['vat'].toString()) ?? 0,
      stockQuantity: double.tryParse(json['stockQuantity'].toString()) ?? 0,
      color: int.tryParse(json['color'] as String? ?? ''),
      image: json['image'] as String?,
      isActive: (json['isActive'] as bool),
      category: json['category'] != null ? Category.fromJson(json['category'] as Map<String, dynamic>) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'] as String?,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      options: json['options'] != null ? (json['options'] as List<dynamic>).map((e) => Option.fromJson(e)).toList() : [],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'sku': sku,
      'description': description,
      'codeBarres': codeBarres,
      'price': price,
      'vat': vat,
      'stockQuantity': stockQuantity,
      'image': image,
      'color': color,
      'isActive': isActive,
      'category': category?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
      'options': options?.map((e) => e.toJson()).toList(),
    };
  }
}