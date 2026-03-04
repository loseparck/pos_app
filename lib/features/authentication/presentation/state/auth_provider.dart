import 'package:pos_app/features/authentication/domain/entities/user.dart';

enum AuthStatus{
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthState{
  final AuthStatus status;
  final User? user;
  final String? message;

  AuthState({
    required this.status,
    this.user,
    this.message,
  });

  factory AuthState.initial() => AuthState(status: AuthStatus.initial);

  factory AuthState.authenticated(User user) => AuthState(status: AuthStatus.authenticated, user: user);

  factory AuthState.unauthenticated() => AuthState(status: AuthStatus.unauthenticated);

  factory AuthState.error(String message) => AuthState(status: AuthStatus.error, message: message);


}
