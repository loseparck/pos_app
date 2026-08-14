import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';


class ProductName extends StatelessWidget {
  final Product product;

  final int maxLines;

  final TextAlign textAlign;

  const ProductName({
    super.key,
    required this.product,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: product.name,
      waitDuration: const Duration(milliseconds: 500),
      child: Text(
        product.name,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.text,
              height: 1.25,
            ),
      ),
    );
  }
}