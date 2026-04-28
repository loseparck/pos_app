import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/features/authentication/presentation/state/usecase_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(AuthState.initial()) {
    _checkAuthOnStartup();
  }

  final Ref ref;

  Future<void> _checkAuthOnStartup() async {
    try {
      final getCurrentUser = ref.read(getCurrentUserUseCaseProvider);
      final user = await getCurrentUser();

      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.unauthenticated();
      }
    } catch (_) {
      state = AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthState.loading();

    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      final user = await loginUseCase(email, password);
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(
        'Email ou mot de passe incorrect',
      );
    }
  }

  Future<void> logout() async {
    try {
      final logoutUseCase = ref.read(logoutUseCaseProvider);
      await logoutUseCase();
    } finally {
      state = AuthState.unauthenticated();
    }
  }

  Future<void> forceLogout() async {
    try {
      final logoutUseCase = ref.read(logoutUseCaseProvider);
      await logoutUseCase();
    } catch (_) {
      // On ignore les erreurs ici car l'objectif principal
      // est de forcer le retour à l'état déconnecté.
    } finally {
      state = AuthState.unauthenticated();
    }
  }

  Future<void> refreshUserFromCache() async {
    try {
      final getCurrentUser = ref.read(getCurrentUserUseCaseProvider);
      final user = await getCurrentUser();

      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.unauthenticated();
      }
    } catch (_) {
      state = AuthState.unauthenticated();
    }
  }

  void clearError() {
    if (state.status == AuthStatus.error) {
      state = AuthState.unauthenticated();
    }
  }
}