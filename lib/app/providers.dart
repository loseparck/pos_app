import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/data/local/db/app_database.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_notifier.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:flutter/foundation.dart';

final connectivityProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService(
    Connectivity(),
    ref.read(dioProvider)
  );
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState> ((ref) => AuthNotifier(ref));


final productSearchQueryProvider =StateProvider<String>((ref) => "");


final appDatabaseProvider = Provider<AppDatabase?>((ref) {
  if (kIsWeb) {
    return null;
  }

  final db = AppDatabase();

  ref.onDispose(() {
    db.close();
  });

  return db;
  //return AppDatabase();
});

final connectivityServiceProvider =
    Provider<ConnectivityService>((ref) {
  return ConnectivityService(
    Connectivity(),
    ref.read(dioProvider)
  );
});
