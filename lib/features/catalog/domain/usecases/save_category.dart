import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';


class SaveCategory {
  SaveCategory(this._repository);

  final ProductRepository _repository;

  Future<Category> call(Category category, String? picturePath) {
    return _repository.saveCategory(category, picturePath);
  }
}