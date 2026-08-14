import 'package:flutter/material.dart';

class EmptyProductView extends StatelessWidget {
  const EmptyProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 72,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            "Aucun produit trouvé",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}