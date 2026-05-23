class UpdateDiscountDto {
  final String name;
  final bool isActive;
  final DateTime updatedAt;

  const UpdateDiscountDto({
    required this.updatedAt,
    required this.name,
    this.isActive = true,
  });

  factory UpdateDiscountDto.fromJson(Map<String, dynamic> json) {
    return UpdateDiscountDto(
      name: json['name']?.toString() ?? '',
      isActive: bool.tryParse(json['isActive'].toString()) ?? true,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isActive': isActive, 
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}