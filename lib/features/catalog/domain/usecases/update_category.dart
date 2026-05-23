import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';


class UpdateCategory {
  UpdateCategory(this._repository);

  final ProductRepository _repository;

  Future<Category> call(Category category) {
    return _repository.updateCategory(category);
  }
}