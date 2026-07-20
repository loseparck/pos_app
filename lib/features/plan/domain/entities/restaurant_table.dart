import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';

enum TableShape{ square, circle}

enum TableStatus{ 
  empty(label: "empty", color: Color(0xFF2ECC71)),
  occuped(label: "occuped", color: Color(0xFF3498DB)),
  waitingForValidation(label: "waitingForValidation", color: Color(0xFFE67E22)),
  waitingForService(label: "waitingForService", color: Color(0xFF9B59B6)),
  served(label: "served", color: Color(0xFF2C3E50)),
  askForBill(label: "askForBill", color: Color(0xFFF1C40F)),
  paid(label: "paid", color: Color(0xFFBDC3C7)),
  toClean(label: "toClean", color: Color(0xFF95A5A6)),
  reserved(label: "reserved", color: Color(0xFF9B59B6)),
  outOfService(label: "outOfService", color: Color(0xFFC0392B)),
  canceled(label: "canceled", color: Color(0xFF34495E));


 // draft,
  //validated,
  //paid,,;
  
  const TableStatus({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  static TableStatus? fromLabel(String label) {
    for (final value in TableStatus.values) {
      if (value.label == label) {
        return value;
      }
    }
    return null;
  }
}

class RestaurantTable{
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
  final Plan plan;
  final String? createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  RestaurantTable({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
    this.seats = 2,
    required this.plan,
    this.status = TableStatus.empty,
    this.rotation = 0,
    this.shape = TableShape.square,
    this.height = 100,
    this.width = 100,
    this.color = "0xFF81C784",
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

  RestaurantTable copyWith({
    String? id,
    String? name,
    double? x,
    double? y,
    int? seats,
    TableStatus? status,
    double? rotation,
    TableShape? shape,
    bool? isSelected,
    double? height,
    double? width,
    Plan? plan,
    String? color,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }){
    return RestaurantTable(
       id: id ?? this.id,
      name: name ?? this.name, 
      x: x ?? this.x,
      y: y ?? this.y,
      seats: seats ?? this.seats,
      status: status ?? this.status, 
      rotation: rotation ?? this.rotation,
      shape: shape ?? this.shape,
      height: height ?? this.height,
      width: width ?? this.width,
      plan: plan ?? this.plan,
      color: color ?? this.color,
      createdById: createdById ?? this.createdById, 
      createdAt: createdAt ?? this.createdAt, 
      updatedAt: updatedAt ?? this.updatedAt, 
      deletedAt: deletedAt ?? this.deletedAt, 
    );
  }

  factory RestaurantTable.create(Plan plan) {
    return RestaurantTable(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: "Table",
      seats: 2,
      x: 600,
      y: 600,
      width: 100,
      height: 100,
      rotation: 0,
      shape: TableShape.square,
      plan: plan,
      createdAt: DateTime.now()
    );
  }

   @override
  String toString() {
    return toJson().toString();
  }

  factory RestaurantTable.fromJson(Map<String, dynamic> json){
    return RestaurantTable(
      id: json['id'] as String,
      name: json['name'] as String,
      x: double.tryParse(json['x'].toString()) ?? 0,
      y: double.tryParse(json['y'].toString()) ?? 0,
      seats: int.tryParse(json['seats'].toString()) ?? 0,
      status: TableStatus.fromLabel(json['status']) ?? TableStatus.empty,
      rotation: double.tryParse(json['rotation'].toString()) ?? 0,
      shape: $enumDecodeNullable(tableShapeEnumMap, json['shape']) ??
          TableShape.circle,
      width: double.tryParse(json['width'].toString()) ?? 0,
      height: double.tryParse(json['height'].toString()) ?? 0,
      color: json['color'] as String,
      plan: json['plan'] != null ? Plan.fromJson(json['plan'] as Map<String, dynamic>) : Plan(id: json['planId'] as String, name: ''),
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
      'x': x,
      'y': y,
      'seats': seats,
      'status': status.label,
      'rotation': rotation,
      'shape': tableShapeEnumMap[shape]!,
      'width': width,
      'height': height,
      'color': color,
      'plan': plan,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
  
}

const tableShapeEnumMap = {
  TableShape.circle: 'circle',
  TableShape.square: 'square',
};

/*
const tableStatusEnumMap = {
  TableStatus.empty: 'empty',
  TableStatus.draft: 'draft',
  TableStatus.validated: 'validated',
  TableStatus.paid: 'paid',
};*/