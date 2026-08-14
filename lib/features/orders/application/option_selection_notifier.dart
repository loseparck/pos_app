import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/orders/application/option_selection_provider.dart';
import 'package:pos_app/features/orders/data/models/option_validation_result.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';

class OptionSelectionNotifier extends StateNotifier<OptionSelectionState> {
  OptionSelectionNotifier()
      : super(
          const OptionSelectionState(),
        );

  void toggleItem(
    String optionId,
    String itemId, {
    int? maxToSelect,
  }) {
    final currentSelection = state.selectedItems[optionId] ??
        OptionSelection(optionId: optionId, items: {});

    final items = Map<String, int>.from(currentSelection.items);

    if (items.containsKey(itemId)) {
      items.remove(itemId);
    } else {
      if (maxToSelect != null &&
          currentSelection.totalSelected >= maxToSelect) {
        return;
      }
      items[itemId] = 1;
    }

    final updatedSelectedItems =
        Map<String, OptionSelection>.from(state.selectedItems);

    if (items.isEmpty) {
      updatedSelectedItems.remove(optionId);
    } else {
      updatedSelectedItems[optionId] = currentSelection.copyWith(items: items);
    }

    state = state.copyWith(
      selectedItems: updatedSelectedItems,
    );
  }

  void increaseQuantity(
    String optionId,
    String itemId, {
    int? maxToSelect,
  }) {
    final currentTotal = state.totalSelected(optionId);

    if (maxToSelect != null && currentTotal >= maxToSelect) {
      return;
    }

    final currentSelection = state.selectedItems[optionId] ??
        OptionSelection(optionId: optionId, items: {});

    final items = Map<String, int>.from(currentSelection.items);
    items[itemId] = (items[itemId] ?? 0) + 1;

    final updatedSelectedItems =
        Map<String, OptionSelection>.from(state.selectedItems);
    updatedSelectedItems[optionId] = currentSelection.copyWith(items: items);

    state = state.copyWith(
      selectedItems: updatedSelectedItems,
    );
  }

  void decreaseQuantity(String optionId, String itemId) {
    final currentSelection = state.selectedItems[optionId];

    if (currentSelection == null) return;

    final items = Map<String, int>.from(currentSelection.items);
    final quantity = items[itemId] ?? 0;

    if (quantity <= 1) {
      items.remove(itemId);
    } else {
      items[itemId] = quantity - 1;
    }

    final updatedSelectedItems =
        Map<String, OptionSelection>.from(state.selectedItems);

    if (items.isEmpty) {
      updatedSelectedItems.remove(optionId);
    } else {
      updatedSelectedItems[optionId] = currentSelection.copyWith(items: items);
    }

    state = state.copyWith(
      selectedItems: updatedSelectedItems,
    );
  }

  OptionValidationResult validate({
    required String optionId,
    required int? minToSelect,
    required int? maxToSelect,
    required bool isRequired,
  }) {
    final total = state.totalSelected(optionId);

    if (isRequired && total == 0) {
      return const OptionValidationResult.invalid(
        "Cette option est obligatoire",
      );
    }

    if (minToSelect != null && total < minToSelect) {
      return OptionValidationResult.invalid(
        "Choisissez au minimum $minToSelect élément(s)",
      );
    }

    if (maxToSelect != null && total > maxToSelect) {
      return OptionValidationResult.invalid(
        "Vous avez dépassé le maximum autorisé",
      );
    }
    return const OptionValidationResult.valid();
  }

  Map<String, OptionSelection> getSelection() {
    return Map.unmodifiable(
      state.selectedItems,
    );
  }

  void clear() {
    state = const OptionSelectionState();
  }

  List<OrderItemOption> buildOrderOptions(List<Option> options) {
    final result = <OrderItemOption>[];
    for (final option in options) {
      for (final item in option.items) {
        final quantity = state.quantityOf(
          option.id,
          item.id,
        );
        if (quantity <= 0) {
          continue;
        }
        result.add(
          OrderItemOption(
              id: "",
              orderItemId: "",
              optionId: option.id,
              optionName: option.name,
              itemId: item.id,
              itemName: item.name,
              quantity: quantity,
              unitPrice: item.price,
              vat: item.vat),
        );
      }
    }

    return result;
  }

  int selectedCountForOption(String optionId) {
    return state.totalSelected(optionId);
  }

  OptionValidationResult validateOption(Option option) {
    return validate(
      optionId: option.id,
      isRequired: option.isMandatory,
      minToSelect: option.minToSelect,
      maxToSelect: option.maxToSelect,
    );
  }

  bool isOptionCompleted(Option option) {
    final result = validateOption(option);

    return result.isValid;
  }
}
