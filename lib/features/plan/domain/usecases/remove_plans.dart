import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';


class RemovePlans {
  RemovePlans(this._repository);

  final PlanRepository _repository;

  Future<void> call(List<String> planIds) {
    return _repository.removePlans(planIds);
  }
}