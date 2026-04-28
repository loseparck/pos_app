import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenLocalDataSource {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getTenantId();

  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<void> saveTenantId(String tenantId);

  Future<void> clear();
}

class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  TokenLocalDataSourceImpl(this._storage);

  final FlutterSecureStorage _storage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tenantIdKey = 'x-tenant-id';

  @override
  Future<String?> getAccessToken() {
    return _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() {
    return _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) {
    return _storage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<void> saveRefreshToken(String token) {
    return _storage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
  
  @override
  Future<String?> getTenantId() {
    return _storage.read(key: _tenantIdKey);
  }
  
  @override
  Future<void> saveTenantId(String tenantId) {
    return _storage.write(key: _tenantIdKey, value: tenantId);
  }
}