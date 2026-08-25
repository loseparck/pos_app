import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/pos_action_button.dart';


class PaymentPanel extends StatelessWidget {
  final Order? order;

  final VoidCallback? onSave;

  final VoidCallback? onCancel;

  final VoidCallback? onPay;

  const PaymentPanel({
    super.key,
    this.order,
    this.onSave,
    this.onCancel,
    this.onPay,
  });

  @override
Widget build(BuildContext context) {

  return Row(
    children: [

      Expanded(
        child: PosActionButton(
          icon: Icons.close_rounded,
          label: "Annuler",
          color: Colors.red,
          onPressed: () {},
          //onPressed: hasOrder ? onCancel : null,
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: PosActionButton(
          icon: Icons.check_circle_outline,
          label: "Valider",
          color: AppColors.success,
          //onPressed: () {},
          onPressed: onSave,
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: PosActionButton(
          icon: Icons.print_rounded,
          label: "Ticket",
          color: AppColors.primaryLight,
          textColor: AppColors.primary,
          onPressed: () {},
          //onPressed: hasOrder ? onPay : null,
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: PosActionButton(
          icon: Icons.payments_outlined,
          label: "Payer",
          color: AppColors.primary,
          onPressed: () {},
          //onPressed: hasOrder ? onPay : null,
        ),
      ),
    ],
  );
}
}