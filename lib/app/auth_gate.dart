import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository_provider.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository_provider.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository_provider.dart';

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
      //return const LoginPage();
    }

    final initState = ref.watch(appInitializationProvider);

    return initState.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),

      error: (e, stack) => Scaffold(
        body: Center(
          child: Text('Erreur: $e'),
        ),
      ),

      data: (_) => child,
    );
  }

}

final appInitializationProvider = FutureProvider<void>((ref) async {
  await ref.read(planProvider.notifier).load();
  await ref.read(ordersProvider.notifier).load();
  await ref.read(productsProvider.notifier).load();
  await ref.read(discountsProvider.notifier).load();
  await ref.read(customersProvider.notifier).load();
  await ref.read(suppliersProvider.notifier).load();
});