import 'package:pos_app/features/plan/domain/entities/plan_group_entity.dart';

class PlanGroupState{
  final List<PlanGroup> groups;
  final String? selectedGroupId;

  PlanGroupState({
    required this.groups,
    required this.selectedGroupId,
  });

  PlanGroup? get selectedGroup {
    if(selectedGroupId == null) return null;
    try{
      return groups.firstWhere((group) => group.id == selectedGroupId);
    } catch(_){
      return null;
    }
  } 

  PlanGroupState copyWith({
    List<PlanGroup>? groups,
    String? selectedGroupId,
  }){
    return PlanGroupState(
      selectedGroupId: selectedGroupId ?? this.selectedGroupId, 
      groups: groups ?? this.groups);
  }
}