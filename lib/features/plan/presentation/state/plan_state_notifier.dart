import 'package:pos_app/features/plan/domain/entities/plan_group_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';
import 'package:pos_app/features/plan/presentation/state/plan_group_state.dart';
import 'package:uuid/uuid.dart';

class PlanGroupNotifier extends StateNotifier<PlanGroupState>{
  List<PlanGroup>? draft;
  RestaurantTable? draftTable;
  double? maxX, maxY;

  PlanGroupNotifier({this.draft, this.draftTable}) : 
  super(
    PlanGroupState(
      groups: [], 
      selectedGroupId: null,
      selectedTableId: null
      )
    );

  final _uuid = const Uuid();

  void addGroup(String name){
    if(state.selectedTableId != null){
      selectTable(state.selectedTableId, true);
    }

    final group = PlanGroup(
      id: _uuid.v4(),
      name: name,
      tables: [],
    );

    final updatedGroups = [...state.groups, group];
    
    state = PlanGroupState(
      groups: updatedGroups, 
      selectedGroupId: group.id,
      selectedTableId: null
    );
  }

  void selectGroup(String groupId){
    selectTable(state.selectedTableId, true);
    state = PlanGroupState(
      groups: state.groups, 
      selectedGroupId: groupId,
      selectedTableId: null
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
      shape: TableShape.circle,
    );

    final updatedGroup = selected.copyWith(tables: [... selected.tables, table]);

    _updateGroup(updatedGroup);
    selectTable(table.id, true);
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
      selectedGroupId: updatedGroup.id,
      selectedTableId: state.selectedTableId
    );
  }

  void enableEditMode(){
    state = state;
  }

  void disableEditMode(){
    state = state;
  }

  void renameTable(String newName, int seats){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                return table.copyWith(name: newName, seats: seats);
              }
              return table;
            }).toList(),
          );
        }
        return group;
      }).toList(),
    );
  }

  void removeTable(){
    state = PlanGroupState(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables
            .where((table) => table.id != state.selectedTableId).toList(),
          );
        }
        return group;
      }).toList(),
      selectedTableId: null,
      selectedGroupId: state.selectedGroupId
    );
  }

  void rotateTable(double value){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id ==state.selectedTableId){
                return table.copyWith(rotation: table.rotation + value);
              }
              return table;
            }).toList(),
          );
        }
        return group;
      }).toList(),
    );
  }

  void toggleShape(TableShape newShape){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                return table.copyWith(
                  shape: newShape,
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

  void scaleHorizentally(double value){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                if(table.width + value < 100){
                  return table.copyWith(
                    width: 100,
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
        return group;
      }).toList(),
    );
  }

  void scaleVertically(double value){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                if(table.height + value < 100){
                  return table.copyWith(
                    height: 100,
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
        return group;
      }).toList(),
    );
  }

  void changePositionX(double value){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
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
        return group;
      }).toList(),
    );
  }

  void changePositionY(double value){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
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
        return group;
      }).toList(),
    );
  }

  void updateSeatPlaces(int value){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                return table.copyWith(
                  seats: table.seats + value,
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

  void changeSeatName(String name){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                return table.copyWith(
                  name: name,
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

  void selectTable(String? id, bool isEditMode){
    if(!isEditMode && state.selectedTableId == id){
      return;
    }
    String? newSelectedId;
    if(state.selectedTableId != id) {
      newSelectedId = id;
    }
    state = PlanGroupState(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == id){
                return table.copyWith(
                  isSelected: newSelectedId != null ? true: false,
                );
              } else {
                 return table.copyWith(
                  isSelected: false,
                );
              }
            }).toList(),
          );
        }
        return group;
      }).toList(),
      selectedGroupId: state.selectedGroupId,
      selectedTableId: newSelectedId
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
     selectTable(state.selectedTableId, true);
  }

  void validateEdition(){
    //save to Database;
    selectTable(state.selectedTableId, true);
  }

  void changeTableState(TableStatus newStatus){
    state = state.copyWith(
      groups: state.groups.map((group) {
        if(group.id == state.selectedGroupId){
          return group.copyWith(
            tables: group.tables.map((table){
              if(table.id == state.selectedTableId){
                return table.copyWith(
                  status: newStatus
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

  String getName(bool isTable){
    if(isTable){
      return state.selectedTable!.name;
    } else {
      return state.selectedGroup!.name;
    }
  }
}