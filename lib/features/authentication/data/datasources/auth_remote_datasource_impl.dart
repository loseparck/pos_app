import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final data = response.data['data'] as Map<String, dynamic>;

    final userJson = data['user'] as Map<String, dynamic>;

    final user = User(
      id: userJson['id'].toString(),
      name: userJson['fullName'] as String,
      email: userJson['email'] as String,
      role: userJson['roles'][0] as String,
    );

    return LoginResponse(
      user: user,
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String,
      tenantId: data['user']['tenantId'] as String,
    );
  }
}