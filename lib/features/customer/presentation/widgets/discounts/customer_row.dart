import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/item_row.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';


class CustomerRow extends StatelessWidget {
  final Customer customer;

  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const CustomerRow({super.key, 
    required this.customer,
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
              customer.name,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),
          /*Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${customer.firstName ?? ""} ${customer.lastName}',
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
                        'ID: #${customer.id}',
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
          ),*/

          Expanded(
            flex: 2,
            child: Text(
              truncString(customer.code),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              truncString(customer.notes),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              customer.email ?? "",
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
              customer.phone ?? "",
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
              customer.type.name,
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
              customer.city ?? '',
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
              value: customer.isActive,
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

  String truncString(String? value){
    if(value!= null && value.length > 10){
      return '${value.substring(0, 15)}...';
    }
    return value ?? '';
  }
}