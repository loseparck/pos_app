import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';


class RemoveCategory {
  RemoveCategory(this._repository);

  final ProductRepository _repository;

  Future<void> call(String id) {
    return _repository.removeCategory(id);
  }
}