import 'package:pos_app/features/discount/data/models/dto/create_discount_dto.dart';
import 'package:pos_app/features/discount/data/models/dto/update_discount_dto.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';

abstract class DiscountRemoteDatasource {
  Future<Discount> saveDiscount(CreateDiscountDto discount);
  Future<List<Discount>> getDiscounts();
  Future<Discount?> getDiscount(String id);
  Future<void> removeDiscount(String id);
  Future<Discount> updateDiscount(UpdateDiscountDto discount, String discountId);
  Future<Discount> changeDiscountState(String discountId, bool state);
}