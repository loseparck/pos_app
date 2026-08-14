import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository_provider.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/presentation/widgets/discount_selector_widget.dart';


class ModeArticlesView extends ConsumerStatefulWidget {
  
  const ModeArticlesView({
    super.key,
    required this.changeAmountToPay,
  });

  final Function() changeAmountToPay;

  @override
  ConsumerState<ModeArticlesView> createState() => _ModeArticlesViewState();
}

class _ModeArticlesViewState extends ConsumerState<ModeArticlesView> {
  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(paymentsProvider.notifier);
    final order = ref.watch(ordersProvider).selectedOrder ?? Order(id: '', items: []);
    if(order.id == ''){
      return const Text("Please select Order First");
    }
    return Column(
      children: [
        DiscountSelectorWidget(updateTotalAmount: widget.changeAmountToPay, mode: PaymentMode.item),
        const SizedBox(height: 4),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              final art = order.items[index];
              final paidQte = notifier.isPaid(art.id);
              final bool checked = paidQte == art.quantity || notifier.isItemChecked(art.id);
              bool isEncaisse = art.quantity == paidQte;
              bool hasMultipleQty = art.quantity > 1;
              if(!isEncaisse && !notifier.isQuantityFiled(art.id)){
                notifier.setQuantity(art.id, 1);
              }
              final String status = isEncaisse ? 'Paid': hasMultipleQty ? 'Partiel ($paidQte/${art.quantity})' :'To Pay';

              return Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: checked ? (isEncaisse ? const Color(0xFFF4F9F4) : const Color(0xFFFFFDE7)) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: checked ? (isEncaisse ? Colors.green[200]! : Colors.orange[400]!) : Colors.grey[200]!),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: checked,
                        activeColor: isEncaisse ? Colors.green : Colors.black,
                        onChanged: isEncaisse ? null : (val) => setState(() {
                          if(notifier.isItemChecked(art.id)){
                            notifier.uncheckItem(art.id);
                          } else {
                            notifier.checkItem(art.id);
                          }
                           widget.changeAmountToPay.call();
                        }),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(art.productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, decoration: isEncaisse ? TextDecoration.lineThrough : null, color: isEncaisse ? Colors.grey : Colors.black)),
                            Text("Prix unitaire : ${art.unitPrice.toStringAsFixed(2)} €", style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                          ],
                        ),
                      ),
                      if (hasMultipleQty && !isEncaisse) ...[
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: [
                              _buildMiniButton(Icons.remove, () => notifier.getQuantity(art.id) <= 1 ? null : setState(() {
                                notifier.increaseQuantity(art.id, -1);
                                if(!notifier.isItemChecked(art.id)){
                                  notifier.checkItem(art.id);
                                }
                                widget.changeAmountToPay.call();
                              })),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("${notifier.getQuantity(art.id) + paidQte} / ${art.quantity}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                              _buildMiniButton(Icons.add, () =>  notifier.getQuantity(art.id) + paidQte >= art.quantity ? null : setState(() {
                                notifier.increaseQuantity(art.id, 1);
                                if(!notifier.isItemChecked(art.id)){
                                  notifier.checkItem(art.id);
                                }
                                widget.changeAmountToPay.call();
                              })),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                      ] else ...[
                        Text("× ${art.quantity}", style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                        const SizedBox(width: 16),
                      ],
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${getItemTotal(art, isEncaisse ? art.quantity : notifier.getQuantity(art.id))} €", style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: isEncaisse ? const Color(0xFFEDF7ED) : const Color(0xFFECEFF1), borderRadius: BorderRadius.circular(4)),
                            child: Text(status, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: isEncaisse ? Colors.green[800] : Colors.grey[700])),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildMiniButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Icon(icon, size: 12, color: Colors.black87),
      ),
    );
  }

  String getItemTotal(OrderItem item, int qte){
    double total = item.unitPrice;
    for(OrderItemOption option in item.options){
      total+= option.quantity * option.unitPrice;
    }
    return (total * qte).toStringAsFixed(2);
  }
}