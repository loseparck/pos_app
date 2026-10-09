class CreatePlanDto {
  final String id;
  final String name;
  final int? color;
  final bool active;
  final bool delivery;
  final DateTime? createdAt;
  final String? createdById;

  const CreatePlanDto({
    required this.id,
    required this.name,
    this.color,
    this.active = true,
    this.delivery = false,
    this.createdAt,
    this.createdById
  });

  factory CreatePlanDto.fromJson(Map<String, dynamic> json) {
    return CreatePlanDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      color: json['color'] as int?,
      active: json['active'] ?? true,
      delivery: json['delivery'] ?? false,
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