import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository_provider.dart';
import 'package:pos_app/features/payments/domain/entities/payment_mode.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';

import 'mode_total_view.dart';
import 'mode_split_view.dart';
import 'mode_articles_view.dart';
import 'right_keypad_panel.dart';

class PaymentModal extends ConsumerStatefulWidget {
  final Function(PaymentSession) payOrder;
  final String orderId;

  const PaymentModal({
    super.key,
    required this.orderId,
    required this.payOrder,
  });

  @override
  ConsumerState<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends ConsumerState<PaymentModal> {
  int _activeTab = 0; 
  String _paymentMethod = 'Espèces';
  String _amountInput = '';

  late final Order? order;

  @override
  void initState(){
    super.initState();
    order = ref.read(ordersProvider).selectedOrder;
    if(order == null){
      throw NotNullableError("_order");
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(paymentsProvider.notifier).initData(order!).whenComplete((){
        _amountInput = '${getDiscountAmount()}';
        PaymentSession? payment = ref.read(paymentsProvider).payment;
        _activeTab = payment == null || payment.mode == PaymentMode.total ? 0 : payment.mode == PaymentMode.split ? 1 : 2;
      });
    });
  }

  double get _changeToReturn {
    double input = double.tryParse(_amountInput) ?? 0.0;
    double result = input - getDiscountAmount();
    return result;
  }

