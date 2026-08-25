import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';


@JsonSerializable()
class Item {
  final String id;
  final String name;
  final String? description;
  final String? sku;
  final double additionalPrice;
  final double taxRate;
  final String? image;
  final String? color;
  final bool active;
  final bool inStock;
  final int displayOrder;
  final int? icon;
  final Option option;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;
  
  bool get isActive => active;
  
  Item({
    this.id = "",
    required this.name,
    this.description,
    this.sku,
    this.additionalPrice = 0,
    this.taxRate = 20,
    this.image,
    this.color = "0xFF7352D6",
    this.active = true,
    this.inStock = true,
    this.displayOrder = 1,
    this.icon,
    required this.option,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

   Item copyWith({
    String? id,
    String? name,
    String? description,
    String? sku,
    double? additionalPrice,
    double? taxRate,
    String? image,
    String? color,
    bool? active,
    bool? inStock,
    int? displayOrder,
    int? icon,
    Option? option,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdById
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sku: sku ?? this.sku,
      additionalPrice: additionalPrice ?? this.additionalPrice,
      taxRate: taxRate ?? this.taxRate,
      image: image ?? this.image,
      color: color ?? this.color,
      active: active ?? this.active,
      inStock: inStock ?? this.inStock,
      displayOrder: displayOrder ?? this.displayOrder,
      icon: icon ?? this.icon,
      option: option ?? this.option,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById ?? this.createdById
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      sku: json['sku'] ?? '',
      additionalPrice: (json['additionalPrice'] as num?)?.toDouble() ?? 0.0,
      taxRate: (json['taxRate'] as num?)?.toDouble() ?? 0.0,
      image: json['image'],
      color: json['color'],
      active: json['active'] ?? true,
      inStock: json['inStock'] ?? true,
      displayOrder: json['displayOrder'] ?? 0,
      icon: json['icon'],
      option: Option(id:json['optionId'] ?? '', name: '', items: []),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sku': sku,
      'additionalPrice': additionalPrice,
      'taxRate': taxRate,
      'image': image,
      'color': color,
      'active': active,
      'inStock': inStock,
      'displayOrder': displayOrder,
      'icon': icon,
      'option': option.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}