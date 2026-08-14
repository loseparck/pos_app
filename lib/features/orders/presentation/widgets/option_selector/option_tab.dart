import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';


class OptionTab extends ConsumerWidget {

  final Option option;
  final bool selected;
  final VoidCallback onTap;

  const OptionTab({
    super.key,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final notifier =
        ref.read(
          optionSelectionProvider.notifier,
        );

    final selectedCount =
        ref.watch(
          optionSelectionProvider.select(
            (state) =>
                state.totalSelected(
                  option.id,
                ),
          ),
        );

    final validation =
        notifier.validateOption(
          option,
        );

    final isCompleted =
        validation.isValid &&
        selectedCount > 0;

    final hasError =
        !validation.isValid &&
        selectedCount == 0 &&
        option.isMandatory;

    final colors = Theme.of(context).colorScheme;

    Color background = colors.surface;

    Color border = colors.outlineVariant;

    Color textColor = colors.onSurface;

    IconData icon = Icons.radio_button_unchecked;

    if(selected) {
      background = colors.primaryContainer;
      border = colors.primary;
      textColor = colors.onPrimaryContainer;
    }

    if(isCompleted) {
      icon = Icons.check_circle;
    }

    if(hasError) {
      icon = Icons.error;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration:
            const Duration(
              milliseconds: 200,
            ),
        width: 170,
        padding:
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
        decoration: BoxDecoration(
          color: background,
          borderRadius:
              BorderRadius.circular(
                16,
              ),
          border: Border.all(
            color: border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: textColor,
            ),

            const SizedBox( width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    option.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(
                              fontWeight:
                                  FontWeight.w700,
                              color:
                                  textColor,
                            ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    _buildSubtitle(
                      selectedCount,
                    ),
                    style:
                        Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color:
                                  textColor.withValues(alpha: .7),
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildSubtitle(
    int count,
  ) {
    //if(option.maxToSelect != null) {
      return "$count / ${option.maxToSelect}";
    /*}

    if(count == 0) {
      return option.isMandatory
          ? "Obligatoire"
          : "Facultatif";
    }
    return "$count sélection";*/
  }
}