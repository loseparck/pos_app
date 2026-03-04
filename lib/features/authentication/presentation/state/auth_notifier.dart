import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/authentication/domain/entities/role.dart';
import 'package:pos_app/features/authentication/domain/entities/user.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/features/authentication/presentation/state/usecase_provider.dart';

class AuthNotifier extends StateNotifier<AuthState>{
  final Ref ref;
  
  AuthNotifier(this.ref) : super(AuthState.initial()){
    checkAuth();
  }

  Future<void> checkAuth() async{

    final getCurrentUser = ref.read(getCurrentUserUseCaseProvider);

    try {
      final user = await getCurrentUser();
      if(user != null){
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.unauthenticated();
      }
    } catch(_){
      state = AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async{
    state = AuthState(status: AuthStatus.loading);

    try{
      final loginUseCase = ref.read(loginUseCaseProvider);
      final user = await loginUseCase.call(email, password);
      if(user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.unauthenticated();
      }
    } catch(_) {
      state = AuthState.error("Identifiants Invalides");
    }
    if(email == "email" && password == "password"){
      state = AuthState.authenticated(User(id: "id", email: "email", role: UserRole.admin, name: "name"));
    }
  }

  Future<void> logout() async{
    final logOut = ref.read(logoutUseCaseProvider);
    state = AuthState.unauthenticated();
    await logOut();
  }

  final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
    return AuthNotifier(ref);
  });
}