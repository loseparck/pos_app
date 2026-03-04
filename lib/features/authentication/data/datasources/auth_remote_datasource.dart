abstract class AuthRemoteDatasource {
  Future<Map<String, dynamic>?> login(String email, String password);
}