import 'package:flutter/material.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/pos_card.dart';


import 'order_header.dart';
import 'order_items_list.dart';
import 'order_summary.dart';

class OrderPanel extends StatelessWidget {
  final Order? order;

  const OrderPanel({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return PosCard(
      child: Column(
        children: [
          OrderHeader(order: order),

          SizedBox(height: 6),

          const Expanded(
            child: OrderItemsList(),
          ),

          const Divider(),

          const OrderSummary(),

          SizedBox(height: 6),

          //const PaymentPanel(),
        ],
      ),
    );
  }
}