class CreateItemDto {
  final String id;
  final String name;
  final double price;
  final double vat;
  final bool isActive;
  final String optionId;
  final DateTime? createdAt;
  final String? createdById;

  const CreateItemDto({
    required this.id,
    required this.name,
    required this.price,
    required this.optionId,
    this.vat = 0,
    this.isActive = true,
    this.createdAt,
    this.createdById
  });

  factory CreateItemDto.fromJson(Map<String, dynamic> json) {
    return CreateItemDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      vat: double.tryParse(json['vat'].toString()) ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      optionId: json['optionId'].toString(),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      createdById: json['createdById']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'vat': vat,
      'isActive': isActive,
      'optionId': optionId,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,  
    };
  }
}