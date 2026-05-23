import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';


class RemoveProduct {
  RemoveProduct(this._repository);

  final ProductRepository _repository;

  Future<void> call(String id) {
    return _repository.removeProduct(id);
  }
}