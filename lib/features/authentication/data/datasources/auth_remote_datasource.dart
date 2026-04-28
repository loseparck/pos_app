import '../../domain/entities/user.dart';

class LoginResponse {
  final User user;
  final String accessToken;
  final String refreshToken;
  final String tenantId;

  LoginResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.tenantId,
  });
}

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
}