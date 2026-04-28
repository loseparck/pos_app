import '../../domain/repositories/token_repository.dart';
import '../datasources/token_local_datasource.dart';

class TokenRepositoryImpl implements TokenRepository {
  TokenRepositoryImpl(this._localDataSource);

  final TokenLocalDataSource _localDataSource;

  @override
  Future<String?> getAccessToken() {
    return _localDataSource.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() {
    return _localDataSource.getRefreshToken();
  }

  @override
  Future<void> saveAccessToken(String token) {
    return _localDataSource.saveAccessToken(token);
  }

  @override
  Future<void> saveRefreshToken(String token) {
    return _localDataSource.saveRefreshToken(token);
  }

  @override
  Future<void> clearTokens() {
    return _localDataSource.clear();
  }
  
  @override
  Future<String?> getTenantId() {
    return _localDataSource.getTenantId();
  }
  
  @override
  Future<void> saveTenantId(String tenantId) {
    return _localDataSource.saveTenantId(tenantId);
  }
}