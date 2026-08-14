import 'package:pos_app/features/plan/application/usecase_provider.dart';
import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:pos_app/features/plan/application/plan_state.dart';
import 'package:uuid/uuid.dart';

class PlanGroupNotifier extends StateNotifier<PlanGroupState>{
  final Ref ref;
  final PlanRepository _repository;
  List<Plan>? draftPlans;
  List<RestaurantTable>? draftTables;
  RestaurantTable? draftTable;
  double? maxX, maxY;
  final _uuid = const Uuid();

  final List<String> plansToCreate = [];
  final List<String> plansToUpdate = [];
  final List<String> plansToRemove = [];
  final List<String> tablesToCreate = [];
  final List<String> tablesToUpdate = [];
  final List<String> tablesToRemove = [];

  PlanGroupNotifier(this.ref, this._repository) : 
  super(
    PlanGroupState(
      plans: [], 
      tables: [], 
      selectedPlanId: null,
      selectedTableId: null
      )
    );

  Future<void> load() async {
    final plans = await _repository.getPlans();
    final tables = await _repository.getTables();
    state = state.copyWith(
      plans: plans,
      tables: tables
    );
  }

  void selectPlan(String planId){
    state = state.copyWith(
      selectedPlanId: planId,
      resetTableId: true
    );
  }

  void selectTable(String tableId){
    state= state.copyWith(
      selectedTableId: tableId,
    );
  }

  void addPlan(String name){

    final plan = Plan(
      id: _uuid.v4(),
      name: name,
    );
    
    state = state.copyWith(
      plans: [...state.plans, plan],
      selectedPlanId: plan.id,
      resetTableId: true
    );

    plansToCreate.add(plan.id);
  }

  void startTableChange(){
    if(state.selectedPlanId == null){
      return;
    }
  
    if(state.selectedTableId == null){
      draftTable = RestaurantTable(
        id:  _uuid.v4(), 
        name: '', 
        x: 100, 
        y: 100,
        seats: 2,
        shape: TableShape.circle,
        plan: Plan(id: state.selectedPlanId ?? '', name: '')
      );

      state = state.copyWith(
        tables: [...state.tables, draftTable!],
        selectedTableId: draftTable?.id
      );
      tablesToCreate.add(draftTable!.id);
      draftTable = null;
      
    } else {
      draftTable = state.selectedTable;
    }

    state = state.copyWith(
      tableChange: true
    );
  }

  void stopTableChange(){
    draftTable=null;
    state = state.copyWith(
      tableChange: false,
      resetTableId: true
    );
  }

  void validateTable(){
    if(state.selectedTableId == null){
      return;
    }

    if(draftTable != null){
      if(draftTable != state.selectedTable){
        tablesToUpdate.add(state.selectedTableId!);
      }
    } else{
      if(!tablesToCreate.contains(state.selectedTableId)){
        tablesToCreate.add(state.selectedTableId!);
      }
    }

    stopTableChange();
  }

  void updateTablePosition(String tableId, double x, double y){
    if(!tablesToCreate.contains(tableId)){
      if(!tablesToUpdate.contains(tableId)){
        tablesToUpdate.add(tableId);
      }
    }
    final selected = state.selectedPlan;

    if(selected == null) return;
    
    state = state.copyWith(
        tables: state.tables.map((t) => t.id == tableId ? t.copyWith(x: x, y: y) : t).toList(),
    );
  }

  void cancelEditTable(){
    if(draftTable != null){
      state = state.copyWith(
        tables: state.tables.map((table) {
          if(table.id == state.selectedTableId){
            return draftTable!;
          }
          return table;
        }).toList(),
      );
      stopTableChange();
    } else {
      removeTable();
    }
  }

