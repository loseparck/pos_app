import 'package:pos_app/features/plan/data/models/dto/create_plan_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/create_restaurant_table_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/update_plan_dto.dart';
import 'package:pos_app/features/plan/data/models/dto/update_restaurant_table_dto.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

abstract class PlanRemoteDatasource {
    /// ***** Save *******
  Future<Plan> savePlan(CreatePlanDto plan);
  Future<List<Plan>> savePlans(List<CreatePlanDto> plan);

  Future<RestaurantTable> saveTable(CreateRestaurantTableDto option);
  Future<List<RestaurantTable>> saveTables(List<CreateRestaurantTableDto> option);

  /// ***** Retrieve *******
  Future<List<Plan>> getPlans();
  Future<Plan?> getPlan(String planId);
  Future<List<Plan>> getPlansByIds(List<String> planId);

  Future<List<RestaurantTable>> getTables();
  Future<RestaurantTable?> getTable(String id);
  Future<List<RestaurantTable>> getTablesByIds(List<String> tableIds);
  Future<List<RestaurantTable>> getTablesByPlan(String planId);

  /// ***** Remove *******
  Future<void> removeTable(String tableId);
  Future<void> removeTables(List<String> tableIds);
  Future<void> removePlan(String planId);
  Future<void> removePlans(List<String> planIds);

  /// ***** Update *******
  Future<Plan> updatPlan(UpdatePlanDto plan);
  Future<List<Plan>> updatPlans(List<UpdatePlanDto> plans);
  Future<RestaurantTable> updateTable(UpdateRestaurantTableDto table);
  Future<List<RestaurantTable>> updateTables(List<UpdateRestaurantTableDto> tables);
}