import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';


class UpdatePlans {
  UpdatePlans(this._repository);

  final PlanRepository _repository;

  Future<List<Plan>> call(List<Plan> plans) {
    return _repository.updatPlans(plans);
  }
}