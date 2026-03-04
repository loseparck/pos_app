import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_local_datasource_impl.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:pos_app/features/authentication/data/repositories/auth_repository_impl.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRemoteDatasourceImpl(dio);
});

final authLocalDataSourceProvider = Provider<AuthLocalDatasource>((ref) {
  return AuthLocalDatasourceImpl();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    ref.read(authLocalDataSourceProvider),
  );
});