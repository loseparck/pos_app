import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/presentation/widgets/option_dialog.dart';

class OptionView extends ConsumerStatefulWidget {
  const OptionView({super.key});

  @override
  ConsumerState<OptionView> createState() => _OptionViewState();
}

class _OptionViewState extends ConsumerState<OptionView> {
  bool check1 = false;
  bool check2 = false;

  List<OptionItem> get filteredOptions {
      /// 👉 ROOT = afficher tout
      if (selectedGroupId == null) {
        return [];
      }
      final groups = ref.read(productsProvider.notifier).getItemByOption(selectedGroupId ?? "");

      final result = _applySearch(
        groups.where((p) => selectedGroupId == p.groupId).toList()
      );
      return result;
  }

  List<OptionItem> _applySearch(List<OptionItem> list) {
    return list.where((p) {
      if (searchQuery.isEmpty) return true;

      switch (searchType) {
        case 0:
          return p.name.toLowerCase().contains(searchQuery.toLowerCase());
        case 1:
          return p.price.toString().contains(searchQuery);
        default:
          return true;
      }
    }).toList();
  }

  String? selectedGroupId;
  String searchQuery = "";
  int searchType = 0;

  int currentPage = 0;
  int rowsPerPage = 5;

  /*List<ProductIte> get paginatedProducts {
    final start = currentPage * rowsPerPage;
    final end = start + rowsPerPage;
  
     final pagination = filteredProducts.sublist(
      start,
      end > filteredProducts.length ? filteredProducts.length : end,
    );

    return pagination;
  }*/

  void _openOptionDialog({OptionItem? item}) {
    final nameCtrl = TextEditingController(text: item?.name ?? "");
    final priceCtrl =
        TextEditingController(text: item?.price.toString() ?? "0");
    final tvaCtrl =
        TextEditingController(text: item?.vat.toString() ?? "0");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(item == null ? "Ajouter une option" : "Modifier une Option"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Nom"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Prix (€)"),
              ),
              TextField(
                controller: tvaCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "TVA (€)"),
              ),
            ],
          )
        ),
        
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () {
              if(selectedGroupId != null){
                final notifier = ref.read(productsProvider.notifier);
                
                if (nameCtrl.text.trim().isEmpty) return;

                final newItem = OptionItem(
                  id: item != null ? item.id : '',
                  name: nameCtrl.text.trim(),
                  price: double.tryParse(priceCtrl.text) ?? 0,
                  groupId: selectedGroupId ?? '',
                  vat: double.tryParse(tvaCtrl.text) ?? 0,
                  isActive: item != null ? item.isActive : true
                );
                  if (item != null) {
                     notifier.updateItem(newItem);
                  } else {
                    notifier.addItem(newItem);
                  }
              }
              Navigator.pop(context);
            },
            child: const Text("Valider"),
          ),
        ],
      ),
    );
  }

  Widget confirmationWidget(void Function() onConfirm){
    return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Confirmation Suppression Groupe d'option ?"),
                IconButton(
                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {onConfirm();}, 
                child: const Text(
                  "Supprimer",
                  style: TextStyle(color: Colors.red)
                  ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: const Text("Annuler"),
              ),
            ],
          );
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(productsProvider.notifier);
    return Column(
      children: [
        const SizedBox(height: 10),
        /// 🔝 TOOLBAR
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 8,
          children: [
            _action("Supprimer", onPressed: selectedGroupId == null ? null : () {
              if(selectedGroupId != null) {
                showDialog(
                  context: context,
                  builder: (_) => confirmationWidget(() {
                     notifier.removeOption(selectedGroupId ?? '');
                    selectedGroupId = null;
                    Navigator.pop(context);
                  },),
                );
              }
            }),
            _action("Modifier", onPressed: selectedGroupId == null ? null : () {
              if(selectedGroupId != null) {
                 showDialog(
                  context: context,
                  builder: (_) => OptionDialog(optionId: selectedGroupId),
                );
              }
            }),
            
            _action("Nouveau Groupe", onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => OptionDialog(),
                );
              }
            ),
            _action("Ajouter une option", onPressed: selectedGroupId == null ? null : () {
              if(selectedGroupId != null) {
                _openOptionDialog();
              }
            }),
            _action("Imprimer"),
            _action("PDF"),
            _action("Étiquettes"),
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

              /// 🌳 TREE
              Container(
                alignment: AlignmentGeometry.topCenter,
                width: 250,
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey.shade300)),
                ),
                child: SingleChildScrollView(
                  child: _buildTree(null, 0, ref),
                ),
              ),

              /// 📄 DROITE
              Expanded(
                
                  child: Column(
                    children: [

                    /// 🔍 RECHERCHE
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [

                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Recherche...",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 8),

                          _searchTypeButton("Nom", 0),
                          _searchTypeButton("Prix", 1),
                          _searchTypeButton("Code", 2),
                        ],
                      ),
                    ),
                        // ===== Tableau =====
                    Expanded(
                      child: SingleChildScrollView(
                        child: 
                        SizedBox(
                          width: double.infinity,
                          child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Nom')),
                            DataColumn(label: Text('Prix')),
                            DataColumn(label: Text('TVA')),
                            DataColumn(label: Text('Active')),
                            DataColumn(label: Text('')),
                          ],
                          rows: filteredOptions.map((p) {
                            return DataRow(
                              cells: [
                                DataCell(Text(p.name), onTap: () =>  _openOptionDialog(item: p)),
                                DataCell(Text("${p.price}"), onTap: () =>  _openOptionDialog(item: p)),
                                DataCell(Text("${p.vat}"), onTap: () =>  _openOptionDialog(item: p)),
                                DataCell(
                                  SwitchListTile(
                                      title: const SizedBox(),
                                      value: p.isActive,
                                      contentPadding: EdgeInsets.zero,
                                      onChanged: (val) =>
                                            notifier.updateItem( p = p.copyWith(isActive: val))
                                    ),
                                  ),
                                DataCell(
                                  TextButton(
                                    style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade300),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => confirmationWidget(() {
                                          notifier.removeItem(p.id);
                                          Navigator.pop(context);
                                        },),
                                      );
                                    },
                                    child: Icon(color: Colors.black,
                                      Icons.delete_forever_outlined),
                                  ),
                                ),
                              ]
                            );
                          }).toList(),
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 🔘 ACTION
  Widget _action(String label, {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  /// 🔍 TYPE RECHERCHE
  Widget _searchTypeButton(String label, int index) {
    final selected = searchType == index;

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          setState(() {
            searchType = index;
          });
        },
      ),
    );
  }

  Widget _buildTree(String? parentId, int level, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ref.watch(productsProvider).options.map((g) {

        final isSelected = selectedGroupId == g.id;
          /// 👉 PAS DE FLECHE
          return Padding(
            padding: EdgeInsets.only(left: level * 16),
            child: ListTile(
              title: Row(
                children: [
                  Text(g.name),
                  Spacer(),
                  Icon(Icons.arrow_right)
                ],
              ),
              selectedColor: Colors.black,
              selectedTileColor: Colors.blueGrey.shade100,
              selected: isSelected,
              onTap: () {
                setState(() {
                  selectedGroupId = g.id;
                  currentPage = 0;
                });
              },
            ),
          );
      }).toList(),
    );
  }
}