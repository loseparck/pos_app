import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/discount/application/discount_state.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';
import 'providers/usecase_provider.dart';

class DiscountNotifier extends StateNotifier<DiscountState> {
  final Ref ref;
  final DiscountRepository _repository;

  DiscountNotifier(this.ref, this._repository) : 
    super(
      DiscountState(
        discounts: []
      )
    );


  Future<void> load() async {
    final discounts = await _repository.getDiscounts();
    state = state.copyWith(
      discounts: discounts
    );
  } 

  Future<Discount?> addDiscount(Discount discount) async {
    try {
      final saveDiscountUseCase = ref.read(saveDiscountUseCaseProvider);
      final newDiscount = await saveDiscountUseCase(discount);
      state = state.copyWith(
        discounts: [...state.discounts, newDiscount],
      );
      return newDiscount;
    } catch (e) {
      if (kDebugMode) {
        print("Error ${e.toString()}");
      }
      return null;
    }
  }

  Future<void> updateDiscount(Discount discount) async {
    final updateDiscountUseCase = ref.read(updateDiscountUseCaseProvider);
    updateDiscountUseCase(discount);
      
    state = state.copyWith(
      discounts: state.discounts.map((elem) => elem.id != discount.id ? elem: discount).toList(),
    );
  }

  Future<void> toggleDiscount(String discountId, bool newState) async {
      final changeDiscountStateUseCase = ref.read(changeDiscountStateUseCaseProvider);
      changeDiscountStateUseCase(discountId, newState);
       
      state = state.copyWith(
        discounts: state.discounts.map((elem) => elem.id != discountId ? elem: elem.copyWith(isActive: newState)).toList(),
      );
  }

  Future<void> removeDiscount(String id) async {
      final removeDiscountUseCase = ref.read(removeDiscountUseCaseProvider);
      removeDiscountUseCase(id);
      state = state.copyWith(
        discounts: state.discounts.where((item) => item.id != id).toList(),
      );
  }

}