import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:json_annotation/json_annotation.dart';

class UpdateRestaurantTableDto {
  final String id;
  final String? name;
  final double? x;
  final double? y;
  final int? seats;
  final TableStatus? status;
  final double? rotation;
  final TableShape? shape;
  final double? width;
  final double? height;
  final String? color;
  final String? planId;
  final DateTime? updatedAt;

  const UpdateRestaurantTableDto({
    required this.id,
    this.name,
    this.x,
    this.y,
    this.seats,
    this.status,
    this.rotation,
    this.shape,
    this.width,
    this.height,
    this.color,
    this.planId,
    this.updatedAt
  });

  factory UpdateRestaurantTableDto.fromJson(Map<String, dynamic> json) {
    return UpdateRestaurantTableDto(
      id: json['id'] as String,
      name: json['name'] as String,
      x: double.tryParse(json['x'].toString()) ?? 0,
      y: double.tryParse(json['y'].toString()) ?? 0,
      seats: int.tryParse(json['seats'].toString()) ?? 0,
      status: $enumDecodeNullable(tableStatusEnumMap, json['status']) ??
          TableStatus.empty,
      rotation: double.tryParse(json['rotation'].toString()) ?? 0,
      shape: $enumDecodeNullable(tableShapeEnumMap, json['shape']) ??
          TableShape.circle,
      width: double.tryParse(json['width'].toString()) ?? 0,
      height: double.tryParse(json['height'].toString()) ?? 0,
      color: json['color'] as String,
      planId: json['planId'] as String,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'x': x,
      'y': y,
      'seats': seats,
      'status': tableStatusEnumMap[status],
      'rotation': rotation,
      'shape': tableShapeEnumMap[shape]!,
      'width': width,
      'height': height,
      'color': color,
      'planId': planId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}