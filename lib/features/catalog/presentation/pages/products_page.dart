import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/catalog/presentation/widgets/option_view.dart';
import 'package:pos_app/features/catalog/presentation/widgets/product_view.dart';
final selectedTabProvider = StateProvider<int>((ref) => 0);
class ProductsPage extends ConsumerWidget{ 
  const ProductsPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTabProvider);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color:  Colors.grey.shade200,
            child: Row(
              children: [
                _buildNavButton(ref, 0, "Produits"),
                _buildNavButton(ref, 1, "Options"),

              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                ProductView(),
                OptionView(),
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