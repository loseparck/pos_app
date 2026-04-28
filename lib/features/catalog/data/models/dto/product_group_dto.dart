class ProductGroupDto {
  final String id;
  final String name;
  final String? parentId;
  final bool isActive;

  const ProductGroupDto({
    required this.id,
    required this.name,
    this.parentId,
    required this.isActive,
  });

  factory ProductGroupDto.fromJson(Map<String, dynamic> json) {
    return ProductGroupDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      parentId: json['parentId']?.toString(),
      isActive: json['isActive'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'isActive': isActive,
    };
  }
}