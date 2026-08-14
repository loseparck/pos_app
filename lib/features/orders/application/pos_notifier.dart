import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/pos_state.dart';

class PosNotifier extends StateNotifier<PosState> {
  PosNotifier() : super(const PosState());

  void search(String value) {
    state = state.copyWith(search: value);
  }

  void clearSearch() {
    state = state.copyWith(search: '');
  }

  void selectCategory(String? id) {
    state = state.copyWith(
      selectedCategoryId: id,
      resetSelectedCategory: id == null
    );
  }

  void selectOrderItem(String? id) {
    state = state.copyWith(
      selectedOrderItemId: id,
    );
  }

  void setQuantity(int quantity) {
    state = state.copyWith(
      keypadQuantity: quantity,
    );
  }

  void incrementQuantity() {
    state = state.copyWith(
      keypadQuantity: state.keypadQuantity + 1,
    );
  }

  void decrementQuantity() {
    if (state.keypadQuantity <= 1) return;

    state = state.copyWith(
      keypadQuantity: state.keypadQuantity - 1,
    );
  }

  void toggleGridMode() {
    state = state.copyWith(
      gridMode: !state.gridMode,
    );
  }

  void reset() {
    state = const PosState();
  }
}