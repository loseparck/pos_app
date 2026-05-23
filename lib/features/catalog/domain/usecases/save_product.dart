import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';


class SaveProduct {
  SaveProduct(this._repository);

  final ProductRepository _repository;

  Future<Product> call(Product product) {
    return _repository.saveProduct(product);
  }
}