import 'package:pos_app/features/catalog/domain/entities/item.dart';

class Option {
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
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;
  final List<Item> items;

  bool get isActive => active;
  bool get isMandatory => mandatory;

  Option({
    this.id = '',
    required this.name,
    this.description,
    this.image,
    this.color = "0xFF7352D6",
    this.mandatory = false,
    this.minSelection = 0,
    this.maxSelection = 0,
    this.allowDuplicateSelection = false,
    this.active = true,
    this.items = const [],
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

   Option copyWith({
    String? id,
    String? name,
    String? description,
    bool? mandatory,
    int? minSelection,
    int? maxSelection,
    bool? allowDuplicateSelection,
    String? image,
    String? color,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdById,
    List<Item>? items,
    bool? resetImage,
  }) {
    return Option(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      mandatory: mandatory ?? this.mandatory,
      minSelection: minSelection ?? this.minSelection,
      maxSelection: maxSelection ?? this.maxSelection,
      allowDuplicateSelection: allowDuplicateSelection ?? this.allowDuplicateSelection,
      image: resetImage == true ? null : image ?? this.image,
      color: color ?? this.color,
      active: active ?? this.active,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById ?? this.createdById
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
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
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'],
      items: json['items'] != null
          ? (json['items'] as  List<dynamic>).map((item) => Item.fromJson(item)).toList()
          : [],
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
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Option && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}