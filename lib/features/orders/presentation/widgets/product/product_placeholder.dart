import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';


class ProductPlaceholder extends StatelessWidget {
  final Product product;

  const ProductPlaceholder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onSurfaceVariant,//AppColors.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.fastfood,
          size: 54,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}