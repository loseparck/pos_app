import 'package:pos_app/features/plan/domain/entities/table_entity.dart';


class PlanGroup {
  final String id;
  final String name;
  final List<RestaurantTable> tables;

  PlanGroup({
    required this.id,
    required this.name,
    required this.tables
  });

  PlanGroup copyWith({
    String? name,
    List<RestaurantTable>? tables,
  }){
    return PlanGroup(
      id: id, 
      name: name ?? this.name, 
      tables: tables ?? this.tables);
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory PlanGroup.fromJson(Map<String, dynamic> json){
    List<Map<String, dynamic>> test = (json['tables']! as List<Map<String, dynamic>>);
    return PlanGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      tables: test.map((e) => RestaurantTable.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'tables': tables,
    };
  }

   //factory PlanGroup.fromJson(Map<String, dynamic> json)
      //=> _$PlanGroupFromJson(json);

  //Map<String, dynamic> toJson() => _$PlanGroupToJson(this);
}

/*PlanGroup _$PlanGroupFromJson(Map<String, dynamic> json) => PlanGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      tables: (json['tables'] as List<dynamic>?)
          ?.map((e) => RestaurantTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanGroupToJson(PlanGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.tables,
    };*/