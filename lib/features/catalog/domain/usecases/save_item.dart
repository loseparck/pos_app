import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';


class SaveItem {
  SaveItem(this._repository);

  final ProductRepository _repository;

  Future<Item> call(Item item) {
    return _repository.saveItem(item);
  }
}