import 'package:pos_app/features/discount/data/models/dto/optional.dart';

class UpdatePlanDto {
  final String id;
  final Optional<String> name;
  final Optional<int?> color;
  final Optional<bool> active;
  final Optional<bool> delivery;
  final DateTime? updatedAt;

  const UpdatePlanDto({
    required this.id,
    this.name = const Optional.unset(),
    this.color = const Optional.unset(),
    this.active = const Optional.unset(),
    this.delivery = const Optional.unset(),
    this.updatedAt
  });

  factory UpdatePlanDto.fromJson(Map<String, dynamic> json) {
    return UpdatePlanDto(
      id: json['id']?.toString() ?? '',
      name: json.containsKey('name')
          ? Optional.value(json['name'] as String)
          : const Optional.unset(),
      color: json.containsKey('color')
          ? Optional.value(json['color'] as int?)
          : const Optional.unset(),
      active: json.containsKey('active')
          ? Optional.value(json['active'] as bool)
          : const Optional.unset(),
      delivery: json.containsKey('delivery')
          ? Optional.value(json['delivery'] as bool)
          : const Optional.unset(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.value,
      'color': color.value,
      'active': active.value,
      'delivery': delivery.value,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}