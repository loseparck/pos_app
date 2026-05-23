
class UpdateOptionDto {
  final String name;
  final bool isMandatory;
  final int minToSelect;
  final int maxToSelect;
  final bool multipleSelect;
  final bool? isActive;
  final DateTime updatedAt;

  const UpdateOptionDto({
    required this.name,
    required this.isMandatory,
    required this.minToSelect,
    required this.maxToSelect,
    required this.multipleSelect,
    required this.isActive,
    required this.updatedAt,
  });

  factory UpdateOptionDto.fromJson(Map<String, dynamic> json) {
    return UpdateOptionDto(
      name: json['name']?.toString() ?? '',
      isMandatory: json['isMandatory'] == true,
      minToSelect: int.tryParse(json['minToSelect'].toString()) ?? 0,
      maxToSelect: int.tryParse(json['maxToSelect'].toString()) ?? 0,
      multipleSelect: json['multipleSelect'] == true,
      isActive: json['isActive'] as bool? ?? true,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isMandatory': isMandatory,
      'minToSelect': minToSelect,
      'maxToSelect': maxToSelect,
      'multipleSelect': multipleSelect,
      'isActive': isActive,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}