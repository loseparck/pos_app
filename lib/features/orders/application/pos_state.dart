import 'package:flutter/foundation.dart';

@immutable
class PosState {
  final String search;

  final String? selectedCategoryId;

  final String? selectedOrderItemId;

  final int keypadQuantity;

  final bool gridMode;

  const PosState({
    this.search = '',
    this.selectedCategoryId,
    this.selectedOrderItemId,
    this.keypadQuantity = 1,
    this.gridMode = true,
  });

  PosState copyWith({
    String? search,
    String? selectedCategoryId,
    String? selectedOrderItemId,
    int? keypadQuantity,
    bool? gridMode,
    bool resetSelectedCategory = false,
    bool resetSelectedOrderItem = false,
  }) {
    return PosState(
      search: search ?? this.search,
      selectedCategoryId: resetSelectedCategory
          ? null
          : selectedCategoryId ?? this.selectedCategoryId,
      selectedOrderItemId: resetSelectedOrderItem
          ? null
          : selectedOrderItemId ?? this.selectedOrderItemId,
      keypadQuantity: keypadQuantity ?? this.keypadQuantity,
      gridMode: gridMode ?? this.gridMode,
    );
  }
}