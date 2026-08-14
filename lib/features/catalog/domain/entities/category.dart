import 'package:flutter/material.dart';

class Category {

  final String id;
  final String name;
  final Category? parent;
  final String? parentId;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;
  final String? image;
  final Color? color;

  const Category({
    required this.name,
    this.parent,
    this.id = "",
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
    this.parentId,
    this.image,
    this.color,
  });

  Category copyWith({
    String? id,
    String? name,
    Category? parent,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdById,
    bool? resetParent,
    String? image,
    Color? color,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      parent: resetParent == true ? null : parent ?? this.parent,
      parentId: resetParent == true ? null : parent?.id ?? parentId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById ?? this.createdById,
      image: image ?? this.image,
      color: color ?? this.color
    );
  }

 /* Category copyParent({
    Category? parent
  }) {
    return Category(
      id: id,
      name: name,
      parent: parent ,
      parentId: parent?.id,
      isActive: isActive,
      createdAt: createdAt ,
      updatedAt: updatedAt,
      deletedAt: deletedAt ,
      createdById: createdById
    );
  }*/

  @override
  String toString() {
    return toJson().toString();
  }

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      parent: json['parentId'] != null ? Category(id:json['parentId'] ?? '', name: '') : null,
      parentId: json['parentId'] as String?,
      isActive: (json['isActive'] as bool? ?? true),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'] as String?,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'parent': parent?.toJson(),
      'image': image,
      'isActive': isActive,
      'color': color,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
  
}