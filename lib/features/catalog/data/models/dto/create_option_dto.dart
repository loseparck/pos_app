import 'create_item_dto.dart';

class CreateOptionDto {
  final String id;
  final String name;
  final bool isMandatory;
  final int minToSelect;
  final int maxToSelect;
  final bool multipleSelect;
  final bool? isActive;
  final List<CreateItemDto> items;
  final DateTime? createdAt;
  final String? createdById;

  const CreateOptionDto({
    required this.id,
    required this.name,
    required this.isMandatory,
    required this.minToSelect,
    required this.maxToSelect,
    required this.multipleSelect,
    required this.items,
    required this.isActive,
    this.createdAt,
    this.createdById
  });

  factory CreateOptionDto.fromJson(Map<String, dynamic> json) {
    return CreateOptionDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      isMandatory: json['isMandatory'] == true,
      minToSelect: int.tryParse(json['minToSelect'].toString()) ?? 0,
      maxToSelect: int.tryParse(json['maxToSelect'].toString()) ?? 0,
      multipleSelect: json['multipleSelect'] == true,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => CreateItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      createdById: json['createdById']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isMandatory': isMandatory,
      'minToSelect': minToSelect,
      'maxToSelect': maxToSelect,
      'multipleSelect': multipleSelect,
      'items': items.map((e) => e.toJson()).toList(),
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,  
    };
  }
}