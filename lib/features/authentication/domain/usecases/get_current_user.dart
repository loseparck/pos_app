import 'package:pos_app/features/authentication/data/repositories/auth_repository.dart';

import '../entities/user.dart';

class GetCurrentUser {
  GetCurrentUser(this._repository);

  final AuthRepository _repository;

  Future<User?> call() {
    return _repository.getCurrentUser();
  }
}