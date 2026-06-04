import 'package:pos_app/features/catalog/data/repositories/product_repository.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';


class ChangeDiscountState {
  ChangeDiscountState(this._repository);

  final ProductRepository _repository;

  Future<Discount> call(String discountId, bool state) {
    return _repository.changeDiscountState(discountId, state);
  }
}