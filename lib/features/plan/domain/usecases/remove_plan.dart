import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';


class RemovePlan {
  RemovePlan(this._repository);

  final PlanRepository _repository;

  Future<void> call(String planId) {
    return _repository.removePlan(planId);
  }
}