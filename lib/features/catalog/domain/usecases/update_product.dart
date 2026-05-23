import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';


class UpdateProduct {
  UpdateProduct(this._repository);

  final ProductRepository _repository;

  Future<Product> call(Product product) {
    return _repository.updateProduct(product);
  }
}