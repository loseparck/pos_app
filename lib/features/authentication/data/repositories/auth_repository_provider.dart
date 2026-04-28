import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pos_app/core/network/dio_provider.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_local_datasource_impl.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:pos_app/features/authentication/data/repositories/auth_repository.dart';

import '../../domain/repositories/token_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../repositories/auth_repository_impl.dart';
import '../repositories/token_repository_impl.dart';
import '../datasources/token_local_datasource.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    ref.read(dioProvider),
  );
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl(
    ref.read(secureStorageProvider),
  );
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

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    ref.read(authLocalDataSourceProvider),
    ref.read(tokenRepositoryProvider),
  );
});