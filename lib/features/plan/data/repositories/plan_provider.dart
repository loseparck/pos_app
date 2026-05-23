import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/plan/application/plan_state.dart';
import 'package:pos_app/features/plan/application/plan_notifier.dart';
import 'package:pos_app/features/plan/data/datasources/plan_local_datasource.dart';
import 'package:pos_app/features/plan/data/datasources/plan_local_datasource_impl.dart';
import 'package:pos_app/features/plan/data/datasources/plan_remote_datasource_impl.dart';
import 'package:pos_app/features/plan/data/repositories/plan_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pos_app/features/plan/data/repositories/plan_repository_impl.dart';

final planRemoteDataSourceProvider = Provider<PlanRemoteDatasourceImpl>((ref) {
  return PlanRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final planLocalDataSourceProvider = Provider<PlanLocalDataSource>((ref) {
  if (kIsWeb) {
     return PlanLocalDataSourceImpl(
      null
    );
  }

  return PlanLocalDataSourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final planRepositoryProvider = Provider<PlanRepository>((ref) {
  return PlanRepositoryImpl(
    ref.read(planRemoteDataSourceProvider),
    ref.read(planLocalDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final planProvider = StateNotifierProvider<PlanGroupNotifier, PlanGroupState>( (ref) {
  return PlanGroupNotifier(ref, ref.read(planRepositoryProvider));
} );
