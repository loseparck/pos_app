import 'package:pos_app/features/catalog/domain/entities/item.dart';

class Option {
  final String id;
  final String name;
  final bool isMandatory;
  final int minToSelect;
  final int maxToSelect;
  final bool multipleSelect;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;
  final List<Item> items;

  Option({
    required this.name,
    required this.items,
    this.isMandatory = false,
    this.minToSelect = 0,
    this.maxToSelect = -1,
    this.multipleSelect = false,
    this.id = "",
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

   Option copyWith({
    String? id,
    String? name,
    bool? isMandatory,
    int? minToSelect,
    int? maxToSelect,
    bool? multipleSelect,
    bool? isActive,
    List<Item>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdById
  }) {
    return Option(
      id: id ?? this.id,
      name: name ?? this.name,
      isMandatory: isMandatory ?? this.isMandatory,
      minToSelect: minToSelect ?? this.minToSelect,
      maxToSelect: maxToSelect ?? this.maxToSelect,
      multipleSelect: multipleSelect ?? this.multipleSelect,
      isActive: isActive ?? this.isActive,
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

  factory Option.fromJson(Map<String, dynamic> json){
    return Option(
      id: json['id'] as String,
      name: json['name'] ?? '',
      isMandatory: (json['isMandatory'] as bool? ?? false),
      minToSelect: int.tryParse(json['minToSelect'].toString()) ?? 0,
      maxToSelect: int.tryParse(json['maxToSelect'].toString()) ?? 0,
      multipleSelect: (json['multipleSelect'] as bool? ?? false),
      isActive: (json['isActive'] as bool? ?? true),
      items: json['items'] != null ? (json['items'] as List<dynamic>).map((e) => Item.fromJson(e)).toList() : [],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'] as String?,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'isMandatory': isMandatory,
      'minToSelect': minToSelect,
      'maxToSelect': maxToSelect,
      'multipleSelect': multipleSelect,
      'isActive': isActive,
      'items': items.map((e) => e.toJson()).toList(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}