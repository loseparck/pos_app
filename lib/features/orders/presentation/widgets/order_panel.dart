import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/presentation/widgets/order_panel_item.dart';

class OrderPanel extends ConsumerStatefulWidget {
  //final Order? order;

  const OrderPanel({super.key});

  @override
  ConsumerState<OrderPanel> createState() => _OrderPanel();
}

class _OrderPanel extends ConsumerState<OrderPanel> {

  @override
  Widget build(BuildContext context) {
    Order? order = ref.watch(ordersProvider)!.selectedOrder;
    
    if (order == null) {
      return const Center(child: Text("Aucune commande"));
    }
    
    return Column(
      children: [

        /// LIST ITEMS
        Expanded(
          child: ListView.builder(
            itemCount: order!.items.length,
            itemBuilder: (context, index) {

              final item = order!.items[index];
              return OrderPanelItem(
                productName: item.name,
                productPrice: item.unitPrice,
                quantity: item.quantity,
                supplements: item.options,

                onAdd: () {
                //  ref
                  //  .read(ordersProvider.notifier)
                    //.increaseQuantity(item);
                  setState(() {
                    item.quantity++;
                  });
                },

                onRemove: () {
                  setState(() {
                   // if (item.quantity > 1) {
                     // ref
                       // .read(ordersProvider.notifier)
                        //.decreaseQuantity(item);
                    //}
                    item.quantity--;
                  });
                },

                onDelete: () {
                  //setStats(() {
                    order!.items.removeAt(index);
                 // });
                },
              );
              /*return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  children: [

                    /// Ligne produit
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Badge quantité
                        Container(
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.quantity.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// Nom produit
                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        /// Prix total
                        Text(
                          "${item.total.toStringAsFixed(2)}€",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    /// Supplements
                    if (item.options!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 38, top: 4),
                        child: Column(
                          children: item.options!.map((s) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "+ ${s.name}",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${s.price.toStringAsFixed(2)}€",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      )
                  ],
                ),
              );*/

              /*return ListTile(
                title: Text(item.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: item.options!.map((supplement) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("+ ${supplement.name}"),
                        Text("${supplement.price.toStringAsFixed(2)}€"),
                      ],
                    );
                  }).toList(),
                ),
                
                trailing: /*Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("x${item.quantity}"),
                    Text(
                      "${item.total.toStringAsFixed(2)}€",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),*/
                Text(
                    "${item.total.toStringAsFixed(2)} €"),
                
              );*/
            },
          ),
        ),

        /// TOTAL
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TOTAL",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                "${order!.total.toStringAsFixed(2)} €",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}