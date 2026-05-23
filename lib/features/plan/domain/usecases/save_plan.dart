import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';


class SavePlan {
  SavePlan(this._repository);

  final PlanRepository _repository;

  Future<Plan> call(Plan plan) {
    return _repository.savePlan(plan);
  }
}