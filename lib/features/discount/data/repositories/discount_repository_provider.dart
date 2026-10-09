import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/discount/application/discount_notifier.dart';
import 'package:pos_app/features/discount/application/discount_state.dart';
import 'package:pos_app/features/discount/data/datasources/discount_local_datasource.dart';
import 'package:pos_app/features/discount/data/datasources/discount_local_datasource_impl.dart';
import 'package:pos_app/features/discount/data/datasources/discount_remote_datasource.dart';
import 'package:pos_app/features/discount/data/datasources/discount_remote_datasource_impl.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository_impl.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';

final discountRemoteDataSourceProvider = Provider<DiscountRemoteDatasource>((ref) {
  return DiscountRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final discountLocalDataSourceProvider = Provider<DiscountLocalDatasource>((ref) {
  if (kIsWeb) {
     return DiscountLocalDatasourceImpl(
      null
    );
  }

  return DiscountLocalDatasourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final  discountRepositoryProvider = Provider<DiscountRepository>((ref) {
  return DiscountRepositoryImpl(
    ref.read(discountRemoteDataSourceProvider),
    ref.read(discountLocalDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final discountsProvider = StateNotifierProvider<DiscountNotifier, DiscountState>( (ref) {
  return DiscountNotifier(ref, ref.read(discountRepositoryProvider));
} );