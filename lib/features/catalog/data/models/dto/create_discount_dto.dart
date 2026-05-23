import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:json_annotation/json_annotation.dart';

class CreateDiscountDto {
  final String id;
  final String name;
  final double? value;
  final DiscountType discountType;
  final bool isActive;
  final DateTime? createdAt;
  final String? createdById;

  const CreateDiscountDto({
    required this.id,
    required this.name,
    this.value = 0,
    this.isActive = true,
    required this.discountType,
    this.createdAt,
    this.createdById,
  });

  factory CreateDiscountDto.fromJson(Map<String, dynamic> json) {
    return CreateDiscountDto(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      value: double.tryParse(json['value'].toString()) ?? 0,
      discountType: $enumDecodeNullable(discountTypeEnumMap, json['discountType']) ??
          DiscountType.amount,
      isActive: bool.tryParse(json['isActive'].toString()) ?? true,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      createdById: json['createdById']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'discountType': discountTypeEnumMap[discountType],
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById,  
    };
  }
}