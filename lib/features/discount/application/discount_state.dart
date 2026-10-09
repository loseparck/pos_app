import 'package:pos_app/features/discount/domain/entities/discount.dart';

class DiscountState{
  final List<Discount> discounts;

  final String? selectedDiscountId;

  DiscountState({
    required this.discounts,
    this.selectedDiscountId,
  });


  Discount? getDiscountById(String discountId) {
    try{
      return discounts.firstWhere((discount) => discount.id == discountId);
    } catch(_){
      return null;
    }
  } 

  Discount? get selectedDiscount {
    if(selectedDiscountId == null) return null;
    try{
      return discounts.firstWhere((discount) => discount.id == selectedDiscountId);
    } catch(_){
      return null;
    }
  } 

  DiscountState copyWith({
    List<Discount>? discounts,
    String? selectedDiscountId,
    bool? resetDiscountId,
  }){
    return DiscountState(
      discounts: discounts ?? this.discounts,
      selectedDiscountId: resetDiscountId == true ? null : selectedDiscountId ?? this.selectedDiscountId
    );
  }
}