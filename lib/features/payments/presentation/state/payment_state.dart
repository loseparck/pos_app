import 'package:pos_app/features/orders/domain/entities/payment.dart';
import 'package:pos_app/features/orders/domain/entities/payment_mode.dart';
import 'package:pos_app/features/orders/domain/entities/payment_split.dart';
import 'package:pos_app/features/orders/domain/entities/payment_items.dart';
import 'package:pos_app/features/orders/domain/entities/payment_total.dart';

class PaymentState {
  final int selectedTab;
  final String activeField;
  final String selectedOrderId;
  final List<Payment> payment;

  final Set<String> selectedIds;
  final List<String> paidItems;
  final Map<String, String> fieldValues;
  //final PaymentSplit split;
  //final PaymentItems items;
  //final PaymentTotal total;

  

 

  

  PaymentState({
    required this.selectedTab,
    required this.activeField,
    //required this.split,
    //required this.items,
    required this.payment,
    required this.selectedIds,
    required this.paidItems,
    required this.selectedOrderId,
    required this.fieldValues,
  });

  factory PaymentState.initial(double total) {
    return PaymentState(
      selectedTab: 0,
      activeField: "",
      //split: PaymentSplit(paymentDetails: [], numberOfParts: 1),
      //items: PaymentItems(itemsPaid: []),
      //total: PaymentTotal(),
      payment: [],
      selectedIds: {},
      selectedOrderId: "-1",
      paidItems: [],
      //mode: PaymentMode.cash,
      fieldValues: {
        "given_amount": total.toString(),
        "split_count": "1",
        "given_amount_split": total.toString(),
        "given_amount_items": "0",
      },
    );
  }

  PaymentState copyWith({
    int? selectedTab,
    String? activeField,
    //PaymentSplit? split,
    //PaymentItems? items,
    //PaymentTotal? total,
    List<Payment>? payment,
    Set<String>? selectedIds,
    List<String>? paidItems,
    String? selectedOrderId,
    //PaymentMode? mode,
    Map<String, String>? fieldValues,
  }) {
    return PaymentState(
      selectedTab: selectedTab ?? this.selectedTab,
      activeField: activeField ?? this.activeField,
      //split: split ?? this.split,
      //items: items ?? this.items,
      payment: payment ?? this.payment,
      selectedIds: selectedIds ?? this.selectedIds,
      paidItems: paidItems ?? this.paidItems,
      selectedOrderId: selectedOrderId ?? this.selectedOrderId,
      fieldValues: fieldValues ?? this.fieldValues,
    );
  }
}