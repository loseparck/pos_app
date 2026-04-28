import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/presentation/state/plan_group_state.dart';
import 'package:pos_app/features/plan/presentation/state/plan_state_notifier.dart';

final planGroupProvider = StateNotifierProvider<PlanGroupNotifier, PlanGroupState>((ref) => PlanGroupNotifier());
