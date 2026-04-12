import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/data/demo_products.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';
import 'package:pos_app/features/catalog/presentation/widgets/option_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/option_item_dialog.dart';

class OptionView extends StatefulWidget {
  const OptionView({super.key});

  @override
  State<OptionView> createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
  bool check1 = false;
  bool check2 = false;

  List<OptionItem> get filteredOptions {
      /// 👉 ROOT = afficher tout
      if (selectedGroupId == null) {
        return [];
      }

      return _applySearch(
        demoOptions.where((p) => selectedGroupId == p.id).first.items
      );
  }

  /*List<Product> get filteredProducts {
    List<String> groupIds = [];

    /// 👉 ROOT = afficher tout
    if (selectedGroupId == null) {
      return _applySearch(demoProducts);
    }

    //groupIds = _getAllChildrenIds(selectedGroupId!);

    return _applySearch(
      demoProducts.where((p) => groupIds.contains(p.groupId)).toList(),
    );
  }*/

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

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        /// 🔝 TOOLBAR
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 8,
          children: [
            _action("Actualiser"),
            _action("Nouveau groupe d'option", onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => OptionDialog(),
                );
              }
            ),
            _action("Ajouter une option"),
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
                  child: _buildTree(null, 0),
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
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Nom')),
                            DataColumn(label: Text('Prix')),
                            DataColumn(label: Text('TVA')),
                            DataColumn(label: Text('Active')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: filteredOptions.map((p) {
                            return DataRow(cells: [
                              DataCell(Text(p.name)),
                              DataCell(Text("${p.price}")),
                              DataCell(Text("${p.vat}")),
                              DataCell(Text(p.enabled ? "oui": "non")),
                              DataCell(
                                TextButton(
                                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.orange.shade400),
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (_) => OptionItemDialog(option: p, groupeId: selectedGroupId ?? ""),
                                    );
                                  },
                                  child: Icon(Icons.edit),
                                ),
                              ),
                              DataCell(
                                TextButton(
                                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade300),
                                  onPressed: (){},
                                  /*onPressed: () {
                                    notifier.startEdition();
                                    ref.read(editModeProvider.notifier).state = true;
                                  },*/
                                  child: Icon(color: Colors.black,
                                    Icons.delete_forever_outlined),
                                ),
                              ),
                            ]);
                          }).toList(),
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

// ===== Widget ligne texte =====
  Widget _buildTextRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===== Widget ligne checkbox =====
  Widget _buildCheckboxRow(String label, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
            flex: 3,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
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

  Widget _buildTree(String? parentId, int level) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: demoOptions.map((g) {

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