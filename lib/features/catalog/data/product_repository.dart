import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/product_option.dart';

class ProductRepository {

  final List<Product> products = [

    Product(
      id: "coffede",
      name: "Café",
      price: 2,
      groupId: "hot_drinks",
      description: "Expresso",
      options: [
        ProductOption(
          name: "Base", 
          options: [
            OptionItem(
              name: "Base Orange",
              price: 5
            ),
            OptionItem(
              name: "Base Lait",
            ),
          ]
        ),
        ProductOption(
          name: "Topping", 
          options: [
            OptionItem(
              name: "Creme",
              price: 5
            ),
            OptionItem(
              name: "Cannelle",
            ),
          ]
        )
      ]
    ),

    Product(
      id: "tea",
      name: "Thé",
      price: 2.5,
      groupId: "hot_drinks",
      description: "Thé vert",
    ),

    Product(
      id: "cola",
      name: "Coca",
      price: 3,
      groupId: "cold_drinks",
      description: "33cl",
    ),

    Product(
      id: "burger",
      name: "Burger",
      price: 10,
      groupId: "foods",
      description: "Burger maison",
    ),
  ];

  Future<List<Product>> getProductsByGroup(
      String? groupId) async {

    return products
        .where((p) => p.groupId == groupId)
        .toList();
  }
}