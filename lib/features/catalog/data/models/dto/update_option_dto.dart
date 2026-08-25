
class UpdateOptionDto {
  final String? name;
  final String? description;
  final bool? mandatory;
  final int? minSelection;
  final int? maxSelection;
  final bool? allowDuplicateSelection;
  final String? image;
  final String? color;
  final bool? active;
  final DateTime? updatedAt;

  const UpdateOptionDto({
    this.name,
    this.description,
    this.mandatory,
    this.minSelection,
    this.maxSelection,
    this.allowDuplicateSelection,
    this.image,
    this.color,
    this.active,
    this.updatedAt,
  });

  factory UpdateOptionDto.fromJson(Map<String, dynamic> json) {
    return UpdateOptionDto(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      mandatory: json['mandatory'] ?? false,
      minSelection: json['minSelection'] ?? 0,
      maxSelection: json['maxSelection'] ?? 0,
      allowDuplicateSelection: json['allowDuplicateSelection'] ?? false,
      image: json['image'],
      color: json['color'],
      active: json['active'] ?? true,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // --- TO JSON ---
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'mandatory': mandatory,
      'minSelection': minSelection,
      'maxSelection': maxSelection,
      'allowDuplicateSelection': allowDuplicateSelection,
      'image': image,
      'color': color,
      'active': active,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}