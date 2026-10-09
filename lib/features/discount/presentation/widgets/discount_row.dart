import 'package:flutter/material.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/item_row.dart';


class DiscountRow extends StatelessWidget {
  final Discount discount;

  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const DiscountRow({super.key, 
    required this.discount,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        discount.name,
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
                        'ID: #${discount.id}',
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
              discount.code ?? "",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              discount.description ?? "",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              discount.type.label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5B21B6),
              ),
            ),
          ),

           Expanded(
            flex: 2,
            child: Text(
              discount.scope.label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5B21B6),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Switch(
              value: discount.isActive,
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