import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import '../common/summary_row.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary({
    super.key,
  });

  @override
Widget build(BuildContext context, WidgetRef ref) {
  final subtotal = ref.watch(orderSubtotalProvider);
  final vat = ref.watch(orderVatProvider);
  final total = ref.watch(orderTotalProvider);

  return Container(
    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2, top: 2),

    decoration: BoxDecoration(
      //color: Colors.white,
      borderRadius: BorderRadius.circular(12),

      border: Border.all(
        color: Colors.grey.shade300,
        width: 3,
      ),
    ),

    child: Column(
      children: [

        SummaryRow(
          title: "Sous-total",
          value: subtotal.money,
        ),

        const SizedBox(height: 8),

        SummaryRow(
          title: "TVA",
          value: vat.money,
        ),

        const Divider(height: 24),

        SummaryRow(
          title: "TOTAL",
          value: total.money,
          isTotal: true,
        ),
      ],
    ),
  );
}
}