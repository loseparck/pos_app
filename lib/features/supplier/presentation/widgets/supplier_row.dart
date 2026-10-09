import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/item_row.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';


class SupplierRow extends StatelessWidget {
  final Supplier supplier;

  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const SupplierRow({super.key, 
    required this.supplier,
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
            flex: 2,
            child: Text(
              supplier.name,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              '${supplier.contactLastName ?? ''} ${supplier.contactFirstName ?? ''}',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              supplier.siret ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              supplier.email ?? "",
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
              supplier.phone ?? "",
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
              supplier.type.name,
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
              supplier.city ?? '',
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
              value: supplier.isActive,
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