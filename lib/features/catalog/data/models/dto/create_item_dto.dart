class CreateItemDto {
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
  final String optionId;
  final DateTime? createdAt;
  final String? createdById;

  CreateItemDto({
    required this.id,
    required this.name,
    required this.optionId,
    this.description,
    this.sku,
    this.additionalPrice = 0.0,
    this.taxRate = 20.0,
    this.image,
    this.color = "0xFF7352D6",
    this.active = true,
    this.inStock = true,
    this.displayOrder = 1,
    this.icon,
    
    this.createdAt,
    this.createdById
  });

  // --- FROM JSON ---
  factory CreateItemDto.fromJson(Map<String, dynamic> json) {
    return CreateItemDto(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      sku: json['sku'] ?? '',
      additionalPrice: (json['additionalPrice'] as num?)?.toDouble() ?? 0.0,
      taxRate: (json['taxRate'] as num?)?.toDouble() ?? 20.0,
      image: json['image'],
      color: json['color'] ?? "0xFF7352D6",
      active: json['active'] ?? true,
      inStock: json['inStock'] ?? true,
      displayOrder: json['displayOrder'] ?? 1,
      icon: json['icon'],
      optionId: json['optionId'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      createdById: json['createdById']?.toString() ?? '',
    );
  }

  // --- TO JSON ---
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
      'optionId': optionId,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}