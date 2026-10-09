import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_app/features/supplier/application/supplier_notifier.dart';
import 'package:pos_app/features/supplier/application/supplier_state.dart';
import 'package:pos_app/features/supplier/data/datasources/supplier_local_datasource.dart';
import 'package:pos_app/features/supplier/data/datasources/supplier_local_datasource_impl.dart';
import 'package:pos_app/features/supplier/data/datasources/supplier_remote_datasource.dart';
import 'package:pos_app/features/supplier/data/datasources/supplier_remote_datasource_impl.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository_impl.dart';

final supplierRemoteDataSourceProvider = Provider<SupplierRemoteDatasource>((ref) {
  return SupplierRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final supplierLocalDataSourceProvider = Provider<SupplierLocalDatasource>((ref) {
  if (kIsWeb) {
     return SupplierLocalDatasourceImpl(
      null
    );
  }

  return SupplierLocalDatasourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final  supplierRepositoryProvider = Provider<SupplierRepository>((ref) {
  return SupplierRepositoryImpl(
    ref.read(supplierRemoteDataSourceProvider),
    ref.read(supplierLocalDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final suppliersProvider = StateNotifierProvider<SupplierNotifier, SupplierState>( (ref) {
  return SupplierNotifier(ref, ref.read(supplierRepositoryProvider));
} );