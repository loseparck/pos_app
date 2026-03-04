import 'package:pos_app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:pos_app/features/authentication/data/models/user_model.dart';

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  @override
  Future<void> cacheUser(UserModel user) {
    // TODO: implement cacheUser
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCachedUser() {
    // TODO: implement getCachedUser
    throw UnimplementedError();
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