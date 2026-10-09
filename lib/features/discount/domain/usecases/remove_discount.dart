import 'package:pos_app/features/discount/data/repositories/discount_repository.dart';


class RemoveDiscount {
  RemoveDiscount(this._repository);

  final DiscountRepository _repository;

  Future<void> call(String id) {
    return _repository.removeDiscount(id);
  }
}