import 'package:pos_app/features/plan/domain/entities/plan_group_entity.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';

class PlanGroupState{
  final List<PlanGroup> groups;
  final String? selectedGroupId;
  final String? selectedTableId;

  PlanGroupState({
    required this.groups,
    required this.selectedGroupId,
    required this.selectedTableId,
  });

  PlanGroup? get selectedGroup {
    if(selectedGroupId == null) return null;
    try{
      return groups.firstWhere((group) => group.id == selectedGroupId);
    } catch(_){
      return null;
    }
  } 

  RestaurantTable? get selectedTable {
    if(selectedTableId == null) return null;
    try{
      return groups.firstWhere((group) => group.id == selectedGroupId).tables.firstWhere((table) => table.id == selectedTableId);
    } catch(_){
      return null;
    }
  } 

  PlanGroupState copyWith({
    List<PlanGroup>? groups,
    String? selectedGroupId,
    String? selectedTableId,
  }){
    return PlanGroupState(
      selectedGroupId: selectedGroupId ?? this.selectedGroupId, 
      selectedTableId: selectedTableId ?? this.selectedTableId, 
      groups: groups ?? this.groups);
  }
}