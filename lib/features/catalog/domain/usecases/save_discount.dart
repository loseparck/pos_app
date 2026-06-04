import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';


class SaveDiscount {
  SaveDiscount(this._repository);

  final ProductRepository _repository;

  Future<Discount> call(Discount discount) {
    return _repository.saveDiscount(discount);
  }
}