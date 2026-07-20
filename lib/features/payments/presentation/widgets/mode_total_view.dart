import 'package:flutter/material.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'shared_widgets.dart';
import 'discount_selector_widget.dart';

class ModeTotalView extends StatelessWidget {
  final Function()? updateTotalAmount;
  final double totalAmount;
  final String discount;
  final double discountAmount;
  final double totalVAT;

  const ModeTotalView({super.key, 
    required this.totalAmount,
    required this.discount,
    required this.discountAmount,
    required this.totalVAT,
    required this.updateTotalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DiscountSelectorWidget(updateTotalAmount: updateTotalAmount, mode: PaymentMode.total),
        const SizedBox(height: 12),
        Row(
          children: [
            buildInfoCard("Sous-total", "${totalAmount.toStringAsFixed(2)} €"),
            buildInfoCard("Réduction", "-$discount", textColor: Colors.red),
            buildInfoCard("TVA", "${totalVAT.toStringAsFixed(2)} €"),
            buildInfoCard("À encaisser", "${discountAmount.toStringAsFixed(2)} €", isHighlight: true),
          ],
        ),
      ],
    );
  }
}