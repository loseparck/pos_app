import 'package:flutter/material.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.grey.shade400;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 72,
            color: color,
          ),
          const SizedBox(height: 16),
          Text(
            "Aucun article",
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Sélectionnez un produit pour commencer.",
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}