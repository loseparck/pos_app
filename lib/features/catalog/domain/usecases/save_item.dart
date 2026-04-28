import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';


class SaveItem {
  SaveItem(this._repository);

  final ProductRepository _repository;

  Future<OptionItem> call(OptionItem item) {
    return _repository.saveItem(item);
  }
}