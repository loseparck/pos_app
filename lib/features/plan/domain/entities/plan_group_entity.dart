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
}