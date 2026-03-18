import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';

class OrderPanelItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final int quantity;
  final List<OptionItem>? supplements;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const OrderPanelItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    this.supplements,
    required this.onAdd,
    required this.onRemove,
  });

  double get supplementsTotal =>
      supplements!.fold(0, (sum, s) => sum + s.price);

  double get totalPrice =>
      (productPrice + supplementsTotal) * quantity;

  Icon getDecreaseIcon(){
    return quantity > 1 ? const Icon(Icons.remove_circle_outline) : Icon(Icons.delete_forever_rounded);
  } 

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(productName),
      direction: DismissDirection.startToEnd,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            /// Ligne principale produit
            Row(
              children: [
                /// Nom du produit
                Expanded(
                  flex: 2,
                  child: Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis, // Evite overflow si le nom est long
                  ),
                ),

                /// Quantité centrée
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: getDecreaseIcon(),
                        onPressed: onRemove,
                        constraints: const BoxConstraints(), // réduit la taille par défaut
                        padding: EdgeInsets.zero,
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
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),

                /// Prix à droite
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${totalPrice.toStringAsFixed(2)}€",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// suppléments
            if (supplements!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 4, right: 5),
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