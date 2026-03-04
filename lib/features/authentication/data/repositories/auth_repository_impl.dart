import 'package:pos_app/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:pos_app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:pos_app/features/authentication/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> login(String email, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
}

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDatasource remote;
  final AuthLocalDatasource local;

  AuthRepositoryImpl(this.remote, this.local);

  @override
  Future<User?> getCurrentUser() async{
    final token = await local.getToken();

    if(token == null) return null;
    return local.getCachedUser();
  }

  @override
  Future<User?> login(String email, String password) async{
    final data = await remote.login(email, password);
    if(data != null){
      final token = data['token'];
      await local.saveToken(token);

      return User(
        id: data['user']['id'], 
        name: data['user']['name'], 
        email: data['user']['email'], 
        role: data['user']['role']
        );
    }
    return null;
  }

  @override
  Future<void> logout() async{
    local.clear();
  }
}