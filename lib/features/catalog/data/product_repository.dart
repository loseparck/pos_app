import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

class ProductRepository {
  final fruitOption = Option(
      name: 'Base', 
      items: [], 
      id:'1231321'
    );
  late final List<Product> products = [
    Product(
      id: "coffede",
      name: "Café",
      price: 2,
      //categoryId: "hot_drinks",
      description: "Expresso",
      options: [
        Option(
          id: "IDG1",
          name: "Base", 
          items: [
            Item(
              id: "IDG1O1",
              name: "Base Orange",
              price: 5,
              option: fruitOption,
            ),
            Item(
              id: "IDG1O2",
              name: "Base Lait",
              option: fruitOption,
            ),
          ]
        ),
        Option(
          id: "IDG2",
          name: "Topping", 
          items: [
            Item(
              id: "IDG2O1",
              name: "Creme",
              price: 5,
             option: fruitOption,
            ),
            Item(
              id: "IDG2O2",
              name: "Cannelle",
             option: fruitOption,
            ),
          ]
        )
      ]
    ),

    Product(
      id: "tea",
      name: "Thé",
      price: 2.5,
      //categoryId: "hot_drinks",
      description: "Thé vert",
    ),

    Product(
      id: "cola",
      name: "Coca",
      price: 3,
      //categoryId: "cold_drinks",
      description: "33cl",
    ),

    Product(
      id: "burger",
      name: "Burger",
      price: 10,
      //categoryId: "foods",
      description: "Burger maison",
    ),
  ];

  Future<List<Product>> getProductsByGroup(
      String? groupId) async {

    return products
        .where((p) => p.category?.id == groupId)
        .toList();
  }
}