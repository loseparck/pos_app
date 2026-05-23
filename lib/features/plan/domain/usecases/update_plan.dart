import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';


class UpdatePlan {
  UpdatePlan(this._repository);

  final PlanRepository _repository;

  Future<Plan> call(Plan plan) {
    return _repository.updatPlan(plan);
  }
}