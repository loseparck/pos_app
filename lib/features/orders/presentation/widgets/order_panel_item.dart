import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';

class OrderPanelItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final int quantity;
  final List<OptionItem>? supplements;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  const OrderPanelItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    this.supplements,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  double get supplementsTotal =>
      supplements!.fold(0, (sum, s) => sum + s.price);

  double get totalPrice =>
      (productPrice + supplementsTotal) * quantity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(productName),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),

      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [

            /// Ligne principale produit
            Row(
              children: [

                /// boutons quantité
                Row(
                  children: [

                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: onRemove,
                    ),

                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: onAdd,
                    ),
                  ],
                ),

                const SizedBox(width: 10),

                /// nom produit
                Expanded(
                  child: Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),

                /// prix total
                Text(
                  "${totalPrice.toStringAsFixed(2)}€",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            /// suppléments
            if (supplements!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 110, top: 4),
                child: Column(
                  children: supplements!.map((s) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            "+ ${s.name}",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Text(
                          "${s.price.toStringAsFixed(2)}€",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}