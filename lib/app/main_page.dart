import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/app/providers.dart';
import 'package:pos_app/features/plan/presentation/pages/plan_view.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget{

  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authState = ref.watch(authProvider);
    final selectedIndex = ref.watch(selectedTabProvider);
   // final user = authState.user;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color:  Colors.grey.shade200,
            child: Row(
              children: [
                _buildNavButton(ref, 0, "Dashboard"),
                _buildNavButton(ref, 1, "Plan"),
                _buildNavButton(ref, 2, "Stock"),
                _buildNavButton(ref, 3, "Rapports"),

                const Spacer(),

                IconButton(
                  onPressed: (){
                    ref.read(authProvider.notifier).logout();
                  }, 
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                DashBoardView(),
                PlanView(),
                InventoryView(),
                ReportsView(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavButton(
    WidgetRef ref, int index, String label ){
    final selectedIndex = ref.watch(selectedTabProvider);

    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: (){
          ref.read(selectedTabProvider.notifier).state = index;
        }, 
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
        ),
        child: Text(label),
      ),
    );
  }
  
}

class DashBoardView extends StatelessWidget{
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Dashboard"));
  }
}

class SalesView extends StatelessWidget{
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SalesView"));
  }
}
class InventoryView extends StatelessWidget{
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("InventoryView"));
  }
}
class ReportsView extends StatelessWidget{
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("ReportsView"));
  }
}