import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/application/orders_state.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource.dart';
import 'package:pos_app/features/orders/data/datasources/order_local_datasource_impl.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:pos_app/features/orders/data/datasources/order_remote_datasource_impl.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_impl.dart';

final orderRemoteDataSourceProvider = Provider<OrderRemoteDatasource>((ref) {
  return OrderRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final orderLocalDataSourceProvider = Provider<OrderLocalDatasource>((ref) {
  if (kIsWeb) {
     return OrderLocalDatasourceImpl(
      null
    );
  }

  //return ProductRepositoryDrift(db);
  return OrderLocalDatasourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(
    ref.read(orderLocalDataSourceProvider),
    ref.read(orderRemoteDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final ordersProvider = StateNotifierProvider<OrdersNotifier, OrdersState>( (ref) {
  return OrdersNotifier(ref, ref.read(orderRepositoryProvider));
} );