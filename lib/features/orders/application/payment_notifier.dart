import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/orders/application/payment_state.dart';
/*
final paymentProvider =
    StateNotifierProvider<PaymentNotifier, PaymentState>(
  (ref) => PaymentNotifier(),
);
*/
class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier(super.state);
 

  
  /*PaymentNotifier()
      : super(PaymentState(
          mode: PaymentMode.total,
          parts: [],
          items: [],
        ));

  void init(Order order) {
    state = PaymentState(
      mode: PaymentMode.total,
      parts: [],
      items: order.items
          .map((e) => PayableItem(item: e))
          .toList(),
    );
  }

  void setMode(PaymentMode mode) {
    state = PaymentState(
      mode: mode,
      parts: [],
      items: state.items,
    );
  }

  // ======================
  // MODE 1
  // ======================
  double computeChange(double given) {
    return given - state.total;
  }

  void payFull(double amount) {
    state = PaymentState(
      mode: state.mode,
      items: state.items,
      parts: [
        PaymentPart(amount: amount),
      ],
    );
  }

  // ======================
  // MODE 2
  // ======================
  void setSplitCount(int count) {
    state = PaymentState(
      mode: state.mode,
      parts: state.parts,
      items: state.items,
      splitCount: count,
    );
  }

  double get splitAmount =>
      state.total / state.splitCount;

  void paySplitPart() {
    final partAmount = splitAmount;

    state = PaymentState(
      mode: state.mode,
      items: state.items,
      splitCount: state.splitCount,
      parts: [
        ...state.parts,
        PaymentPart(amount: partAmount),
      ],
    );
  }

  // ======================
  // MODE 3
  // ======================
  final Map<String, int> selection = {};

  void selectItem(String id) {
    final item =
        state.items.firstWhere((e) => e.item.id == id);

    final selected = selection[id] ?? 0;

    if (selected < item.remaining) {
      selection[id] = selected + 1;
    }
    state = state;
  }

  void unselectItem(String id) {
    if (!selection.containsKey(id)) return;

    final q = selection[id]! - 1;
    if (q <= 0) {
      selection.remove(id);
    } else {
      selection[id] = q;
    }
    state = state;
  }

  double get selectionTotal {
    double total = 0;

    for (final entry in selection.entries) {
      final item = state.items
          .firstWhere((e) => e.item.id == entry.key);

      total += item.item.unitPrice * entry.value;
    }

    return total;
  }

  void validateSelection() {
    for (final entry in selection.entries) {
      final item = state.items
          .firstWhere((e) => e.item.id == entry.key);

      item.paidQuantity += entry.value;
    }

    state = PaymentState(
      mode: state.mode,
      items: state.items,
      parts: [
        ...state.parts,
        PaymentPart(
          amount: selectionTotal,
          items: selection.entries
              .map((e) =>
                  PaidItem(itemId: e.key, quantity: e.value))
              .toList(),
        )
      ],
      splitCount: state.splitCount,
    );

    selection.clear();
  }*/
}