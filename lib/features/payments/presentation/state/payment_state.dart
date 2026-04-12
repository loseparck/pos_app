import 'package:flutter/material.dart';
import 'package:pos_app/features/payments/domain/entities/payment.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';

class PaymentState {
  static const String totalChangeInput ="given_amount";
  static const String partCountInput ="split_count";
  static const String splitChangeInput ="given_amount_split";
  static const String itemsChangeInput ="given_amount_items";

  final int selectedTab;
  final String activeField;
  final String? selectedOrderId;
  final List<Payment> payments;

  final Set<String> selectedIds;
  final List<String> paidItems;
  final Map<String, TextEditingController> fieldValues;
  final PaymentMode? mode;
  
  PaymentState({
    required this.payments,
    required this.selectedIds,
    required this.paidItems,
    required this.fieldValues,
    required this.activeField,
    this.selectedTab  = 0,
    this.selectedOrderId,
    this.mode = PaymentMode.cash,
  });

  PaymentState copyWith({
    int? selectedTab,
    String? activeField,
    List<Payment>? payments,
    Set<String>? selectedIds,
    List<String>? paidItems,
    String? selectedOrderId,
    PaymentMode? mode,
    Map<String, TextEditingController>? fieldValues,
  }) {
    return PaymentState(
      selectedTab: selectedTab ?? this.selectedTab,
      activeField: activeField ?? this.activeField,
      mode: mode ?? this.mode,
      payments: payments ?? this.payments,
      selectedIds: selectedIds ?? this.selectedIds,
      paidItems: paidItems ?? this.paidItems,
      selectedOrderId: selectedOrderId ?? this.selectedOrderId,
      fieldValues: fieldValues ?? this.fieldValues,
    );
  }

  Payment? get selectedOrderPayment {
    if(selectedOrderId == null || selectedOrderId == "-1") return null;
    try{
      return payments.firstWhere((payment) => payment.orderId == selectedOrderId);
    } catch(_){
      return null;
    }
  } 
}