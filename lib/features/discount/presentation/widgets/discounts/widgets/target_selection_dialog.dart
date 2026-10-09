import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/features/catalog/domain/entities/selection_item.dart';

class TargetSelectionDialog extends StatefulWidget {
  final String title;
  final List<SelectionItem> items;
  final Set<String> initialSelectedIds;
  final bool isUnique;

  const TargetSelectionDialog({
    super.key, 
    required this.title,
    required this.items,
    required this.initialSelectedIds,
    this.isUnique = false,
  });

  @override
  State<TargetSelectionDialog> createState() =>
      TargetSelectionDialogState();
}

class TargetSelectionDialogState
    extends State<TargetSelectionDialog> {
  late Set<String> _selectedIds;

  final TextEditingController _searchController =
      TextEditingController();

  String _search = '';

  @override
  void initState() {
    super.initState();

    _selectedIds =
        Set<String>.from(widget.initialSelectedIds);

    _searchController.addListener(() {
      setState(() {
        _search = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SelectionItem> get _filteredItems {
    if (_search.isEmpty) {
      return widget.items;
    }

    return widget.items
        .where(
          (item) =>
              item.name.toLowerCase().contains(_search),
        )
        .toList();
  }

  void _toggleItem(String id) {
    setState(() {
      if(widget.isUnique){
         if (_selectedIds.contains(id)) {
          _selectedIds.remove(id);
        } else {
          _selectedIds = {id};
        }
      } else {
        if (_selectedIds.contains(id)) {
          _selectedIds.remove(id);
        } else {
          _selectedIds.add(id);
        }
      }
    });
  }

  void _selectAll() {
    setState(() {
      _selectedIds = widget.items
          .map((item) => item.id)
          .toSet();
    });
  }

  void _clearAll() {
    setState(() {
      _selectedIds.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 40,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 850,
          maxHeight: 700,
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  20,
                  18,
                  18,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.discountPurpleLight,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.checklist_rounded,
                        color: AppColors.discountPurple,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${_selectedIds.length} sélectionné${_selectedIds.length > 1 ? 's' : ''}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () =>
                          Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              const Divider(
                height: 1,
                color: AppColors.discountBorder,
              ),

              // SEARCH + ACTIONS
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Rechercher...',
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                          suffixIcon:
                              _search.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        _searchController
                                            .clear();
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 18,
                                      ),
                                    )
                                  : null,
                          filled: true,
                          fillColor:
                              const Color(0xFFF8FAFC),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    if(!widget.isUnique) ...[
                      const SizedBox(width: 10),
                      
                      TextButton(
                        onPressed: _selectAll,
                        child: const Text('Tout sélectionner'),
                      ),

                      TextButton(
                        onPressed: _clearAll,
                        child: const Text('Tout retirer'),
                      ),
                    ]
                  ],
                ),
              ),

              const Divider(
                height: 1,
                color: AppColors.discountBorder,
              ),

              // LISTE
              Expanded(
                child: _filteredItems.isEmpty
                    ? const Center(
                        child: Text(
                          'Aucun élément trouvé',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        itemCount: _filteredItems.length,
                        separatorBuilder: (_, __) =>
                            const Divider(
                          height: 1,
                          color: Color(0xFFF1F5F9),
                        ),
                        itemBuilder: (_, index) {
                          final item =
                              _filteredItems[index];

                          final selected =
                              _selectedIds.contains(
                            item.id,
                          );

                          return InkWell(
                            onTap: () =>
                                _toggleItem(item.id),
                            borderRadius:
                                BorderRadius.circular(10),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selected
                                    ? AppColors.discountPurple
                                        .withOpacity(.05)
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: selected,
                                    activeColor:
                                        AppColors.discountPurple,
                                    onChanged: (_) =>
                                        _toggleItem(
                                      item.id,
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration:
                                        BoxDecoration(
                                      color: const Color(
                                        0xFFF1F5F9,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(
                                        9,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.inventory_2_outlined,
                                      size: 19,
                                      color: selected
                                          ? AppColors.discountPurple
                                          : const Color(
                                              0xFF64748B,
                                            ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style:
                                          const TextStyle(
                                        fontSize: 13,
                                        fontWeight:
                                            FontWeight.w500,
                                        color:
                                            Color(0xFF1E293B),
                                      ),
                                    ),
                                  ),

                                  if (selected)
                                    const Icon(
                                      Icons.check_circle,
                                      size: 20,
                                      color:
                                          AppColors.discountPurple,
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const Divider(
                height: 1,
                color: AppColors.discountBorder,
              ),

              // FOOTER
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      '${_selectedIds.length} élément${_selectedIds.length > 1 ? 's' : ''} sélectionné${_selectedIds.length > 1 ? 's' : ''}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),

                    const Spacer(),

                    OutlinedButton(
                      onPressed: () =>
                          Navigator.pop(context),
                      child: const Text('Annuler'),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton.icon(
                      onPressed: () =>
                          Navigator.pop(
                        context,
                        _selectedIds,
                      ),
                      icon: const Icon(
                        Icons.check,
                        size: 18,
                      ),
                      label: const Text('Valider'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.discountPurple,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}