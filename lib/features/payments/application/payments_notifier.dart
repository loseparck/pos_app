import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/domain/entities/payment_transaction.dart';
import 'package:uuid/uuid.dart';
import 'payments_state.dart';

class PaymentsNotifier extends StateNotifier<PaymentsState> {
  final Ref ref;
  final PaymentRepository _repository;

  /*PaymentsNotifier() :super(
      PaymentsState(
        /*fieldValues: {
          PaymentsState.totalChangeInput: TextEditingController(),
          PaymentsState.partCountInput: TextEditingController(text: "1"),
          PaymentsState.splitChangeInput: TextEditingController(),
          PaymentsState.itemsChangeInput: TextEditingController(),
        },
        paidItems: [],
        selectedIds: {},*/
        payments: [],
        //activeField: PaymentsState.totalChangeInput
      )
    );*/

  PaymentsNotifier(this.ref, this._repository) : 
    super(
      PaymentsState(
        itemsQuantity: {},
        checkedItems: {},
      )
    );

  Future<void> initData(Order order) async {
    if(state.payment == null || (state.payment != null && state.payment?.order.id != order.id)){
      state = state.copyWith(
        payment: await _repository.getPaymentByOrder(order.id),
        isGlobalDiscount: false,
        resetDiscount: true,
        qteToPay: 1, 
        totalPartsCount: 2
      );
      state.checkedItems.clear();
      state.itemsQuantity.clear();
    }
    
    /*if(state.payment == null){
      state= state.copyWith(
        resetDiscount: true,
        isGlobalDiscount: false
      );
    }*/
  }
  

  void setDiscount(Discount? discount){
    state = state.copyWith(
      resetDiscount: discount == null,
      discount: discount
    );
  }

  void setDiscountLife(bool discountLife){
    state = state.copyWith(
      isGlobalDiscount: discountLife
    );
  }

  void checkItem(String itemId){
    state = state.copyWith(
      checkedItems: {...state.checkedItems, itemId}
    );
  }

  void uncheckItem(String itemId){
    state = state.copyWith(
      checkedItems: {...state.checkedItems}..remove(itemId)
    );
  }

  bool isItemChecked(String itemId){
    return state.checkedItems.contains(itemId);
  }

  bool isQuantityFiled(String itemId){
    return state.itemsQuantity[itemId] != null;
  }

  void increaseQuantity(String itemId, int value){
    state.itemsQuantity[itemId] = state.itemsQuantity[itemId]! + value;
  }

  void setQuantity(String itemId, int value){
    state.itemsQuantity[itemId] = value;
  }

  int getQuantity(String itemId){
    return state.itemsQuantity[itemId] ?? 0;
  }

  int changeQuantityToPay(int qte) {
    if(state.qteToPay + qte > 0){
      state = state.copyWith(
        qteToPay: state.qteToPay + qte
      );
    }
    return state.qteToPay;
  }

  void changePartsCount(int qte){
    if(state.totalPartsCount + qte >= 2){
      state = state.copyWith(
        totalPartsCount: state.totalPartsCount + qte
      );
    }
  }

  void clearItem(){
    state.checkedItems.clear();
    state.itemsQuantity.clear();
    state = state.copyWith(
      qteToPay: 1,
      resetDiscount: state.isGlobalDiscount != true
    );
  }

  bool isAllOrderPaid(Order order){
    if(state.payment == null){
      return false;
    }
    
    return order.total == state.payment?.totalAlreadyPaid;
  }

  int isPaid(String itemId){
    if(state.payment != null){
      return state.payment!.itemPaidQte(itemId);
    }
    return 0;
  }

  int countPaidParts(){
    if(state.payment != null){
      return state.payment!.paidPartCount();
    }
    return 0;
  }

  void addItemPayment(double givenAmount, double total, Order order, PaymentMethod paymentMethod, PaymentMode paymentMode, {Map<String, int>? itemQte}) async {
    if(state.discount != null && state.discount!.id == ''){
      state = state.copyWith(
        discount: await ref.read(productsProvider.notifier).addDiscount(state.discount!)
      );
    }
    
    if(state.payment == null){
      state = state.copyWith(
        payment: await _repository.createPayment(PaymentSession(id: Uuid().v4(), order: order, mode: paymentMode, partCounts: paymentMode == PaymentMode.split ? state.totalPartsCount : 0))
      );
    }

    final PaymentTransaction? transaction = await _repository.ceatePaymentTransaction(buildTransaction(state.payment!, paymentMethod, total, givenAmount, itemQte:itemQte, paidPartCount: paymentMode == PaymentMode.split ? state.qteToPay : 0));
    
    if(transaction != null){
       state = state.copyWith(
        payment: state.payment?.copyWith(
          history: [...state.payment!.history, transaction]
        ),
      );
    }
    
    /*if(state.payment == null){
      PaymentTransaction transaction = buildTransaction(state.payment!, paymentMethod, total, givenAmount, itemQte:itemQte, paidPartCount: paymentMode == PaymentMode.split ? state.qteToPay : 0);
      state = state.copyWith(
        payment: PaymentSession(id: Uuid().v4(), order: order, mode: paymentMode, partCounts: paymentMode == PaymentMode.split ? state.totalPartsCount : 0, history: [transaction]),
      );
    }
    else{
      state = state.copyWith(
        payment: state.payment?.copyWith(
          history: [...state.payment!.history, buildTransaction(state.payment!, paymentMethod, total, givenAmount, itemQte:itemQte, paidPartCount: paymentMode == PaymentMode.split ? state.qteToPay : 0)]
        ),
      );
    }*/
    clearItem();
  }

  PaymentTransaction buildTransaction(PaymentSession payment,PaymentMethod paymentMethod, double total, double givenAmount, {Map<String, int>? itemQte, int? paidPartCount}){
    return PaymentTransaction(
        id: Uuid().v4(),
        session: payment,
        validatedAt: DateTime.timestamp(),
        paymentMethod: paymentMethod,
        amountDue: double.parse(total.toStringAsFixed(2)),
        amountReceived: double.parse(givenAmount.toStringAsFixed(2)),
        paidArticlesQty: itemQte ?? {},
        paidPartCount: paidPartCount ?? 0,
        discount: state.discount
      );
  }

  /*void selectTab(int index) {
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
            givenAmount: _parseAmount(PaymentsState.itemsChangeInput),// double.tryParse(state.fieldValues[PaymentState.itemsChangeInput]?.text ?? "0"),
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
            givenAmount: _parseAmount(PaymentsState.splitChangeInput),
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
      int? numberOfParts = int.tryParse(state.fieldValues[PaymentsState.partCountInput]!.text);
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
              givenAmount: _parseAmount(PaymentsState.totalChangeInput),
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
     state.fieldValues[PaymentsState.partCountInput]?.text ?? "1"
     : "${split.numberOfParts - split.paymentDetails.length}";
  }

  bool isAddPartEnabled(){
    final split = currentSplit;
    return split == null || split.numberOfParts > split.paymentDetails.length;
  }

  bool isPaymentFieldReadOnly(String fieldKey){
    if(PaymentsState.partCountInput == fieldKey){
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
  }*/
}