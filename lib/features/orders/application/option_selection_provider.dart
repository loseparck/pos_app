import 'package:flutter/foundation.dart';

@immutable
class OptionSelectionState {

  final Map<String, OptionSelection> selectedItems;

  const OptionSelectionState({
    this.selectedItems = const {},
  });


  int quantityOf(String optionId, String itemId) {
    return selectedItems[optionId]?.quantityOf(itemId) ?? 0;
  }


  bool isSelected(String optionId, String itemId) {
    return quantityOf(optionId, itemId) > 0;
  }

  Map<String,int> items(String optionId) {
    return selectedItems[optionId]?.items ?? {};
  }

  OptionSelectionState copyWith({
    Map<String, OptionSelection>? selectedItems,
  }) {
    return OptionSelectionState(
      selectedItems:
          selectedItems ?? this.selectedItems,
    );
  }

  int totalSelected(String optionId) {
    return selectedItems[optionId]?.totalSelected ?? 0;
  }
    
  @override
  String toString() {
    return 'OptionSelectionState(selectedItems: $selectedItems)';
  }
}

class OptionSelection {

  final String optionId;
  final Map<String,int> items;

  const OptionSelection({
    this.items = const {},
    required this.optionId
  });

  int quantityOf(String itemId) {
    return items[itemId] ?? 0;
  }

  int get totalSelected =>
    items.values.fold(
      0,
      (sum, qty) => sum + qty,
  );

  OptionSelection copyWith({
    Map<String, int>? items,
  }) {
    return OptionSelection(
      optionId: optionId,
      items: items ?? this.items,
    );
  }

  @override
  String toString() {
    return 'OptionSelection(optionId: $optionId, items: $items, totalSelected: $totalSelected)';
  }
}