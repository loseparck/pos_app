import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/orders/data/models/order_item_option_extention.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';


class OrderItemOptionTile extends StatelessWidget {
  final OrderItemOption option;

  const OrderItemOptionTile({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        top: 2,
        bottom: 2,
      ),
      child: Row(
        children: [
          Icon(
            Icons.subdirectory_arrow_right,
            size: 12,
            color: Colors.grey.shade500,
          ),

          const SizedBox(width: 6),

          Expanded(
            child: Text(
              option.itemName,
              style: TextStyle(
               // fontSize: 12,
                color: Colors.grey.shade700,
              ),
            ),
          ),

          if (option.quantity > 1)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                option.quantity.quantityLabel,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          Text(
            option.total.money,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}