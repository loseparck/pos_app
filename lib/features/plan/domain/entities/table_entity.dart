import 'package:json_annotation/json_annotation.dart';

enum TableShape{ square, circle}

enum TableStatus{ empty, draft, validated}

class RestaurantTable{
  final String id;
  final String name;
  final double x;
  final double y;
  final int seats;
  final TableStatus status;
  final double rotation;
  final TableShape shape;
  final bool isSelected;
  final double width;
  final double height;

  RestaurantTable({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
    required this.seats,
    this.status = TableStatus.empty,
    this.rotation = 0,
    this.shape = TableShape.square,
    this.isSelected = false,
    this.height = 100,
    this.width = 100,
  });

  RestaurantTable copyWith({
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
  }){
    return RestaurantTable(
      id: id, 
      name: name ?? this.name, 
      x: x ?? this.x,
      y: y ?? this.y,
      seats: seats ?? this.seats,
      status: status ?? this.status, 
      rotation: rotation ?? this.rotation,
      shape: shape ?? this.shape,
      isSelected: isSelected ?? this.isSelected,
      height: height ?? this.height,
      width: width ?? this.width,
      );
  }

  factory RestaurantTable.create() {
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
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      seats: (json['seats'] as num).toInt(),
      status: $enumDecodeNullable(_$TableStatusEnumMap, json['status']) ??
          TableStatus.empty,
      rotation: (json['rotation'] as num).toDouble(),
      shape: $enumDecodeNullable(_$TableShapeEnumMap, json['shape']) ??
          TableShape.circle,
      isSelected: json['isSelected'] as bool? ?? false,
      width:(json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'x': x,
      'y': y,
      'seats': seats,
      'status': _$TableStatusEnumMap[status],
      'rotation': rotation,
      'shape': _$TableShapeEnumMap[shape]!,
      'isSelected': isSelected,
      'width': width,
      'height': height,
    };
  }
  
}

const _$TableShapeEnumMap = {
  TableShape.circle: 'circle',
  TableShape.square: 'square',
};

const _$TableStatusEnumMap = {
  TableStatus.empty: 'empty',
  TableStatus.draft: 'draft',
  TableStatus.validated: 'validated',
};