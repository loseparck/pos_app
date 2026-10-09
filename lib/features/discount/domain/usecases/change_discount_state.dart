import 'package:pos_app/features/discount/data/repositories/discount_repository.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';


class ChangeDiscountState {
  ChangeDiscountState(this._repository);

  final DiscountRepository _repository;

  Future<Discount?> call(String discountId, bool state) {
    return _repository.changeDiscountState(discountId, state);
  }
}