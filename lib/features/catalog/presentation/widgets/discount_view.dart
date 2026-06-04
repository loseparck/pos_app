import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/dialog_action.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/presentation/widgets/discounts/discount_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/products/confirmation_dialog.dart';

class DiscountView extends ConsumerStatefulWidget {
  const DiscountView({super.key});

  @override
  ConsumerState<DiscountView> createState() => _DiscountViewState();
}

class _DiscountViewState extends ConsumerState<DiscountView> {

  String? selectedCategoryId;
  String searchQuery = "";
  int searchType = 0;

  int currentPage = 0;
  int rowsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(productsProvider.notifier);
    final state = ref.watch(productsProvider);
    final discounts = state.dicounts;

    return Column(
      
      children: [
        const SizedBox(height: 10),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          children: [
            _action("Reduction", onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => DiscountDialog());
            }, color: Colors.green.shade400, icon: Icons.add_circle_outline_rounded),
            _action("Imprimer"),
            _action("PDF"),
            _action("Importer"),
            _action("Exporter"),
            _action("Aide"),
          ],
        ),

        const SizedBox(height: 10),

        /// 🔽 MAIN
        Expanded(
          child: Row(
            children: [
              /// 📄 DROITE
              Expanded(
                child: Column(
                  children: [
                    /// 📊 TABLE
                    Expanded(
                      child: Column(
                        children: [

                          /// TABLE
                          Expanded(
                            child: SingleChildScrollView(
                              child: 
                              SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text("Nom")),
                                    DataColumn(label: Text("Valeur")),
                                    DataColumn(label: Text("Active")),
                                    DataColumn(label: Text("")),
                                  ],
                                  rows: discounts.map((d) {
                                    return DataRow(cells: [
                                      DataCell(Text(d.name)),
                                      DataCell(Text("${d.value ?? '0'} ${d.discountType == DiscountType.amount ? 'DH' : '%'}")),
                                      DataCell(
                                        Switch(
                                            value: d.isActive,
                                            onChanged: (val) async {
                                              try {
                                                await notifier.updateDiscount(d.id, val);
                                              } catch (e) {
                                                if (!context.mounted) return;
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text("Erreur lors de la mise à jour"))
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      DataCell(
                                        IconButton(
                                          color: Colors.red.shade300,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => ConfirmationDialog(
                                                body: "Veillez confirmez la suppression de la Reduction: '${d.name}'",
                                                actions: [
                                                  DialogAction(
                                                    label: "Supprimer",
                                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade200),
                                                    onPressed: () async {
                                                      try {
                                                        await notifier.removeDiscount(d.id);
                                                        if (!context.mounted) return;
                                                        Navigator.pop(context);
                                                      } catch (e) {
                                                        if (!context.mounted) return;
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          const SnackBar(content: Text("Erreur lors de la suppression")),
                                                        );
                                                      }
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.delete_forever_outlined),
                                        ),
                                      ),
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _action(String label, {VoidCallback? onPressed, IconData? icon, Color? color}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 2,
        children: [
          if(icon != null) Icon(icon, color:  Colors.grey.shade800),
          Text(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey.shade800), label),
        ],
      )
    );
  }
}