  void removeTable({String? tableId}){
    if(state.selectedTableId == null && tableId == null){
      return;
    }

    final idToRemove = tableId ?? state.selectedTableId;

    state = state.copyWith(
      tables: state.tables.where((table) => table.id != idToRemove).toList(),
    );

    if(tablesToCreate.contains(idToRemove)){
       tablesToCreate.remove(idToRemove);
    } else{
       tablesToRemove.add(idToRemove!);
       if(tablesToUpdate.contains(idToRemove)){
        tablesToUpdate.remove(idToRemove);
       }
    }

    stopTableChange();
  }

  void changeTableColor(String value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          return table.copyWith(color: value);
        }
        return table;
      }).toList(),
    );
  }

  void rotateTable(double value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          return table.copyWith(rotation: table.rotation + value);
        }
        return table;
      }).toList(),
    );
  }

  void toggleShape(TableShape newShape){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          return table.copyWith(
            shape: newShape,
          );
        }
        return table;
      }).toList(),
    );
  }

  void scaleHorizentally(double value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          if(table.width + value < 50){
            return table.copyWith(
              width: 50,
            );
          } else if(table.width + value > 400){
            return table.copyWith(
              width: 400,
            );
          } else{
              return table.copyWith(
              width: table.width + value,
            );
          }
        }
        return table;
      }).toList(),
    );
  }

  void scaleVertically(double value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          if(table.height + value < 50){
            return table.copyWith(
              height: 50,
            );
          } else if(table.height + value > 400){
            return table.copyWith(
              height: 400,
            );
          } else{
              return table.copyWith(
              height: table.height + value,
            );
          }
        }
        return table;
      }).toList(),
    );
  }

  void changePositionX(double value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          if(table.x + value <0){
            return table.copyWith(
              x: 0,
            );
          } else if(table.x + value > (maxX! - table.width)){
            return table.copyWith(
              x: maxX! - table.width,
            );
          } else {
              return table.copyWith(
              x: table.x + value,
            );
          }
        }
        return table;
      }).toList(),
    );
  }

  void changePositionY(double value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          if(table.y + value <0){
            return table.copyWith(
              y: 0,
            );
          } else if(table.y + value > maxY! - table.height){
            return table.copyWith(
              y: maxY! - table.height,
            );
          } else {
              return table.copyWith(
              y: table.y + value,
            );
          }
        }
        return table;
      }).toList(),
    );
  }

  void updateSeatPlaces(int value){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          return table.copyWith(
            seats: table.seats + value,
          );
        }
        return table;
      }).toList(),
    );
  }

  void changeTableName(String name){
    state = state.copyWith(
      tables: state.tables.map((table){
        if(table.id == state.selectedTableId){
          return table.copyWith(
            name: name,
          );
        }
        return table;
      }).toList(),
    );
  }

  void renamePlan(String id, String newName){
    state = state.copyWith(
      plans: state.plans.map((plan) {
        if(plan.id == id){
          return plan.copyWith(
            name: newName
          );
        }
        return plan;
      }).toList(),
    );

    if(!plansToCreate.contains(id) && !plansToUpdate.contains(id)){
      plansToUpdate.add(id);
    }
  }

  void removePlan(String id){
    if(plansToCreate.contains(id)){
      plansToCreate.remove(id);
    } else{
      plansToRemove.add(id);
      if(plansToUpdate.contains(id)){
        plansToUpdate.remove(id);
      }
    }

    state.tables.where((table) => table.plan.id == id).forEach((table) => removeTable(tableId: table.id));

    state = state.copyWith(
      plans: state.plans.where((plan) => plan.id != id).toList(),
    );
  }

  void startEdition(){
    draftPlans = state.plans;
    draftTables = state.tables;
  }

  void cancelEdition(){
    if(state.tableChange){
      cancelEditTable();
    }
    state = state.copyWith(plans: draftPlans, tables: draftTables);
    clearQueue();
  }

  void clearQueue(){
    plansToCreate.clear();
    plansToUpdate.clear();
    plansToRemove.clear();
    tablesToCreate.clear();
    tablesToUpdate.clear();
    tablesToRemove.clear();
  }

  void validateEdition() async {
    List<Plan> plansToCreateObject = [];
    List<Plan> plansToUpdateObject = [];
    for (var plan in state.plans) {
      if(plansToCreate.contains(plan.id)){
        plansToCreateObject.add(plan);
      } else if(plansToUpdate.contains(plan.id)){
        plansToUpdateObject.add(plan);
      }
    }

    if(plansToCreate.isNotEmpty){
      if(plansToCreate.length == 1){
        final savePlanUseCase = ref.read(savePlanUseCaseProvider);
        await savePlanUseCase(plansToCreateObject.first);
      } else {
        final savePlansUseCase = ref.read(savePlansUseCaseProvider);
        await savePlansUseCase(plansToCreateObject);
      }
    }

    if(plansToUpdate.isNotEmpty){
      if(plansToUpdate.length == 1){
        final updatePlanUseCase = ref.read(updatePlanUseCaseProvider);
        await updatePlanUseCase(plansToUpdateObject.first);
      } else {
        final updatePlansUseCase = ref.read(updatePlansUseCaseProvider);
        await updatePlansUseCase(plansToUpdateObject);
      }
    }

    if(plansToRemove.isNotEmpty){
      if(plansToRemove.length == 1){
        final removePlanUseCase = ref.read(removePlanUseCaseProvider);
        await removePlanUseCase(plansToRemove.first);
      } else {
        final removePlansUseCase = ref.read(removePlansUseCaseProvider);
        await removePlansUseCase(plansToRemove);
      }
    }

    List<RestaurantTable> tablesToCreateObject = [];
    List<RestaurantTable> tablesToUpdateObject = [];
    for (var table in state.tables) {
      if(tablesToCreate.contains(table.id)){
        tablesToCreateObject.add(table);
      } else if(tablesToUpdate.contains(table.id)){
        tablesToUpdateObject.add(table);
      }
    }

    if(tablesToCreate.isNotEmpty){
      if(tablesToCreate.length == 1){
        final saveTableUseCase = ref.read(saveTableUseCaseProvider);
        await saveTableUseCase(tablesToCreateObject.first);
      } else {
        final saveTablesUseCase = ref.read(saveTablesUseCaseProvider);
        await saveTablesUseCase(tablesToCreateObject);
      }
    }

    if(tablesToUpdate.isNotEmpty){
      if(tablesToUpdate.length == 1){
        final updateTableUseCase = ref.read(updateTableUseCaseProvider);
        await updateTableUseCase(tablesToUpdateObject.first);
      } else {
        final updateTablesUseCase = ref.read(updateTablesUseCaseProvider);
        await updateTablesUseCase(tablesToUpdateObject);
      }
    }

    if(tablesToRemove.isNotEmpty){
      if(tablesToRemove.length == 1){
        final removeTableUseCase = ref.read(removeTableUseCaseProvider);
        await removeTableUseCase(tablesToRemove.first);
      } else {
        final removeTablesUseCase = ref.read(removeTablesUseCaseProvider);
        await removeTablesUseCase(tablesToRemove);
      }
    }
    clearQueue();
  }

  void changeTableState(TableStatus newStatus) async {
    final updateTableUseCase = ref.read(updateTableUseCaseProvider);
    await updateTableUseCase(state.selectedTable!.copyWith(status: newStatus));
    state = state.copyWith(
      tables: state.tables.map((table) {
        if(table.id == state.selectedTableId){
          return table.copyWith(
                  status: newStatus
                );
        }
        return table;
      }).toList(),
    );
  }

  String getName(bool isTable){
    if(isTable){
      return state.selectedTable!.name;
    } else {
      return state.selectedPlan!.name;
    }
  }

  String getNameById(String tableId){
    return state.tables.where((table) => table.id == tableId).first.name;
  }

  RestaurantTable getTable(String tableId){
    return state.tables.where((table) => table.id == tableId).first;
  }
}