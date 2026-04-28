import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/user.dart';
import 'auth_local_datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._storage);

  final FlutterSecureStorage _storage;

  static const String _userKey = 'auth_user';

  @override
  Future<void> cacheUser(User user) async {
    await _storage.write(
      key: _userKey,
      value: jsonEncode({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'role': user.role,
      }),
    );
  }

  @override
  Future<User?> getCachedUser() async {
    final raw = await _storage.read(key: _userKey);
    if (raw == null || raw.isEmpty) return null;

    final json = jsonDecode(raw) as Map<String, dynamic>;

    return User(
      id: json['id'].toString(),
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _userKey);
  }
  
  @override
  Future<String?> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }
  
  @override
  Future<void> saveToken(String token) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }
}