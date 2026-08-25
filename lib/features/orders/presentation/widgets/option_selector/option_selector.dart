import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/entities/order_item_option.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_actions.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_constraints.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_dialog_header.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_error_banner.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_item_grid.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_summary.dart';
import 'package:pos_app/features/orders/presentation/widgets/option_selector/option_tabs.dart';


class OptionSelector extends ConsumerStatefulWidget {
  final String title;
  final List<Option> options;


  const OptionSelector({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  ConsumerState<OptionSelector> createState() =>
      _OptionSelectorState();
}

class _OptionSelectorState
    extends ConsumerState<OptionSelector> {
  int _currentIndex = 0;

  String? _error;

  Option get _currentOption =>
      widget.options[_currentIndex];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 950,
          maxHeight: 720,
        ),
        child: Column(
          children: [

            /// Header
            OptionDialogHeader(
              title: widget.title,
              onClose: () {
                ref.read(optionSelectionProvider.notifier).clear();

                Navigator.pop(context);
              },
            ),

            const Divider(height: 1),

            /// Tabs
            OptionTabs(
              options: widget.options,
              currentIndex: _currentIndex,
              onSelected: (index) {
                setState(() {
                  _currentIndex = index;
                  _error = null;
                });
              },
            ),

            /// Contraintes
            OptionConstraints(
              option: _currentOption,
            ),

            /// Erreur
            OptionErrorBanner(
              message: _error,
            ),

            /// Liste des items
            Expanded(
              child: AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 250),
                child: OptionItemGrid(
                  key: ValueKey(_currentOption.id),
                  option: _currentOption,
                ),
              ),
            ),

            const Divider(height: 1),

            /// Résumé
            OptionSummary(
              options: widget.options,
            ),

            /// Boutons
            OptionActions(
              total: _totalSelectedPrice,
              isFirst: _currentIndex == 0,
              isLast: _currentIndex ==
                  widget.options.length - 1,
              onCancel: () {
                ref.read(optionSelectionProvider.notifier).clear();
                Navigator.pop(context);
              },
              onPrevious: () {
                setState(() {
                  _currentIndex--;
                  _error = null;
                });
              },
              onNext: _next,
            ),
          ],
        ),
      ),
    );
  }

  double get _totalSelectedPrice {
  double total = 0;

  final state = ref.watch(optionSelectionProvider);

  for (final option in widget.options) {
    final selection = state.selectedItems[option.id];

    if (selection == null) continue;

    for (final item in option.items) {
      final qty = selection.quantityOf(item.id);

      if (qty <= 0) continue;

      total += item.additionalPrice * qty;
    }
  }

  return total;
}

  void _next() {
    final notifier =
        ref.read(optionSelectionProvider.notifier);

    final validation = notifier.validate(
      optionId: _currentOption.id,
      isRequired: _currentOption.isMandatory,
      minToSelect: _currentOption.minSelection,
      maxToSelect: _currentOption.maxSelection,
    );

    if (!validation.isValid) {
      setState(() {
        _error = validation.message;
      });
      return;
    }

    if (_currentIndex < widget.options.length - 1) {
      setState(() {
        _currentIndex++;
        _error = null;
      });
      return;
    }

    final List<OrderItemOption> result =
        notifier.buildOrderOptions(widget.options);

    notifier.clear();

    Navigator.pop(context, result);
  }
}