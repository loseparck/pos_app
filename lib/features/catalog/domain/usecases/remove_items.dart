import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';


class RemoveItems {
  RemoveItems(this._repository);

  final ProductRepository _repository;

  Future<void> call(List<String> ids) {
    return _repository.removeItems(ids);
  }
}