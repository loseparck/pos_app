class CreateOptionItemDto {
  final String id;
  final String name;
  final double price;
  final double vat;
  final bool isActive;
  final String groupId;
  final DateTime? createdAt;
  final String? createdById;

  const CreateOptionItemDto({
    required this.id,
    required this.name,
    required this.price,
    required this.groupId,
    this.vat = 0,
    this.isActive = true,
    this.createdAt,
    this.createdById
  });

  factory CreateOptionItemDto.fromJson(Map<String, dynamic> json) {
    return CreateOptionItemDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      vat: double.tryParse(json['vat'].toString()) ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      groupId: json['groupId'].toString(),
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
      'groupId': groupId,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,  
    };
  }
}