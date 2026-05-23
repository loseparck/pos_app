/*import 'package:pos_app/features/catalog/data/demo_products.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';

class ProductRepository {

  Future<List<Product>> getProductsByGroup(
      String? groupId) async {

    return demoProducts
        .where((p) => p.category?.id == groupId)
        .toList();
  }

  Future<List<Product>> searchProducts(
      String query) async {

    return demoProducts
        .where((p) => p.name
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }
}*/