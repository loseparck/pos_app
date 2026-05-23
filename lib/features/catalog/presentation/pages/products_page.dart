import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/presentation/widgets/option_view.dart';
import 'package:pos_app/features/catalog/presentation/widgets/product_view.dart';
final selectedTabProvider = StateProvider<int>((ref) => 0);
class ProductsPage extends StatefulWidget{ 
    const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color:  Colors.grey.shade200,
            child: Row(
              children: [
                _buildNavButton(0, "Produits"),
                _buildNavButton(1, "Options"),

              ],
            ),
          ),
          Expanded(
            child: selectedIndex == 0
                ? const ProductView()
                : const OptionView(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
    int index, String label ){
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: (){
          setState(() {
            selectedIndex = index;
          });
        }, 
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
        ),
        child: Text(label),
      ),
    );
  }

}