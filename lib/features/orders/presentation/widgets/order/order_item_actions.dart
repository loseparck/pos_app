import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/presentation/widgets/common/pos_action_dialog.dart';
import 'package:pos_app/features/orders/presentation/widgets/order/show_transfert_table_dialog.dart';
import 'package:pos_app/features/orders/presentation/widgets/product/show_product_note_dialog.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

class OrderItemActions extends ConsumerWidget {
  const OrderItemActions({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final planNotifier = ref.read(planProvider.notifier);
    final orderNotifier = ref.read(ordersProvider.notifier);
    final selectedItemId = ref.watch(selectedOrderItemIdProvider);

    if (selectedItemId == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.grey.shade700,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Quantité
          _ActionButton(
            color: AppColors.primary,
            icon: Icons.remove,
            tooltip: "Diminuer",
            onPressed: () {
              if(ref.read(ordersProvider.notifier).decreaseItemQuantity(selectedItemId)){
                ref.watch(selectedOrderItemIdProvider.notifier).state = null;
              }
            },
          ),

          const SizedBox(width: 8),

          _ActionButton(
            color: AppColors.primary,
            icon: Icons.add,
            tooltip: "Augmenter",
            onPressed: () {
              ref
                  .read(ordersProvider.notifier)
                  .increaseItemQuantity(selectedItemId);
            },
          ),

          const SizedBox(width: 12),

          // Note prend l'espace disponible
          Expanded(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                alignment: Alignment.center,
              ),
              onPressed: () async {
                final note = await showProductNoteDialog(context);
                if(note != null && note.isNotEmpty){
                  ref.read(ordersProvider.notifier).updateComment(
                      selectedItemId, note
                    );
                }
              },
              icon: const Icon(
                Icons.note_alt_outlined,
              ),
              label: const Text(
                "Ajouter une note de commande",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          const SizedBox(width: 12),

          _ActionButton(
            icon: Icons.change_circle,
            tooltip: "Transfert",
            onPressed: () async {
              final targetTableId = await showTransferTableDialog(
                context: context,
                plans: ref.read(planProvider).plans,
                tables: ref.read(planProvider).tables,
                currentTableId: ref.read(planProvider).selectedTableId,
              );

              if (targetTableId != null) {
                RestaurantTable table = planNotifier.getTable(targetTableId);
                if(table.status != TableStatus.empty){
                  await showPosActionDialog<bool>(
                    context: context,
                    title: 'Fusionner la commande ?',
                    content:
                        'La table sélectionnée (${planNotifier.getNameById(targetTableId)}) est déjà occupé, Voulez-vous Fusionner les 2 tables ?',
                    actions: [
                      const PosDialogAction<bool>(
                        label: 'Annuler',
                        onPressed: null,
                      ),
                      PosDialogAction<bool>(
                        label: 'Fusionner',
                        icon: Icons.swap_horiz,
                        onPressed: () { orderNotifier.switcheOrderItem(selectedItemId, targetTableId);},
                      ),
                    ],
                  );
                } else {
                  await showPosActionDialog<bool>(
                    context: context,
                    title: 'Transférer la commande ?',
                    content:
                        'La commande sera transférée vers la table sélectionnée (${planNotifier.getNameById(targetTableId)}).',
                    actions: [
                      const PosDialogAction<bool>(
                        label: 'Annuler',
                        onPressed: null,
                      ),
                      PosDialogAction<bool>(
                        label: 'Transférer',
                        icon: Icons.swap_horiz,
                        onPressed: () { orderNotifier.switcheOrderItem(selectedItemId, targetTableId);},
                      ),
                    ],
                  );
                }
                ref.read(selectedOrderItemIdProvider.notifier).state = null;
              }

/*

                  ref.read(ordersProvider.notifier).switcheOrderItem(
                      selectedItemId, note
                    );*/
            },
          ),

          const SizedBox(width: 8),

          _ActionButton(
            icon: Icons.tune,
            tooltip: "Options",
            onPressed: () {
              // TODO ouvrir options
            },
          ),

          const SizedBox(width: 8),

          _ActionButton(
            icon: Icons.delete_outline,
            tooltip: "Supprimer",
            color: Colors.red,
            onPressed: () {
              ref.read(ordersProvider.notifier).removeItemFromOrder(
                    selectedItemId,
                  );
              ref.read(selectedOrderItemIdProvider.notifier).state = null;
            },
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final String? tooltip;

  const _ActionButton({
    required this.icon,
    required this.onPressed,
    this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color != null ? color!.withValues(alpha: .12) : Colors.white,
            border: Border.all(
              color: color ?? Colors.grey.shade400,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 20,
            color: color ?? Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}