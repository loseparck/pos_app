import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/data/demo_products.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/product_group.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<Product> get filteredProducts {
    List<String> groupIds = [];

    /// 👉 ROOT = afficher tout
    if (selectedGroupId == null) {
      return _applySearch(demoProducts);
    }

    groupIds = _getAllChildrenIds(selectedGroupId!);

    return _applySearch(
      demoProducts.where((p) => groupIds.contains(p.groupId)).toList(),
    );
}

List<Product> _applySearch(List<Product> list) {
  return list.where((p) {
    if (searchQuery.isEmpty) return true;

    switch (searchType) {
      case 0:
        return p.name.toLowerCase().contains(searchQuery.toLowerCase());
      case 1:
        return p.price.toString().contains(searchQuery);
      case 2:
        return p.codeBarres != null ? p.codeBarres!.contains(searchQuery) : false;
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

  List<Product> get paginatedProducts {
    final start = currentPage * rowsPerPage;
    final end = start + rowsPerPage;
  
     final pagination = filteredProducts.sublist(
      start,
      end > filteredProducts.length ? filteredProducts.length : end,
    );

    return pagination;
  }

  /// 🔁 Récupérer tous les enfants
  List<String> _getAllChildrenIds(String parentId) {
    final result = <String>[];

    void collect(String id) {
      result.add(id);

      final children =
          demoGroups.where((g) => g.parentId == id).toList();

      for (var child in children) {
        collect(child.id);
      }
    }

    collect(parentId);
    return result;
  }

  /// 🌳 récupérer enfants directs
  List<ProductGroup> _getChildren(String? parentId) {
    return demoGroups.where((g) => g.parentId == parentId).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// 🔝 TOOLBAR
        Wrap(
          spacing: 8,
          children: [
            _action("Actualiser"),
            _action("Nouveau groupe"),
            _action("Modifier groupe"),
            //_action("Supprimer groupe"),
            _action("Nouveau produit"),
            _action("Modifier produit"),
            //_action("Supprimer produit"),
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
                  child: _buildTreeRoot(),
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

                    /// 📊 TABLE
                    Expanded(
                      child: Column(
                        children: [

                          /// TABLE
                          Expanded(
                            child: SingleChildScrollView(
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text("ID")),
                                  DataColumn(label: Text("Nom")),
                                  DataColumn(label: Text("Groupe")),
                                  DataColumn(label: Text("Prix")),
                                  DataColumn(label: Text("Code barre")),
                                ],
                                rows: paginatedProducts.map((p) {
                                  return DataRow(cells: [
                                    DataCell(Text(p.id)),
                                    DataCell(Text(p.name)),
                                    DataCell(Text(_getGroupName(p.groupId ?? ""))),
                                    DataCell(Text("${p.price} €")),
                                    DataCell(Text(p.codeBarres ?? "")),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),

                          /// 📄 PAGINATION
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              IconButton(
                                icon: const Icon(Icons.chevron_left),
                                onPressed: currentPage > 0
                                    ? () {
                                        setState(() {
                                          currentPage--;
                                        });
                                      }
                                    : null,
                              ),

                              Text("Page ${currentPage + 1}"),

                              IconButton(
                                icon: const Icon(Icons.chevron_right),
                                onPressed:
                                    (currentPage + 1) * rowsPerPage < filteredProducts.length
                                        ? () {
                                            setState(() {
                                              currentPage++;
                                            });
                                          }
                                        : null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    /*Expanded(
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text("ID")),
                            DataColumn(label: Text("Nom")),
                            DataColumn(label: Text("Groupe")),
                            DataColumn(label: Text("Prix")),
                            DataColumn(label: Text("Code barre")),
                          ],
                          rows: filteredProducts.map((p) {
                            return DataRow(cells: [
                              DataCell(Text(p.id)),
                              DataCell(Text(p.name)),
                              DataCell(Text(_getGroupName(p.groupId ?? ""))),
                              DataCell(Text("${p.price} €")),
                              DataCell(Text(p.codeBarres ?? "")),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),*/
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
  Widget _action(String label) {
    return ElevatedButton(
      onPressed: () {},
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

  /// 🔎 Nom groupe
  String _getGroupName(String id) {
    return demoGroups.firstWhere((g) => g.id == id).name;
  }

  Widget _buildTreeRoot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🌟 ROOT
        ListTile(
          title: const Text(
            "Produits",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          selected: selectedGroupId == null,
          onTap: () {
            setState(() {
              selectedGroupId = null;
              currentPage = 0;
            });
          },
        ),

        /// 🌳 GROUPES
        _buildTree(null, 0),
      ],
    );
  }

  Widget _buildTree(String? parentId, int level) {
    final children = _getChildren(parentId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.map((g) {
        final subChildren = _getChildren(g.id);
        final hasChildren = subChildren.isNotEmpty;

        final isSelected = selectedGroupId == g.id;

        if (!hasChildren) {
          /// 👉 PAS DE FLECHE
          return Padding(
            padding: EdgeInsets.only(left: level * 16),
            child: ListTile(
              title: Text(g.name),
              selected: isSelected,
              onTap: () {
                setState(() {
                  selectedGroupId = g.id;
                  currentPage = 0;
                });
              },
            ),
          );
        }

        /// 👉 AVEC FLECHE
        return Padding(
          padding: EdgeInsets.only(left: level * 16),
          child: ExpansionTile(
            title: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGroupId = g.id;
                  currentPage = 0;
                });
              },
              child: Container(
                color: isSelected
                    ? Colors.blue.withOpacity(0.2)
                    : null,
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(g.name),
              ),
            ),
            children: [
              _buildTree(g.id, level + 1),
            ],
          ),
        );
      }).toList(),
    );
  }
}