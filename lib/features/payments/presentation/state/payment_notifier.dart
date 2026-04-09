import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/orders/domain/entities/payment.dart';
import 'package:pos_app/features/orders/domain/entities/payment_item.dart';
import 'package:pos_app/features/orders/domain/entities/payment_items.dart';
import 'package:pos_app/features/orders/domain/entities/payment_mode.dart';
import 'package:pos_app/features/orders/domain/entities/payment_split.dart';
import 'package:pos_app/features/orders/domain/entities/payment_total.dart';
import 'payment_state.dart';

class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier() :super(
      PaymentState(
        fieldValues: {
          PaymentState.totalChangeInput: TextEditingController(),
          PaymentState.partCountInput: TextEditingController(text: "1"),
          PaymentState.splitChangeInput: TextEditingController(),
          PaymentState.itemsChangeInput: TextEditingController(),
        },
        paidItems: [],
        selectedIds: {},
        payments: [],
        activeField: PaymentState.totalChangeInput
      )
    );

  void selectTab(int index) {
    state = state.copyWith(selectedTab: index);
  }

  void setActiveField(String key) {
    state = state.copyWith(activeField: key);
  }

  void selectMode(PaymentMode newMode) {
    state = state.copyWith(mode: newMode);
  }

  void changeSelectedOrder(String key) {
    state = state.copyWith(
      selectedOrderId: key,);
  }

  void addSelectedItem(String key){
    final newSelected = {...state.selectedIds, key};
    state = state.copyWith(selectedIds: newSelected);
  }

  void removeSelectedItem(String key){
    final newSelected = {...state.selectedIds}..remove(key);
    state = state.copyWith(selectedIds: newSelected);
  }

  void addPaidItem(String key){
    final newPaid = [...state.paidItems, key];
    state = state.copyWith(paidItems: newPaid);
  }

  void updateField(String key, String value) {
    final newValues = {...state.fieldValues};
    newValues[key]?.text = value;

    state = state.copyWith(fieldValues: newValues);
  }

  void addPayment(Payment payment) {
    state = state.copyWith(
      payments: [...state.payments, payment],
    );
  }

  void addItem(){
    if(state.selectedIds.isNotEmpty){
      final PaymentItem paymentItem = PaymentItem(
          orderIds: state.selectedIds.map((item) => item.split('-').first).toList(), 
          paymentDetail: PaymentTotal(
            givenAmount: _parseAmount(PaymentState.itemsChangeInput),// double.tryParse(state.fieldValues[PaymentState.itemsChangeInput]?.text ?? "0"),
            paymentMode: state.mode
            ),
        );

      Payment? updatedPayment = state.selectedOrderPayment;
      if(updatedPayment != null){
        final old = updatedPayment.details as PaymentItems;

        final newDetails = PaymentItems(
          itemsPaid: [...old.itemsPaid, paymentItem],
        );

        final newPayment = updatedPayment.copyWith(details: newDetails);
        state = state.copyWith(
          payments: _replacePayment(newPayment),
        );
      } else {
        state = state.copyWith(
          payments: [...state.payments, Payment(details: PaymentItems(itemsPaid: [paymentItem]), orderId: state.selectedOrderId, type: PaymentType.order)],
        );
      }
      state = state.copyWith(
        paidItems: [...state.paidItems, ...state.selectedIds],
        selectedIds: {},
      );
      
    }
  }

List<Payment>  _replacePayment(Payment newPayment) {
  return state.payments.map((p) {
    return p.orderId == state.selectedOrderId ? newPayment : p;
  }).toList();
}

  void addPart(){
    PaymentTotal partPayment = PaymentTotal(
            givenAmount: _parseAmount(PaymentState.splitChangeInput),
            paymentMode: state.mode
            );
    Payment? oldPayment = state.selectedOrderPayment;
    if(oldPayment != null){
      final split  = oldPayment.details as PaymentSplit;

      if(split.numberOfParts > split.paymentDetails.length){
        final newDetails = PaymentSplit(
          numberOfParts: split.numberOfParts,
          paymentDetails: [...split.paymentDetails, partPayment],
        );

        final newPayment = oldPayment.copyWith(details: newDetails);
        state = state.copyWith(
          payments: _replacePayment(newPayment),
        );
      } 
    } else {
      int? numberOfParts = int.tryParse(state.fieldValues[PaymentState.partCountInput]!.text);
      if(numberOfParts != null && numberOfParts > 0){
        state = state.copyWith(
          payments: [
            ...state.payments,
            Payment(
              details: PaymentSplit(
                paymentDetails: [partPayment],
                numberOfParts: numberOfParts
              ), 
              orderId: state.selectedOrderId,
              type: PaymentType.split,
            ),
          ],
        );
      }
    }
  }

  int getPaidPartCount(){
    return currentSplit?.paymentDetails.length ?? 0;
  }
 
  Payment? savePayment() {
    Payment? payment = state.selectedOrderPayment;
    if(payment == null && state.selectedTab == 0){
      payment = Payment(
            details: PaymentTotal(
              givenAmount: _parseAmount(PaymentState.totalChangeInput),
              paymentMode: state.mode,
            ),
            orderId: state.selectedOrderId,
            type: PaymentType.total,
          );
    }
    
    if(payment != null){
      state = state.copyWith(
        payments: state.payments.whereNot((p) => p.orderId == state.selectedOrderPayment).toList(),
        selectedTab: 0,
        selectedOrderId: "",
      );
    }
    return payment;
  }

  PaymentSplit? get currentSplit {
    final payment = state.selectedOrderPayment;
    return payment?.details is PaymentSplit
        ? payment!.details as PaymentSplit
        : null;
  }

  double _parseAmount(String key) {
    return double.tryParse(state.fieldValues[key]?.text ?? "0") ?? 0;
  }

  bool checkIfEnableSave(int itemCount){
    final payment = state.selectedOrderPayment;

    switch (state.selectedTab) {
      case 0:
        return true;
      case 1:
      
          if (payment?.details case PaymentSplit split) {
            return split.numberOfParts <= split.paymentDetails.length;
          }
        return false;

      case 2:
        return payment?.details is PaymentItems &&
              itemCount == state.paidItems.length;

      default:
        return false;
    }
  }

  bool checkIfEnableTitle(int tabIndex){
    final payment = state.selectedOrderPayment;

    if (payment == null) return true;

    return (tabIndex == 1 && payment.details is PaymentSplit) ||
          (tabIndex == 2 && payment.details is PaymentItems);
  }
  
  String getPartToPayCount(){
    final split = currentSplit;
    return split == null ?
     state.fieldValues[PaymentState.partCountInput]?.text ?? "1"
     : "${split.numberOfParts - split.paymentDetails.length}";
  }

  bool isAddPartEnabled(){
    final split = currentSplit;
    return split == null || split.numberOfParts > split.paymentDetails.length;
  }

  bool isPaymentFieldReadOnly(String fieldKey){
    if(PaymentState.partCountInput == fieldKey){
      return (currentSplit?.paymentDetails.isNotEmpty ?? false);
    }
    return false;
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
}