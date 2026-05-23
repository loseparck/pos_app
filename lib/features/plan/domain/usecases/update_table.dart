import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';


class UpdateTable {
  UpdateTable(this._repository);

  final PlanRepository _repository;

  Future<RestaurantTable> call(RestaurantTable table) {
    return _repository.updateTable(table);
  }
}