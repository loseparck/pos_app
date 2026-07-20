import 'package:json_annotation/json_annotation.dart';

enum DiscountType{fixed, percentage}

class Discount {
  final String id;
  final String name;
  final double value;
  final DiscountType discountType;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? createdById;

  const Discount({
    this.id = "",
    required this.name,
    this.value = 0,
    this.discountType = DiscountType.fixed,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

  Discount copyWith({
    String? id,
    String? name,
    double? value,
    DiscountType? discountType,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdById,
  }) {
    return Discount(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      discountType: discountType ?? this.discountType,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById ?? this.createdById
    );
  }

  // Calcule la valeur de la remise sur un montant brut donné
  double calculateDiscountAmount(double baseAmount) {
    if (discountType == DiscountType.percentage) {
      return baseAmount * (value / 100);
    } else if (discountType == DiscountType.fixed) {
      return value > baseAmount ? baseAmount : value;
    }
    return 0.0;
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Discount.fromJson(Map<String, dynamic> json){
    return Discount(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      value: double.tryParse(json['value'].toString()) ?? 0,
      discountType: $enumDecodeNullable(discountTypeEnumMap, json['discountType']) ??
          DiscountType.fixed,
      isActive: (json['isActive'] as bool? ?? true),
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
      'value': value,
      'discountType': discountTypeEnumMap[discountType],
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
  
}

const discountTypeEnumMap = {
  DiscountType.fixed: 'fixed',
  DiscountType.percentage: 'percentage',
};