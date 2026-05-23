import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';


class SaveOption {
  SaveOption(this._repository);

  final ProductRepository _repository;

  Future<Option> call(Option option) {
    return _repository.saveOption(option);
  }
}