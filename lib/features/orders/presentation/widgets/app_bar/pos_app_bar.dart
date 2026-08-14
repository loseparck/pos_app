import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/pos_action_button.dart';

class PosAppBar extends StatelessWidget {
  final Order? order;
  final String? tableId;

  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final VoidCallback? onPay;
  final VoidCallback? onClean;
  final VoidCallback? onTransfert;
  final VoidCallback? onTicket;

  const PosAppBar({
    super.key,
    required this.order,
    this.tableId,
    required this.onSave,
    this.onCancel,
    this.onPay,
    this.onClean,
    this.onTransfert,
    this.onTicket,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Colors.white,
      child: SizedBox(
        height: 72,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
             /* const Icon(
                Icons.point_of_sale_rounded,
                size: 30,
              ),
              const SizedBox(width: 12),
              const Text(
                "Point de vente",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),*/

              const SizedBox(width: 8),
              /// ANNULER
              Expanded(
                child: PosActionButton(
                  icon: Icons.close_rounded,
                  label: "Annuler",
                  color: Colors.red,
                  onPressed: onCancel,
                ),
              ),

              const SizedBox(width: 8),

              /// ENREGISTRER
              Expanded(
                child: PosActionButton(
                  icon: Icons.check_circle_outline,
                  label: "Valider",
                  color: AppColors.success,
                  //onPressed: () {},
                  onPressed: onSave,
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: PosActionButton(
                  icon: Icons.cleaning_services,
                  label: "Clean",
                  color: AppColors.warning,
                  //onPressed: () {},
                  onPressed: onClean,
                ),
              ),
              
              const Spacer(),

              Expanded(
                child: PosActionButton(
                  icon: Icons.change_circle,
                  label: "Transfert",
                  color: AppColors.primary,
                  //onPressed: () {},
                  onPressed: onTransfert,
                ),
              ),

              const Spacer(),

              Expanded(
                child: PosActionButton(
                  icon: Icons.print_rounded,
                  label: "Ticket",
                  color: AppColors.primaryLight,
                  textColor: AppColors.primary,
                  //onPressed: () {},
                  onPressed: onTicket,
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: PosActionButton(
                  icon: Icons.payments_outlined,
                  label: "Payer",
                  color: AppColors.primary,
                  //onPressed: () {},
                  onPressed: onPay,
                ),
              ),

              const SizedBox(width: 8),

             // const Spacer(),
              _InfoCard(
                icon: Icons.table_restaurant,
                title: "Table",
                value: tableId ?? "-",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {Navigator.pop(context);}, // 2. Action au clic
          borderRadius: BorderRadius.circular(12), // Respecte les arrondis
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black54,
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
