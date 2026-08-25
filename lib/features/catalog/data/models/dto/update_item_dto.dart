class UpdateItemDto {
  final String? name;
  final String? description;
  final String? sku;
  final double? additionalPrice;
  final double? taxRate;
  final String? image;
  final String? color;
  final bool? active;
  final bool? inStock;
  final int? displayOrder;
  final int? icon;
  final String? optionId;
  final DateTime? updatedAt;

  UpdateItemDto({
    this.name,
    this.description,
    this.sku,
    this.additionalPrice,
    this.taxRate,
    this.image,
    this.color,
    this.active,
    this.inStock,
    this.displayOrder,
    this.icon,
    this.optionId,
    this.updatedAt,
  });

  // --- FROM JSON ---
  factory UpdateItemDto.fromJson(Map<String, dynamic> json) {
    return UpdateItemDto(
      name: json['name'],
      description: json['description'],
      sku: json['sku'],
      additionalPrice: (json['additionalPrice'] as num?)?.toDouble(),
      taxRate: (json['taxRate'] as num?)?.toDouble(),
      image: json['image'],
      color: json['color'],
      active: json['active'],
      inStock: json['inStock'],
      displayOrder: json['displayOrder'],
      icon: json['icon'],
      optionId: json['optionId'],
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : DateTime.now(),
    );
  }

  // --- TO JSON (Ignore les valeurs nulles) ---
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (sku != null) data['sku'] = sku;
    if (additionalPrice != null) data['additionalPrice'] = additionalPrice;
    if (taxRate != null) data['taxRate'] = taxRate;
    if (image != null) data['image'] = image;
    if (color != null) data['color'] = color;
    if (active != null) data['active'] = active;
    if (inStock != null) data['inStock'] = inStock;
    if (displayOrder != null) data['displayOrder'] = displayOrder;
    if (icon != null) data['icon'] = icon;
    if (optionId != null) data['optionId'] = optionId;
    if (updatedAt != null) data['updatedAt'] = updatedAt;
    return data;
  }
}