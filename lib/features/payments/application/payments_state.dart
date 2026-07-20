import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

class PaymentsState {
  /*static const String totalChangeInput ="given_amount";
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
  */

  final PaymentSession? payment;
  final Set<String> checkedItems;
  final Map<String, int> itemsQuantity;
  final bool? isGlobalDiscount;
  final Discount? discount;
  final int qteToPay;
  final int totalPartsCount;
  
  PaymentsState({
    this.payment,
    this.discount,
    this.isGlobalDiscount = false,
    required this.checkedItems,
    required this.itemsQuantity,
    this.qteToPay = 1,
    this.totalPartsCount = 2
  });

  PaymentsState copyWith({
    PaymentSession? payment,
    Discount? discount,
    Set<String>? checkedItems,
    Map<String, int>? itemsQuantity,
    bool? resetDiscount,
    bool? isGlobalDiscount,
    int? qteToPay,
    int? totalPartsCount
  }) {
    return PaymentsState(
      payment: payment ?? this.payment,
      discount: resetDiscount == true ? null : discount ?? this.discount,
      checkedItems: checkedItems ?? this.checkedItems,
      itemsQuantity: itemsQuantity ?? this.itemsQuantity,
      isGlobalDiscount: isGlobalDiscount ?? this.isGlobalDiscount,
      qteToPay: qteToPay ?? this.qteToPay,
      totalPartsCount: payment != null ? payment.partCounts ?? totalPartsCount ?? this.totalPartsCount : totalPartsCount ?? this.totalPartsCount,
    );
  }
}