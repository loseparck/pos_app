import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

class PlanGroupState{
  final List<Plan> plans;
  final List<RestaurantTable> tables;
  final String? selectedPlanId;
  final String? selectedTableId;
  final bool tableChange;

  PlanGroupState({
    List<Plan>? plans,
    List<RestaurantTable>? tables,
    this.selectedPlanId,
    this.selectedTableId,
    this.tableChange = false
  })  : plans = plans ?? [],
        tables = tables ?? [];

  Plan? get selectedPlan {
    if(selectedPlanId == null) return null;
    try{
      return plans.firstWhere((plan) => plan.id == selectedPlanId);
    } catch(_){
      return null;
    }
  } 

  RestaurantTable? get selectedTable {
    if(selectedTableId == null) return null;
    try{
      return tables.firstWhere((table) => table.id == selectedTableId);
    } catch(_){
      return null;
    }
  }

  List<RestaurantTable> get selectedPlanTables {
    if(selectedPlanId == null) return [];
    try{
      return tables.where((table) => table.plan.id == selectedPlanId).toList();
    } catch(_){
      return [];
    }
  }

  PlanGroupState copyWith({
    List<Plan>? plans,
    List<RestaurantTable>? tables,
    String? selectedPlanId,
    String? selectedTableId,
    bool? tableChange,
    bool? resetPlanId,
    bool? resetTableId
  }){
    return PlanGroupState(
      selectedPlanId: resetPlanId == true ? null : selectedPlanId ?? this.selectedPlanId, 
      selectedTableId: resetTableId == true ? null : selectedTableId ?? this.selectedTableId, 
      plans: plans ?? this.plans,
      tables: tables ?? this.tables,
      tableChange: tableChange ?? this.tableChange
    );
  }
}