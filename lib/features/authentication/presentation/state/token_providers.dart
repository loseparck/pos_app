import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/repositories/token_repository.dart';
import '../../data/datasources/token_local_datasource.dart';
import '../../data/repositories/token_repository_impl.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final tokenLocalDataSourceProvider = Provider<TokenLocalDataSource>((ref) {
  return TokenLocalDataSourceImpl(
    ref.read(secureStorageProvider),
  );
});

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepositoryImpl(
    ref.read(tokenLocalDataSourceProvider),
  );
});