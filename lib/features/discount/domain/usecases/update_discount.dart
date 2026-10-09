import 'package:pos_app/features/discount/data/repositories/discount_repository.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';


class UpdateDiscount {
  UpdateDiscount(this._repository);

  final DiscountRepository _repository;

  Future<Discount> call(Discount discount) {
    return _repository.updateDiscount(discount);
  }
}