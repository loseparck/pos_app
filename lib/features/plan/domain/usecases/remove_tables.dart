import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';


class RemoveTables {
  RemoveTables(this._repository);

  final PlanRepository _repository;

  Future<void> call(List<String> tableIds) {
    return _repository.removeTables(tableIds);
  }
}