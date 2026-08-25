class UpdateCategoryDto {
  final String name;
  final String? parentId;
  final String? image;
  final String? color;
  final bool isActive;
  final DateTime updatedAt;

  const UpdateCategoryDto({
    required this.updatedAt,
    required this.name,
    this.isActive = true,
    this.parentId,
    this.image,
    this.color
  });

  factory UpdateCategoryDto.fromJson(Map<String, dynamic> json) {
    return UpdateCategoryDto(
      name: json['name']?.toString() ?? '',
      isActive: bool.tryParse(json['isActive'].toString()) ?? true,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : DateTime.now(),
      parentId: json['parentId']?.toString(),
      image: json['image'] as String?,
      color: json['color'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isActive': isActive, 
      'updatedAt': updatedAt.toIso8601String(),
      'parentId': parentId,
      'image': image,
      'color': color,
    };
  }
}