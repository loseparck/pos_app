import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/pages/products_page.dart';

class Management extends StatefulWidget {
  const Management({super.key});

  @override
  State<Management> createState() => _GestionPageState();
}

class _GestionPageState extends State<Management> {
  int selectedIndex = 0;

  final List<String> menuItems = [
    "Tableau de Bord",
    "Documents",
    "Produits",
    "Stock",
    "Reporting",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          /// 🧭 MENU GAUCHE
          Container(
            width: 220,
            color: Colors.grey[100],
            child: Column(
              children: [

                /// HEADER
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Gestion",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Divider(),

                /// MENU ITEMS
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedIndex;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          color: isSelected
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                _getIcon(index),
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                menuItems[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          /// 📄 CONTENU DROITE
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: _buildPage(),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔄 SWITCH PAGE
  Widget _buildPage() {
    switch (selectedIndex) {
      case 0:
        return _dashboardPage();
      case 1:
        return _documentsPage();
      case 2:
       return ProductsPage();
      case 3:
        return _stockPage();
      case 4:
        return _reportingPage();
      default:
        return const SizedBox();
    }
  }

  /// 🧩 PAGES (placeholder pour l'instant)

  Widget _dashboardPage() {
    return const Center(child: Text("Dashboard"));
  }

  Widget _documentsPage() {
    return const Center(child: Text("Documents"));
  }

  /*Widget _productsPage() {
    return const Center(child: Text("Produits"));
  }*/

  Widget _stockPage() {
    return const Center(child: Text("Stock"));
  }

  Widget _reportingPage() {
    return const Center(child: Text("Reporting"));
  }

  /// 🎨 ICONES
  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.dashboard;
      case 1:
        return Icons.description;
      case 2:
        return Icons.shopping_cart;
      case 3:
        return Icons.inventory;
      case 4:
        return Icons.bar_chart;
      default:
        return Icons.circle;
    }
  }
}