import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/discount/domain/usecases/change_discount_state.dart';
import 'package:pos_app/features/discount/domain/usecases/remove_discount.dart';
import 'package:pos_app/features/discount/domain/usecases/save_discount.dart';
import 'package:pos_app/features/discount/domain/usecases/update_discount.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository_provider.dart';

final saveDiscountUseCaseProvider = Provider<SaveDiscount>((ref) {
  return SaveDiscount(ref.read(discountRepositoryProvider));
});

final removeDiscountUseCaseProvider = Provider<RemoveDiscount>((ref) {
  return RemoveDiscount(ref.read(discountRepositoryProvider));
});

final changeDiscountStateUseCaseProvider = Provider<ChangeDiscountState>((ref) {
  return ChangeDiscountState(ref.read(discountRepositoryProvider));
});

final updateDiscountUseCaseProvider = Provider<UpdateDiscount>((ref) {
  return UpdateDiscount(ref.read(discountRepositoryProvider));
});
