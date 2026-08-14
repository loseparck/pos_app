import 'package:flutter/material.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

Future<String?> showTransferTableDialog({
  required BuildContext context,
  required List<Plan> plans,
  required List<RestaurantTable> tables,
  String? currentTableId,
}) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return _TransferTableDialog(
        plans: plans,
        tables: tables,
        currentTableId: currentTableId,
      );
    },
  );
}

class _TransferTableDialog extends StatefulWidget {
  final List<Plan> plans;
  final List<RestaurantTable> tables;
  final String? currentTableId;

  const _TransferTableDialog({
    required this.plans,
    required this.tables,
    this.currentTableId,
  });

  @override
  State<_TransferTableDialog> createState() =>
      _TransferTableDialogState();
}

class _TransferTableDialogState extends State<_TransferTableDialog> {
  int _selectedPlanIndex = 0;
  String? _selectedTableId;

  Plan? get _selectedPlan {
    if (widget.plans.isEmpty) {
      return null;
    }

    if (_selectedPlanIndex >= widget.plans.length) {
      return widget.plans.first;
    }

    return widget.plans[_selectedPlanIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 40,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 800,
          maxHeight: 650,
        ),
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Expanded(
              child: Column(
                children: [
                  _buildPlansSection(),
                  const Divider(height: 1),
                  Expanded(
                    child: _buildTablesSection(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        20,
        24,
        16,
      ),
      child: Row(
        children: [
          const Icon(Icons.swap_horiz),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Transférer la commande',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildPlansSection() {
    if (widget.plans.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Aucun plan disponible.',
        ),
      );
    }

    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choisir un plan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.plans.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final plan = widget.plans[index];
                  final selected =
                      index == _selectedPlanIndex;

                  return _PlanItem(
                    plan: plan,
                    selected: selected,
                    onTap: () {
                      setState(() {
                        _selectedPlanIndex = index;
                        _selectedTableId = null;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTablesSection() {
    if (_selectedPlan == null) {
      return const Center(
        child: Text(
          'Sélectionnez un plan.',
        ),
      );
    }

    if (widget.tables.isEmpty) {
      return Center(
        child: Text(
          'Aucune table dans ${_selectedPlan!.name}.',
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choisir une table',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisExtent: 90,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: widget.tables.where((table) => table.plan.id == _selectedPlan?.id).toList().length,
              itemBuilder: (context, index) {
                final table = widget.tables.where((table) => table.plan.id == _selectedPlan?.id).toList()[index];

                return _TableItem(
                  table: table,
                  selected:
                      table.id == _selectedTableId,
                  isCurrentTable:
                      table.id == widget.currentTableId,
                  onTap: () {
                    if (table.id == widget.currentTableId) {
                      return;
                    }

                    setState(() {
                      _selectedTableId = table.id;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    final canValidate = _selectedTableId != null;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
          const SizedBox(width: 12),
          FilledButton.icon(
            onPressed: canValidate
                ? () {
                    Navigator.of(context).pop(
                      _selectedTableId,
                    );
                  }
                : null,
            icon: const Icon(Icons.check),
            label: const Text('Valider'),
          ),
        ],
      ),
    );
  }
}

class _PlanItem extends StatelessWidget {
  final Plan plan;
  final bool selected;
  final VoidCallback onTap;

  const _PlanItem({
    required this.plan,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context)
                    .colorScheme
                    .primaryContainer
                : Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              plan.name,
              style: TextStyle(
                fontWeight: selected
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TableItem extends StatelessWidget {
  final RestaurantTable table;
  final bool selected;
  final bool isCurrentTable;
  final VoidCallback onTap;

  const _TableItem({
    required this.table,
    required this.selected,
    required this.isCurrentTable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: isCurrentTable ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: selected
                ? colorScheme.primaryContainer
                : isCurrentTable
                    ? colorScheme.surfaceContainerHighest
                    : colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.table_restaurant,
                color: selected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 6),
              Text(
                table.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: selected
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
              if (isCurrentTable) ...[
                const SizedBox(height: 3),
                Text(
                  'Table actuelle',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
