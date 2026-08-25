import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/presentation/pages/plan_view.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);
final moreActionProvider = StateProvider<bool>((ref) => false);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          PlanView(),
        ],
      ),
    );
  }
}