  @override
  Widget build(BuildContext context) {
  bool isAllPaid = ref.read(paymentsProvider.notifier).isAllOrderPaid(order!);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color(0xFFF5F5F3),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          children: [
            _buildTopBar(),
            Opacity(
              opacity: order?.status == OrderStatus.paid ? 0.5 : 1.0,
              child: AbsorbPointer(
                absorbing: isAllPaid,
                child:  _buildTabBar(),
              )
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 6, child: Padding(padding: const EdgeInsets.all(16.0), child: _buildLeftWorkspace(isAllPaid))),
                  Expanded(
                    flex: 4, 
                    child:  Opacity(
                    opacity: isAllPaid ? 0.5 : 1.0,
                    child: AbsorbPointer(
                      absorbing: isAllPaid,
                      child: Container(
                          color: Colors.white, 
                          padding: const EdgeInsets.all(16.0), 
                          child: RightKeypadPanel(
                            amountToPay: getDiscountAmount(),
                            onKeyPress: (char) => setState(() {
                              if (char == '⌫') {
                                if (_amountInput.isNotEmpty) _amountInput = _amountInput.substring(0, _amountInput.length - 1);
                              } else if (char == '.') {
                                if (!_amountInput.contains('.')) _amountInput += _amountInput.isEmpty ? '0.' : '.';
                              } else if (char == 'C') {
                                _amountInput = '';
                              }else {
                                _amountInput += char;
                              }
                            }),
                            onQuickAmountPress: (val) => setState(() => _amountInput = val.toStringAsFixed(2)),
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftWorkspace(bool isAllPaid) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_activeTab == 0) 
          Opacity(
            opacity: isAllPaid ? 0.5 : 1.0,
            child: AbsorbPointer(
              absorbing: isAllPaid,
              child: ModeTotalView(
                totalAmount: order!.total,
                totalVAT: order!.totalVAT,
                discount: getDiscountAsString(),
                discountAmount: getDiscountAmount(),
                updateTotalAmount: () => setState(() { _amountInput = getDiscountAmount().toStringAsFixed(2);})
              ),
            )
          ),
        if (_activeTab == 1) 
          Opacity(
            opacity: isAllPaid ? 0.5 : 1.0,
            child: AbsorbPointer(
              absorbing: isAllPaid,
              child: ModeSplitView(
                remainderToPay: order!.total,
                changeAmountToPay:() => setState(() {getTotalAmount(); _amountInput = getDiscountAmount().toStringAsFixed(2);}),
                showDiscount: () => getDiscountAsString(),
              ),
            )
          ),
       
        if (_activeTab == 2) 
          Opacity(
            opacity: isAllPaid ? 0.5 : 1.0,
            child: AbsorbPointer(
              absorbing: isAllPaid,
              child: ModeArticlesView(
                changeAmountToPay: () => setState(() {getTotalAmount(); _amountInput = getDiscountAmount().toStringAsFixed(2);}),
              ),
            )
          ),
        const Spacer(),
        Opacity(
          opacity: isAllPaid ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: isAllPaid,
            child: _buildSaisieForm(),
          )
        ),
        const SizedBox(height: 2),
        Opacity(
          opacity: isAllPaid ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: isAllPaid,
            child: _buildModePaiementSection(),
          )
        ),
        const SizedBox(height: 2),
        _buildValidationButton(),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTableName(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("${order!.totalItems} articles · ${order!.total} €", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                ],
              ),
            ],
          ),
          IconButton(
            icon:  Icon(Icons.cancel, color: !ref.watch(paymentsProvider.notifier).isAllOrderPaid(order!) ? Color(0xFFDCDCDA) : Colors.red),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _buildTabItem("Total", Icons.receipt_long_outlined, 0),
          _buildTabItem("Split", Icons.people_outline, 1),
          _buildTabItem("Articles", Icons.list_alt_outlined, 2),
        ],
      ),
    );
  }


  Widget _buildTabItem(String label, IconData icon, int index, {String? badge}) {
    bool isActive = _activeTab == index;
    return Expanded(
      child: InkWell(
        onTap: () => ref.read(paymentsProvider).payment != null ? null :setState(() { _activeTab = index; _amountInput = '${getDiscountAmount()}'; }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: isActive ? Colors.black : Colors.transparent, width: 2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isActive ? Colors.black : Colors.grey[500], size: 18),
              const SizedBox(width: 8),
              Text(label, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.w500, color: isActive ? Colors.black : Colors.grey[600])),
              if (badge != null && index == 2) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: Colors.orange[800], borderRadius: BorderRadius.circular(10)),
                  child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaisieForm() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black, width: 1.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Montant reçu via $_paymentMethod", style: TextStyle(color: Colors.grey[500], fontSize: 11, fontWeight: FontWeight.w600)),
                Text(_amountInput.isEmpty ? "0.00 DH" : "$_amountInput DH", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFF4F9F4), borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rendu monnaie", style: TextStyle(color: _changeToReturn >= 0 ? Color(0xFF4CAF50) : Color.fromARGB(255, 199, 54, 54), fontSize: 11, fontWeight: FontWeight.w600)),
                Text("${(_changeToReturn > 0 ? _changeToReturn : 0).toStringAsFixed(2)} €", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _changeToReturn >= 0 ? Color(0xFF4CAF50) : Color.fromARGB(255, 199, 54, 54) )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildModePaiementSection() {
    return Row(
      children: ['Espèces', 'Carte', 'Autre'].map((method) {
        bool isSelected = _paymentMethod == method;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.black : Colors.white,
                foregroundColor: isSelected ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey[300]!)),
                elevation: 0,
              ),
              onPressed: () => setState(() => _paymentMethod = method),
              child: Text(method, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildValidationButton() {
    final notifier = ref.read(paymentsProvider.notifier);
    if(order == null){
      throw NotNullableError("_name");
    }
    if(!ref.watch(paymentsProvider.notifier).isAllOrderPaid(order!)){
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: 
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: getTotalAmount() <= 0 || ref.watch(paymentsProvider.notifier).isAllOrderPaid(order!) ? null : () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), elevation: 0),
                child: Wrap(
                  children: [
                    Text("Encaisser (Sans Ticket de caisse)· ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    if(ref.watch(paymentsProvider).discount == null) ...[
                      Text("${getTotalAmount().toStringAsFixed(2)} €",  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ] else ...[
                      Text(
                        "${getTotalAmount().toStringAsFixed(2)} €", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 13, 
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough, 
                          decorationColor: Colors.white
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${getDiscountAmount().toStringAsFixed(2)} €",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 14, 
                          color: Colors.greenAccent,
                        ),
                      ),
                    ]
                  ],
                )
              ),
              ElevatedButton(
                onPressed: getTotalAmount() <= 0 || ref.watch(paymentsProvider.notifier).isAllOrderPaid(order!) ? null : () async {
                 // setState(() {
                    Set<String> checkedList = ref.read(paymentsProvider).checkedItems;
                   final payment = await notifier.addItemPayment(
                      double.tryParse(_amountInput) ?? 0,
                      getTotalAmount(),
                      order!,
                      _paymentMethod == 'Espèces' ? PaymentMethod.cash : _paymentMethod == 'Carte' ? PaymentMethod.card : PaymentMethod.other,
                      _activeTab == 0 ? PaymentMode.total : _activeTab == 1 ? PaymentMode.split : PaymentMode.item,
                      itemQte: _activeTab == 2 ? Map.fromEntries(checkedList.map((item) => MapEntry(item, notifier.getQuantity(item)))) : null
                    );

                    if (payment != null && mounted) {
                      widget.payOrder(payment);
                    }

                    //if(isAllPaid){
                      //widget.payOrder.call(ref.watch(paymentsProvider).payment!);
                    //}
                 // });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), elevation: 0),
                child: Wrap(
                  children: [
                    Text("Encaisser (Avec Ticket de caisse)· ${getTotalAmount().toStringAsFixed(2)} €", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                )
              )
            ],
          )
      );
    } else {
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: 
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), elevation: 0),
                child: Wrap(
                  children: [
                    Text("Imprimer un Ticket de caisse Total", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                )
              ),
          );
    }
  }

  double getTotalAmount(){
    final state = ref.watch(paymentsProvider);
    if(_activeTab == 0){
      return order!.total;
    } else if(_activeTab == 1){
      return (order!.total / state.totalPartsCount) * state.qteToPay;
    } else {
      final order = ref.watch(ordersProvider).selectedOrder ?? Order(id: '', items: []);
      double total = 0;
      for (var item in order.items) {
        if(ref.watch(paymentsProvider).checkedItems.contains(item.id))
        {
          total += (ref.watch(paymentsProvider).itemsQuantity[item.id] ?? 0) * (item.unitPrice + item.options.fold(0, (total, option) => total+= option.quantity * option.unitPrice));
        }
      }
      return total;
    }
  }

  double getDiscountAmount(){
    Discount? discount = ref.watch(paymentsProvider).discount;
    if(discount == null || getTotalAmount() == 0){
      return getTotalAmount();
    } else {
      double finalAmount;
      double totalAmout = getTotalAmount();
      if(discount.discountType == DiscountType.percentage){
        finalAmount = totalAmout - (totalAmout * discount.value / 100);
      } else {
        finalAmount = totalAmout - discount.value;
      }
      return finalAmount > 0 ? finalAmount : 0;
    }
  }

  String getDiscountAsString(){
    Discount? discount = ref.watch(paymentsProvider).discount;
    if(discount == null || getTotalAmount() == 0){
      return '0.00 DH';
    } else {
      if(discount.discountType == DiscountType.percentage){
        return '${discount.value} % (${(discount.value * getTotalAmount() / 100).toStringAsFixed(2)} DH)';
      } else {
        return '${discount.value.toStringAsFixed(2)} DH';
      }
    }
  }

  String getTableName(){
    if(order!.tableId != null){
      return 'Table: ${ref.read(planProvider).selectedTable!.name}';
    } else if(order!.groupId != null){
      return 'Table: ${ref.read(planProvider).selectedPlan!.name}';
    }
    return 'NaN';
  }
}