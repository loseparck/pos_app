import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

abstract class PlanLocalDataSource {
  /// ***** Save *******
  Future<Plan?> savePlan(Plan plan);
  Future<List<Plan>> savePlans(List<Plan> plan);

  Future<RestaurantTable?> saveTable(RestaurantTable table);
  Future<List<RestaurantTable>> saveTables(List<RestaurantTable> tables);

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
  Future<Plan?> updatPlan(Plan plan);
  Future<List<Plan>> updatPlans(List<Plan> plans);
  Future<RestaurantTable?> updateTable(RestaurantTable table);
  Future<List<RestaurantTable>> updateTables(List<RestaurantTable> tables);
}