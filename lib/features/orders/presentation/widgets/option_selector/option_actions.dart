import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OptionActions extends ConsumerWidget {

  final bool isFirst;
  final bool isLast;
  final double total;
  final VoidCallback onCancel;
  final VoidCallback? onPrevious;
  final VoidCallback onNext;

  const OptionActions({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.total,
    required this.onCancel,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              child:
                  const Text(
                    "Annuler",
                  ),
            ),
          ),

          if(!isFirst) ...[
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPrevious,
                icon:
                    const Icon(
                      Icons.arrow_back,
                    ),
                label:
                    const Text(
                      "Précédent",
                    ),
              ),
            ),
          ],

          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: FilledButton.icon(
              onPressed: onNext,
              icon:
                  Icon(
                    isLast
                        ? Icons.check
                        : Icons.arrow_forward,
                  ),
              label: Text(
                isLast
                    ? total > 0
                        ? "Ajouter +${total.toStringAsFixed(2)} €"
                        : "Ajouter"
                    : "Suivant",
              ),
            ),
          ),
        ],
      ),
    );
  }

}