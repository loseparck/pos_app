
class CreateOptionDto {
  final String id;
  final String name;
  final String? description;
  final bool mandatory;
  final int minSelection;
  final int maxSelection;
  final bool allowDuplicateSelection;
  final String? image;
  final String? color;
  final bool active;
  final DateTime? createdAt;
  final String? createdById;

  const CreateOptionDto({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.color = "0xFF7352D6",
    this.mandatory = false,
    this.minSelection = 0,
    this.maxSelection = 0,
    this.allowDuplicateSelection = false,
    this.active = true,
    this.createdAt,
    this.createdById,
  });

  factory CreateOptionDto.fromJson(Map<String, dynamic> json) {
    return CreateOptionDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      mandatory: json['mandatory'] ?? false,
      minSelection: json['minSelection'] ?? 0,
      maxSelection: json['maxSelection'] ?? 0,
      allowDuplicateSelection: json['allowDuplicateSelection'] ?? false,
      image: json['image'],
      color: json['color'],
      active: json['active'] ?? true,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      createdById: json['createdById'],
    );
  }

  // --- TO JSON ---
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'mandatory': mandatory,
      'minSelection': minSelection,
      'maxSelection': maxSelection,
      'allowDuplicateSelection': allowDuplicateSelection,
      'image': image,
      'color': color,
      'active': active,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}