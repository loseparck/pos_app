import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:pos_app/features/payments/application/payments_notifier.dart';
import 'package:pos_app/features/payments/application/payments_state.dart';
import 'package:pos_app/features/payments/data/datasources/payment_local_datasource.dart';
import 'package:pos_app/features/payments/data/datasources/payment_local_datasource_impl.dart';
import 'package:pos_app/features/payments/data/datasources/payment_remote_datasource.dart';
import 'package:pos_app/features/payments/data/datasources/payment_remote_datasource_impl.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository_impl.dart';

final paymentRemoteDataSourceProvider = Provider<PaymentRemoteDatasource>((ref) {
  return PaymentRemoteDatasourceImpl(
    ref.read(dioProvider),
  );
});

final paymentLocalDataSourceProvider = Provider<PaymentLocalDatasource>((ref) {
  if (kIsWeb) {
     return PaymentLocalDatasourceImpl(
      null
    );
  }

  return PaymentLocalDatasourceImpl(
    ref.watch(appDatabaseProvider)
  );
});

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepositoryImpl(
    ref.read(paymentLocalDataSourceProvider),
    ref.read(paymentRemoteDataSourceProvider),
    ConnectivityService(
      Connectivity(),
      ref.read(dioProvider)
    )
  );
});

final paymentsProvider = StateNotifierProvider<PaymentsNotifier, PaymentsState>( (ref) {
  return PaymentsNotifier(ref, ref.read(paymentRepositoryProvider));
} );

class CheckedItemsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {};
  }

  void add(String item) {
    state = {...state, item};
  }

  void remove(String item) {
    state = {...state}..remove(item);
  }

  void clear(m) {
    state = {};
  }

  bool contains(String item){
    return state.where((e) => e != item).isNotEmpty;
  }
}