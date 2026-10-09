import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';

class DeliveryOrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback? onTap;

  const DeliveryOrderCard({
    super.key,
    required this.order,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: order.status.color,
        ),
      ),
      color: order.status.color.withValues(alpha: 0.3),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,12,16,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Commande #${order.id}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '${getItemCounts()} article(s)',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "${fromCentstoString(order.total)} DH",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF059669),
                    ),
                  ),
                  Spacer(),
                  Text(
                    order.status.label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: order.status.color,
                    ),
                  ),
                ],
              )
              
            ],
          ),
        )
      ),
    );
  }

  int getItemCounts(){
    int count = 0;
    for (OrderItem item in order.items) {
      count += item.quantity;
    }
    return count;
  }
}