import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/catalog/application/product_notifier.dart';
import 'package:pos_app/features/catalog/application/product_state.dart';
import 'package:pos_app/features/catalog/data/datasources/product_local_datasource.dart';
import 'package:pos_app/features/catalog/data/datasources/product_local_datasource_impl.dart';
import 'package:pos_app/features/catalog/data/datasources/product_remote_datasource.dart';
import 'package:pos_app/features/catalog/data/datasources/product_remote_datasource_impl.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_impl.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';

final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSourceImpl(
    ref.read(dioProvider),
  );
});

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>((ref) {
  if (kIsWeb) {
     return ProductLocalDataSourceImpl(
      null
    );
  }

  //return ProductRepositoryDrift(db);
  return ProductLocalDataSourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    ref.read(productRemoteDataSourceProvider),
    ref.read(productLocalDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final productsProvider = StateNotifierProvider<ProductNotifier, ProductState>( (ref) {
  return ProductNotifier(ref, ref.read(productRepositoryProvider));
} );