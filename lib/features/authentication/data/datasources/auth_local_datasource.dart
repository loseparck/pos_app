import '../../domain/entities/user.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(User user);
  Future<User?> getCachedUser();
  Future<void> clear();
  Future<void> saveToken(String token);
  Future<String?> getToken();
}