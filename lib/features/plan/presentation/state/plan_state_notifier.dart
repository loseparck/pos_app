import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/plan/domain/entities/plan_group_entity.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';
import 'package:pos_app/features/plan/presentation/state/plan_group_state.dart';
import 'package:uuid/uuid.dart';

class PlanGroupNotifier extends StateNotifier<PlanGroupState>{
  List<PlanGroup>? draft;

  PlanGroupNotifier({this.draft}) : 
  super(
    PlanGroupState(
      groups: [], 
      selectedGroupId: null
      )
    );


  final _uuid = const Uuid();

  void addGroup(String name){
    final group = PlanGroup(
      id: _uuid.v4(),
      name: name,
      tables: [],
    );

    final updatedGroups = [...state.groups, group];

    state = PlanGroupState(
      groups: updatedGroups, 
      selectedGroupId: group.id
    );
  }

  void selectGroup(String groupId){
    state = PlanGroupState(
      groups: state.groups, 
      selectedGroupId: groupId,
    );
  }

  void addTable(String name, int seats){
    final selected = state.selectedGroup;
    if(selected == null) return;

    final table = RestaurantTable(
      id: _uuid.v4(), 
      name: name, 
      x: 100, 
      y: 100,
      seats: seats,
      status: "available",
      shape: TableShape.round
    );

    final updatedGroup = selected.copyWith(tables: [... selected.tables, table]);

    _updateGroup(updatedGroup);
  }

  void updateTablePosition(String tableId, double x, double y){
    final selected = state.selectedGroup;
     if(selected == null) return;

     final updatedTable = selected.tables.map((t) => t.id == tableId ? t.copyWith(x: x, y: y) : t).toList();

     final updatedGroup = selected.copyWith(tables: updatedTable);

     _updateGroup(updatedGroup);

  }

  void _updateGroup(PlanGroup updatedGroup){
    final updatedGroups = state.groups
      .map((g) => g.id == updatedGroup.id ? updatedGroup : g).toList();
    
    state = PlanGroupState(
      groups: updatedGroups, 
      selectedGroupId: updatedGroup.id
    );
  }

  void enableEditMode(){
    state = state;
  }

  void disableEditMode(){
    state = state;
  }

  void renameTable(String id, String newName, int seats){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == id){
                return table.copyWith(name: newName, seats: seats);
              }
              return table;
            }).toList(),
          );
        }
        return group;
      }).toList(),
    );
    print("jesuis ici - ${state.groups}");
  }

  void removeTable(String id){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables
            .where((table) => table.id != id).toList(),
          );
        }
        return group;
      }).toList(),
    );
  }

  void rotateTable(String id){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == id){
                return table.copyWith(roration: table.roration + 0.25);
              }
              return table;
            }).toList(),
          );
        }
        return group;
      }).toList(),
    );
  }

  void toggleShape(String id){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == id){
                return table.copyWith(
                  shape: table.shape == TableShape.square
                  ? TableShape.round
                  : TableShape.square,
                );
              }
              return table;
            }).toList(),
          );
        }
        return group;
      }).toList(),
    );
  }

   void selectTable(String id){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == id){
                return table.copyWith(
                  isSelected: table.id == id,
                );
              }
              return table;
            }).toList(),
          );
        }
        return group;
      }).toList(),
    );
  }

  void renameGroup(String id, String newName){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == id){
          return group.copyWith(
            name: newName
          );
        }
        return group;
      }).toList(),
    );
  }

  void removeGroup(String id){
    state = state.copyWith(
      groups: state.groups.where((group) => group.id != id).toList(),
    );
  }

  void startEdition(){
    draft = state.groups;
  }

  void cancelEdition(){
     state = state.copyWith(groups: draft);
  }

  void validateEdition(){
    //draft = state.groups;
    //save to Database;
  }
}