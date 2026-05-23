import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';


class SaveTable {
  SaveTable(this._repository);

  final PlanRepository _repository;

  Future<RestaurantTable> call(RestaurantTable table) {
    return _repository.saveTable(table);
  }
}