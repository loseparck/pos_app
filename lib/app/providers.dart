import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_notifier.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/features/orders/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/core/network/dio_provider.dart';

final connectivityProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService(
    Connectivity(),
    ref.read(dioProvider)
  );
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState> ((ref) => AuthNotifier(ref));



final productSearchProvider =
FutureProvider.family<List<Product>, String>(
  (ref, query) async {

    final repo = ref.read(productRepositoryProviderO);

    return repo.searchProducts(query);
  },
);

final productRepositoryProviderO =
Provider((ref) => ProductRepository());

final productSearchQueryProvider =
StateProvider<String>((ref) => "");

/*final isarInstanceProvider = Provider<Isar>((ref) {
  throw UnimplementedError(
    'Isar doit être initialisé dans main.dart avec overrideWithValue',
  );
});*/

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final connectivityServiceProvider =
    Provider<ConnectivityService>((ref) {
  return ConnectivityService(
    Connectivity(),
    ref.read(dioProvider)
  );
});
