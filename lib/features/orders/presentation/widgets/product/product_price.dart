import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/core/widgets/commun_price_text.dart';

class ProductPrice extends StatelessWidget {
  final double price;

  const ProductPrice({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return CommunPriceText(
      price: price,
      color: AppColors.primary,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
  }
}