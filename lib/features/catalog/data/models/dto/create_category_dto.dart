class CreateCategoryDto {
  final String id;
  final String name;
  final String? image;
  final String? color;
  final String? parentId;
  final bool isActive;
  final DateTime? createdAt;
  final String? createdById;

  const CreateCategoryDto({
    required this.id,
    required this.name,
    this.isActive = true,
    this.createdAt,
    this.createdById,
    this.parentId,
    this.image,
    this.color
  });

  factory CreateCategoryDto.fromJson(Map<String, dynamic> json) {
    return CreateCategoryDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      image: json['image'] as String?,
      color: json['color'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      parentId: json['parentId'].toString(),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      createdById: json['createdById']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'color': color,
      'isActive': isActive,
      'parentId': parentId,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,  
    };
  }
}