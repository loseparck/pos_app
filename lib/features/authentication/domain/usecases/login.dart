import 'package:pos_app/features/authentication/data/repositories/auth_repository.dart';

import '../entities/user.dart';

class Login {
  Login(this._repository);

  final AuthRepository _repository;

  Future<User> call(String email, String password) {
    return _repository.login(email, password);
  }
}