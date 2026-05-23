import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/usecases/remove_plan.dart';
import 'package:pos_app/features/plan/domain/usecases/remove_plans.dart';
import 'package:pos_app/features/plan/domain/usecases/remove_table.dart';
import 'package:pos_app/features/plan/domain/usecases/remove_tables.dart';
import 'package:pos_app/features/plan/domain/usecases/save_plan.dart';
import 'package:pos_app/features/plan/domain/usecases/save_plans.dart';
import 'package:pos_app/features/plan/domain/usecases/save_table.dart';
import 'package:pos_app/features/plan/domain/usecases/save_tables.dart';
import 'package:pos_app/features/plan/domain/usecases/update_plan.dart';
import 'package:pos_app/features/plan/domain/usecases/update_plans.dart';
import 'package:pos_app/features/plan/domain/usecases/update_table.dart';
import 'package:pos_app/features/plan/domain/usecases/update_tables.dart';

final savePlanUseCaseProvider = Provider<SavePlan>((ref) {
  return SavePlan(ref.read(planRepositoryProvider));
});

final savePlansUseCaseProvider = Provider<SavePlans>((ref) {
  return SavePlans(ref.read(planRepositoryProvider));
});

final saveTableUseCaseProvider = Provider<SaveTable>((ref) {
  return SaveTable(ref.read(planRepositoryProvider));
});

final saveTablesUseCaseProvider = Provider<SaveTables>((ref) {
  return SaveTables(ref.read(planRepositoryProvider));
});

final updatePlanUseCaseProvider = Provider<UpdatePlan>((ref) {
  return UpdatePlan(ref.read(planRepositoryProvider));
});

final updatePlansUseCaseProvider = Provider<UpdatePlans>((ref) {
  return UpdatePlans(ref.read(planRepositoryProvider));
});

final updateTableUseCaseProvider = Provider<UpdateTable>((ref) {
  return UpdateTable(ref.read(planRepositoryProvider));
});

final updateTablesUseCaseProvider = Provider<UpdateTables>((ref) {
  return UpdateTables(ref.read(planRepositoryProvider));
});

final removePlanUseCaseProvider = Provider<RemovePlan>((ref) {
  return RemovePlan(ref.read(planRepositoryProvider));
});

final removePlansUseCaseProvider = Provider<RemovePlans>((ref) {
  return RemovePlans(ref.read(planRepositoryProvider));
});

final removeTablesUseCaseProvider = Provider<RemoveTables>((ref) {
  return RemoveTables(ref.read(planRepositoryProvider));
});

final removeTableUseCaseProvider = Provider<RemoveTable>((ref) {
  return RemoveTable(ref.read(planRepositoryProvider));
});

