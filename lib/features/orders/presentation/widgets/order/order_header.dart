import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/orders/data/models/order_extension.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/enums/order_status.dart';


class OrderHeader extends StatelessWidget {
  final Order? order;

  const OrderHeader({
    super.key,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    if (order == null) {
      return const SizedBox(
        height: 56,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Aucune commande",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

     return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Commande #${order!.id.substring(0, 8)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(order!.quantity.articles,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),

        const Spacer(),

        _StatusChip(
          order!.status,
        ),

        //const Spacer(),

        /*Text(
          order!.total.money,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),*/
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final OrderStatus status;

  const _StatusChip(
    this.status,
  );

  @override
  Widget build(BuildContext context) {
    return Chip(

      avatar: Icon(
        status.icon,
        color: Colors.white,
        size: 18,
      ),
      backgroundColor: status.color,
      label: Text(
        status.label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}