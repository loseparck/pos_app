import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_notifier.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/features/orders/data/repositories/product_repository.dart';
import 'package:pos_app/features/orders/domain/entities/product.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

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

    final repo = ref.read(productRepositoryProvider);

    return repo.searchProducts(query);
  },
);

final productRepositoryProvider =
Provider((ref) => ProductRepository());

final productSearchQueryProvider =
StateProvider<String>((ref) => "");