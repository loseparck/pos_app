import 'package:pos_app/features/authentication/data/models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getCachedUser();
  Future<void> clear();
  Future<void> saveToken(String token);
  Future<String?> getToken();

}