import 'package:pos_app/features/authentication/data/repositories/auth_repository.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/token_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._tokenRepository,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final TokenRepository _tokenRepository;

  @override
  Future<User> login(String email, String password) async {
    final response = await _remoteDataSource.login(email, password);
    
    await _tokenRepository.saveAccessToken(response.accessToken);
    await _tokenRepository.saveRefreshToken(response.refreshToken);
    await _tokenRepository.saveTenantId(response.tenantId);
    await _localDataSource.cacheUser(response.user);
    
    return response.user;
  }

  @override
  Future<void> logout() async {
    await _tokenRepository.clearTokens();
    await _localDataSource.clear();
  }

  @override
  Future<User?> getCurrentUser() async {
    final accessToken = await _tokenRepository.getAccessToken();
    final refreshToken = await _tokenRepository.getRefreshToken();

    if ((accessToken == null || accessToken.isEmpty) &&
        (refreshToken == null || refreshToken.isEmpty)) {
      return null;
    }

    return _localDataSource.getCachedUser();
  }
}