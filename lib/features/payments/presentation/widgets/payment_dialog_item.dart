import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';

class PaymentDialogItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final Color backgroundColor;
  final List<Item>? supplements;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const PaymentDialogItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.backgroundColor,
    this.supplements,
    required this.onAdd,
    required this.onRemove,
  });

  double get supplementsTotal =>
      supplements!.fold(0, (sum, s) => sum + s.price);

  double get totalPrice =>
      (productPrice + supplementsTotal);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: onAdd,
        child: Dismissible(
          key: Key(productName),
          direction: DismissDirection.none,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        productName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${totalPrice.toStringAsFixed(2)}€",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (supplements!.isNotEmpty)
                  Text(
                    supplements?.map((e) => "${e.name} (+${e.price})").join(', ') ?? "",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  )
              ],
            ),
          ),
        )
      )
    );
  }
}