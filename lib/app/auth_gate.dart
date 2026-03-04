import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/authentication/presentation/pages/login_page.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';

class AuthGate extends ConsumerWidget{
  final Widget child;

  const AuthGate({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if(authState.status == AuthStatus.initial ||
      authState.status == AuthStatus.loading
    ) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if(authState.status != AuthStatus.authenticated){
      return const LoginPage();
    }

    return child;
  }

}