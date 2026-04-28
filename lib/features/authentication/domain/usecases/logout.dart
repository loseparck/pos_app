import 'package:pos_app/features/authentication/data/repositories/auth_repository.dart';

class Logout {
  Logout(this._repository);

  final AuthRepository _repository;

  Future<void> call() {
    return _repository.logout();
  }
}