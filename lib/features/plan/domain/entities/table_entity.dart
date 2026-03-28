import 'package:json_annotation/json_annotation.dart';

enum TableShape{ square, circle}

class RestaurantTable{
  final String id;
  final String name;
  final double x;
  final double y;
  final int seats;
  final String? status;
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
    this.status,
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
    String? status,
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

   //factory RestaurantTable.fromJson(Map<String, dynamic> json)
      //=> _$RestaurantTableFromJson(json);

  //Map<String, dynamic> toJson() => _$RestaurantTableToJson(this);

  factory RestaurantTable.fromJson(Map<String, dynamic> json){
    return RestaurantTable(
      id: json['id'] as String,
      name: json['name'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      seats: (json['seats'] as num).toInt(),
      status: json['status'] as String,
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
      'status': status,
      'rotation': rotation,
      'shape': _$TableShapeEnumMap[shape]!,
      'isSelected': isSelected,
      'width': width,
      'height': height,
    };
  }
}

/*RestaurantTable _$RestaurantTableFromJson(Map<String, dynamic> json) => RestaurantTable(
      id: json['id'] as String,
      name: json['name'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      seats: (json['seats'] as num).toInt(),
      status: json['status'] as String,
      rotation: (json['rotation'] as num).toDouble(),
      shape: $enumDecodeNullable(_$TableShapeEnumMap, json['shape']) ??
          TableShape.circle,
      isSelected: json['isSelected'] as bool? ?? false,
      width:(json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$RestaurantTableToJson(RestaurantTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'x': instance.x,
      'y': instance.y,
      'seats': instance.seats,
      'status': instance.status,
      'rotation': instance.rotation,
      'shape': _$TableShapeEnumMap[instance.shape]!,
      'isSelected': instance.isSelected,
      'width': instance.width,
      'height': instance.height,
    };
*/
const _$TableShapeEnumMap = {
  TableShape.circle: 'circle',
  TableShape.square: 'square',
};