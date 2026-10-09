import 'package:pos_app/features/discount/domain/entities/discount.dart';

abstract class DiscountRepository {
  Future<Discount> saveDiscount(Discount discount);
  Future<List<Discount>> getDiscounts();
  Future<Discount?> getDiscount(String id);
  Future<void> removeDiscount(String id);
  Future<Discount> updateDiscount(Discount discount);
  Future<Discount?> changeDiscountState(String discountId, bool state);
}