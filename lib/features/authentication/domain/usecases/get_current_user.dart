import 'package:pos_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:pos_app/features/authentication/domain/entities/user.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Future<User?> call(){
    return repository.getCurrentUser();
  }

}