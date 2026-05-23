class UpdatePlanDto {
  final String id;
  final String name;
  final DateTime? updatedAt;

  const UpdatePlanDto({
    required this.id,
    required this.name,
    this.updatedAt
  });

  factory UpdatePlanDto.fromJson(Map<String, dynamic> json) {
    return UpdatePlanDto(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}