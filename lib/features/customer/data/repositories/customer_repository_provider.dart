import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_app/features/customer/application/customer_notifier.dart';
import 'package:pos_app/features/customer/application/customer_state.dart';
import 'package:pos_app/features/customer/data/datasources/customer_local_datasource.dart';
import 'package:pos_app/features/customer/data/datasources/customer_local_datasource_impl.dart';
import 'package:pos_app/features/customer/data/datasources/customer_remote_datasource.dart';
import 'package:pos_app/features/customer/data/datasources/customer_remote_datasource_impl.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository_impl.dart';

final customerRemoteDataSourceProvider = Provider<CustomerRemoteDatasource>((ref) {
  return CustomerRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final customerLocalDataSourceProvider = Provider<CustomerLocalDatasource>((ref) {
  if (kIsWeb) {
     return CustomerLocalDatasourceImpl(
      null
    );
  }

  return CustomerLocalDatasourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final  customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepositoryImpl(
    ref.read(customerRemoteDataSourceProvider),
    ref.read(customerLocalDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final customersProvider = StateNotifierProvider<CustomerNotifier, CustomerState>( (ref) {
  return CustomerNotifier(ref, ref.read(customerRepositoryProvider));
} );