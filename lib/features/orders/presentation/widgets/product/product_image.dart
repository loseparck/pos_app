import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/core/theme/app_radius.dart';
import 'product_placeholder.dart';

class ProductImage extends StatelessWidget {
  final Product product;

  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: AppRadius.lg,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),

          // Les prochains widgets viendront ici
          //
          // ProductStatusOverlay(product)
          // ProductPromotionBadge(product)
          // ProductFavoriteButton(product)
        ],
      ),
    );
  }

  Widget _buildImage() {
    
   if (!product.hasImage){
      return ProductPlaceholder(
        product: product,
      );
    }

    final image = product.image!;

    if (image.startsWith('http')) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return ProductPlaceholder(
            product: product,
          );
        },
      );
    }

    return Image.asset(
      image,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) {
        return ProductPlaceholder(
          product: product,
        );
      },
    );
  }
}