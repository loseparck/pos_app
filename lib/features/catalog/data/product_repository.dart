import 'package:pos_app/features/orders/domain/entities/product.dart';

class ProductRepository {

  final List<Product> products = [

    Product(
      id: "coffee",
      name: "Café",
      price: 2,
      groupId: "hot_drinks",
      description: "Expresso",
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