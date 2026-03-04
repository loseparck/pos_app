import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/authentication/domain/usecases/login.dart';
import 'package:pos_app/features/authentication/domain/usecases/logout.dart';
import 'package:pos_app/features/authentication/domain/usecases/get_current_user.dart';
import 'package:pos_app/features/authentication/data/repositories/auth_repository_provider.dart';

final loginUseCaseProvider = Provider<Login>((ref) {
  return Login(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<Logout>((ref) {
  return Logout(ref.read(authRepositoryProvider));
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUser>((ref) {
  return GetCurrentUser(ref.read(authRepositoryProvider));
});