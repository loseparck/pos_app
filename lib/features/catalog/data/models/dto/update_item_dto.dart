class UpdateItemDto {
  final String name;
  final double price;
  final double vat;
  final bool isActive;
  final DateTime updatedAt;

  const UpdateItemDto({
    required this.updatedAt,
    required this.name,
    required this.price,
    this.vat = 0,
    this.isActive = true,
  });

  factory UpdateItemDto.fromJson(Map<String, dynamic> json) {
    return UpdateItemDto(
      name: json['name']?.toString() ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      vat: double.tryParse(json['vat'].toString()) ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'vat': vat,
      'isActive': isActive, 
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}