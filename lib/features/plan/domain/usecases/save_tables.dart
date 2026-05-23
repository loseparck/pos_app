import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';


class SaveTables {
  SaveTables(this._repository);

  final PlanRepository _repository;

  Future<List<RestaurantTable>> call(List<RestaurantTable> tables) {
    return _repository.saveTables(tables);
  }
}