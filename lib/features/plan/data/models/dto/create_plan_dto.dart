class CreatePlanDto {
  final String id;
  final String name;
  final DateTime? createdAt;
  final String? createdById;

  const CreatePlanDto({
    required this.id,
    required this.name,
    this.createdAt,
    this.createdById
  });

  factory CreatePlanDto.fromJson(Map<String, dynamic> json) {
    return CreatePlanDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      createdById: json['createdById']?.toString(), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById
    };
  }
}