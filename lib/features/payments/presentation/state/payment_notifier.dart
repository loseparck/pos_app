import 'package:flutter_riverpod/legacy.dart';
import 'payment_state.dart';
import 'package:pos_app/features/orders/domain/entities/payment_total.dart';
import 'package:pos_app/features/orders/domain/entities/payment_item.dart';

class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier(double total) : super(PaymentState.initial(total));

  void selectTab(int index) {
    state = state.copyWith(selectedTab: index);
  }

  void setActiveField(String key) {
    state = state.copyWith(activeField: key);
  }



  void updateField(String key, String value) {
    final newValues = {...state.fieldValues};
    newValues[key] = value;

    state = state.copyWith(fieldValues: newValues);
  }

  void appendKey(String key) {
    if (state.activeField.isEmpty) return;

    final current = state.fieldValues[state.activeField] ?? "";

    if (key == "⌫") {
      updateField(state.activeField,
          current.isNotEmpty ? current.substring(0, current.length - 1) : "");
      return;
    }

    if (key == "." && current.contains(".")) return;

    updateField(state.activeField, current + key);
  }

  void selectItem(String id) {
    final selected = {...state.selectedIds};

    if (selected.contains(id)) {
      selected.remove(id);
    } else {
      selected.add(id);
    }

    state = state.copyWith(selectedIds: selected);
  }
/*
  void addPart() {
    final amount =
        double.tryParse(state.fieldValues["given_amount_split"] ?? "0") ?? 0;

    final newDetails = [...state.split.paymentDetails];
    newDetails.add(PaymentTotal(
      givenAmount: amount,
      paymentMode: state.mode,
    ));

    state = state.copyWith(
      split: state.split.copyWith(paymentDetails: newDetails),
      fieldValues: {
        ...state.fieldValues,
        "given_amount_split": "0",
      },
    );
  }

  void addItemsPayment() {
    if (state.selectedIds.isEmpty) return;

    final amount =
        double.tryParse(state.fieldValues["given_amount_items"] ?? "0") ?? 0;

    final paymentItem = PaymentItem(
      orderIds: state.selectedIds
          .map((e) => e.split("-").first)
          .toList(),
      paymentDetail: PaymentTotal(
        givenAmount: amount,
        paymentMode: state.mode,
      ),
    );

    state = state.copyWith(
      items: state.items.copyWith(
        itemsPaid: [...state.items.itemsPaid, paymentItem],
      ),
      paidItems: [...state.paidItems, ...state.selectedIds],
      selectedIds: {},
    );
  }

  void setMode(mode) {
    state = state.copyWith(mode: mode);
  }
*/}