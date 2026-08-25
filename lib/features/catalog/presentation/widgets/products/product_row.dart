import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/image_row_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/item_row.dart';


class ProductRow extends StatelessWidget {
  final Product product;

  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const ProductRow({super.key, 
    required this.product,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                ImageRowWidget(
                  imageUrl: product.imagePath,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'ID: #${product.id}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              product.sku ?? "",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              product.barcode ?? "",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              '${product.salePrice.toStringAsFixed(2)} €',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5B21B6),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Text(
              (product.stockQuantity).toStringAsFixed(0),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: (product.stockQuantity) <= 5
                    ? const Color(0xFFEA580C)
                    : const Color(0xFF16A34A),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Switch(
              value: product.isActive,
              onChanged: onToggle,
              activeThumbColor: const Color(0xFF7C3AED),
            ),
          ),

          SizedBox(
            child: Row(
              children: [
                RowAction(
                  icon: Icons.edit_outlined,
                  onPressed: onEdit,
                ),
                const SizedBox(width: 8),
                RowAction(
                  icon: Icons.delete_outline_rounded,
                  danger: true,
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}