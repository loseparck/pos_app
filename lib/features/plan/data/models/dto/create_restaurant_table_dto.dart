import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:json_annotation/json_annotation.dart';

class CreateRestaurantTableDto {
  final String id;
  final String name;
  final double x;
  final double y;
  final int seats;
  final TableStatus status;
  final double rotation;
  final TableShape shape;
  final double width;
  final double height;
  final String? color;
  final String planId;
  final List<String>? options;
  final DateTime? createdAt;
  final String? createdById;

  const CreateRestaurantTableDto({
    required this.id,
    required this.name,
    this.options,
    this.color,
    this.createdAt,
    this.createdById,
    required this.x, 
    required this.y, 
    required this.seats, 
    required this.status, 
    required this.rotation, 
    required this.shape, 
    required this.width, 
    required this.height, 
    required this.planId
  });

  factory CreateRestaurantTableDto.fromJson(Map<String, dynamic> json) {
    return CreateRestaurantTableDto(
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
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      createdById: json['createdById']?.toString(), 
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
      'createdAt': createdAt?.toIso8601String(),
      'createdById': createdById
    };
  }
}