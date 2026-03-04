import 'package:pos_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:pos_app/features/authentication/domain/entities/user.dart';

class Login{
  final AuthRepository repository;

  Login(this.repository);

  Future<User?> call(String email, String password){
    return repository.login(email, password);
  }
}