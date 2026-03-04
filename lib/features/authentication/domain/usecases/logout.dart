import 'package:pos_app/features/authentication/data/repositories/auth_repository_impl.dart';

class Logout{
  final AuthRepository repository;

  Logout(this.repository);

  Future<void> call(){
    return repository.logout();
  }
}