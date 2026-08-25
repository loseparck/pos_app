import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/image_row_widget.dart';

class ItemRow extends StatelessWidget {
  final Item item;

  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const ItemRow({super.key, 
    required this.item,
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
                  imageUrl: item.image,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
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
                        'ID: #${item.id}',
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
              item.sku ?? "",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              item.description != null && item.description!.length > 15 ? '${item.description!.substring(0,15)}...' : item.description ?? "",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              '${item.additionalPrice.toStringAsFixed(2)} €',
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
              '${item.displayOrder}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Switch(
              value: item.isActive,
              onChanged: onToggle,
              activeThumbColor: const Color(0xFF7C3AED),
            ),
          ),

          SizedBox(
            //width: 100,
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


class RowAction extends StatelessWidget {
  final IconData icon;
  final bool danger;
  final VoidCallback onPressed;

  const RowAction({super.key, 
    required this.icon,
    required this.onPressed,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: danger
              ? const Color(0xFFFFF1F2)
              : const Color(0xFFF8F7FF),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: danger
                ? const Color(0xFFFECACA)
                : const Color(0xFFE9E5FF),
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: danger
              ? const Color(0xFFEF4444)
              : const Color(0xFF6D28D9),
        ),
      ),
    );
  }
}
