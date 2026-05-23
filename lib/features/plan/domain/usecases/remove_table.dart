import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';


class RemoveTable {
  RemoveTable(this._repository);

  final PlanRepository _repository;

  Future<void> call(String tableId) {
    return _repository.removeTable(tableId);
  }
}