import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource{
  final Dio client;

  AuthRemoteDatasourceImpl(this.client);

  @override
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await client.post(ApiEndpoints.login, data: {
      "email": email,
      "password": password,
    });
    if(response.statusCode == 200){
      return response.data;
    } else {
      return null;
    }
  }
}