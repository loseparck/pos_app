import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

class ProductOptionDialog extends StatefulWidget {
  final Product product;
  final void Function(Map<String, List<Item>>) onSelected;

  const ProductOptionDialog({
    super.key,
    required this.product,
    required this.onSelected,
  });

  @override
  State<ProductOptionDialog> createState() =>
      _ProductOptionDialogState();
}

class _ProductOptionDialogState
    extends State<ProductOptionDialog> {

  Map<String, List<Item>> selectedOptions = {};

  double get totalOptionsPrice {
    return selectedOptions.values
        .expand((e) => e)
        .fold(0.0, (sum, o) => sum + o.price);
  }

  @override
  Widget build(BuildContext context) {

    final groups = widget.product.options!;

    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              MediaQuery.of(context).size.height * 0.85,
          maxWidth: 600,
        ),
        child: Column(
          children: [

            /// HEADER
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${(widget.product.price + totalOptionsPrice).toStringAsFixed(2)} €",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            /// CONTENT
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: groups.map((group) {

                  final selected =
                      selectedOptions[group.id] ?? [];

                  return Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      /// GROUP HEADER
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            group.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${selected.length}/${group.maxToSelect}",
                            style: TextStyle(
                              color: selected.length <
                                          group.minToSelect &&
                                      group.isMandatory
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// OPTIONS
                      ...group.items.map((opt) {

                        final count = selected
                            .where((e) => e.id == opt.id)
                            .length;

                        final isMaxReached =
                            selected.length >=
                                group.maxToSelect;

                        final alreadySelected =
                            selected.any(
                                (e) => e.id == opt.id);

                        final canAdd =
                            !isMaxReached &&
                            (group.multipleSelect ||
                                !alreadySelected);

                        return Card(
                          child: ListTile(
                            title: Text(opt.name),
                            subtitle: Text(
                                "+${opt.price.toStringAsFixed(2)} €"),

                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [

                                /// -
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: count > 0
                                      ? () {
                                          setState(() {
                                            final index =
                                                selected.indexWhere(
                                                    (e) =>
                                                        e.id ==
                                                        opt.id);

                                            if (index != -1) {
                                              selected.removeAt(
                                                  index);
                                            }

                                            selectedOptions[
                                                group.id] = selected;
                                          });
                                        }
                                      : null,
                                ),

                                Text("$count"),

                                /// +
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: canAdd
                                      ? () {
                                          setState(() {
                                            selected.add(opt);
                                            selectedOptions[
                                                group.id] = selected;
                                          });
                                        }
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      const SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
            ),

            /// FOOTER ACTIONS
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [

                  /// ANNULER
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.pop(context),
                      child: const Text("Annuler"),
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// VALIDER
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _canValidate(groups)
                          ? () {
                              widget.onSelected(
                                  selectedOptions);
                              Navigator.pop(context);
                            }
                          : null,
                      child: const Text("Ajouter"),
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

  bool _canValidate(List<Option> groups) {

    for (final group in groups) {

      final selected =
          selectedOptions[group.id] ?? [];

      if (group.isMandatory &&
          selected.length < group.minToSelect) {
        return false;
      }

      if (selected.length < group.minToSelect) {
        return false;
      }

      if (selected.length > group.maxToSelect) {
        return false;
      }
    }

    return true;
  }
}
/*
class ProductOptionDialog extends StatefulWidget {
  final Product product;
  final void Function(Map<String, List<OptionItem>>) onSelected;

  const ProductOptionDialog({
    super.key,
    required this.product,
    required this.onSelected,
  });

  @override
  State<ProductOptionDialog> createState() =>
      _ProductOptionDialogState();
}

class _ProductOptionDialogState
    extends State<ProductOptionDialog> {

  int currentStep = 0;

  /// groupId -> list d'options sélectionnées
  Map<String, List<OptionItem>> selectedOptions = {};

  @override
  Widget build(BuildContext context) {

    final groups = widget.product.options!;

    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              MediaQuery.of(context).size.height * 0.8,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                widget.product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Stepper(
                  currentStep: currentStep,

                  onStepContinue: () {
                    final group = groups[currentStep];

                    final selected =
                        selectedOptions[group.id] ?? [];

                    /// VALIDATION
                    if (group.isMandatory &&
                        selected.isEmpty) {
                      _showError(
                          "Choix obligatoire");
                      return;
                    }

                    if (selected.length <
                        group.minToSelect) {
                      _showError(
                          "Minimum ${group.minToSelect}");
                      return;
                    }

                    if (selected.length >
                        group.maxToSelect) {
                      _showError(
                          "Maximum ${group.maxToSelect}");
                      return;
                    }

                    if (currentStep <
                        groups.length - 1) {
                      setState(() => currentStep++);
                    } else {
                      widget.onSelected(selectedOptions);
                      Navigator.pop(context);
                    }
                  },

                  onStepCancel: () {
                    if (currentStep > 0) {
                      setState(() => currentStep--);
                    } else {
                      Navigator.pop(context);
                    }
                  },

                  steps: groups.map((group) {

                    final selected =
                        selectedOptions[group.id] ?? [];

                    return Step(
                      title: Text(group.name),

                      subtitle: Text(
                        "min:${group.minToSelect} max:${group.maxToSelect}",
                      ),

                      content: Column(
                        children: group.options.map((opt) {
                          final isMaxReached = selected.length >= group.maxToSelect;
                          final alreadySelected =
                            selected.any((e) => e.id == opt.id);

                          final canAdd = !isMaxReached && ( group.multipleSelect || !alreadySelected);
                          final count = selected
                              .where((e) => e.id == opt.id)
                              .length;

                          return ListTile(
                            title: Text(
                                "${opt.name} (+${opt.price}€)"),

                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [

                                /// -
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: count > 0
                                    ? () {
                                        setState(() {
                                          final index = selected.indexWhere(
                                              (e) => e.id == opt.id);

                                          if (index != -1) {
                                            selected.removeAt(index);
                                          }

                                          selectedOptions[group.id] = selected;
                                        });
                                      }
                                    : null,
                                ),

                                Text("$count"),

                                /// +
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: canAdd ? () {
                                    final totalSelected = selected.length;

                                    /// max global atteint
                                    if (totalSelected >= group.maxToSelect) {
                                      _showError("Maximum atteint (${group.maxToSelect})");
                                      return;
                                    }

                                    /// pas de doublon autorisé
                                    if (!group.multipleSelect &&
                                        selected.any((e) => e.id == opt.id)) {
                                      _showError("Option déjà sélectionnée");
                                      return;
                                    }

                                    setState(() {
                                      selected.add(opt);
                                      selectedOptions[group.id] = selected;
                                    });
                                  } : null,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                      isActive:
                          currentStep == groups.indexOf(group),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}*/