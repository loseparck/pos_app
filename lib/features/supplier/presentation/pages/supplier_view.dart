import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/empty_state.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/header_text.dart';
import 'package:pos_app/features/supplier/data/repositories/supplier_repository_provider.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';
import 'package:pos_app/features/supplier/presentation/widgets/supplier_form_dialog.dart';
import 'package:pos_app/features/supplier/presentation/widgets/supplier_row.dart';

class SupplierView extends ConsumerStatefulWidget {
  const SupplierView({
    super.key,
  });

  @override
  ConsumerState<SupplierView> createState() => _SupplierViewState();
}

class _SupplierViewState extends ConsumerState<SupplierView>
    with WidgetsBindingObserver {
  final TextEditingController _searchController =
      TextEditingController();

  bool _isKeyboardVisible = false;

  String _search = '';
  String _sortBy = 'Nom';
  bool _ascending = true;

  int _currentPage = 1;
  int _pageSize = 10;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    ref.read(suppliersProvider.notifier).load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchController.dispose();

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final bottomInset = View.of(context).viewInsets.bottom;
    final newValue = bottomInset > 0;

    if (newValue != _isKeyboardVisible && mounted) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final suppliers = _filteredAndSortedSupplier;

    final totalSuppliers = suppliers.length;

    final totalPages = totalSuppliers == 0
        ? 1
        : (totalSuppliers / _pageSize).ceil();

    if (_currentPage > totalPages) {
      _currentPage = totalPages;
    }

    final startIndex = totalSuppliers == 0
        ? 0
        : (_currentPage - 1) * _pageSize;

    final endIndex = totalSuppliers == 0
        ? 0
        : (startIndex + _pageSize > totalSuppliers
            ? totalSuppliers
            : startIndex + _pageSize);

    final paginatedSuppliers = totalSuppliers == 0
        ? <Supplier>[]
        : suppliers.sublist(
            startIndex,
            endIndex,
          );

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _buildSuppliersToolbar(
            totalSuppliers,
          ),

          const SizedBox(height: 16),

          Expanded(
            child: _buildSuppliersTable(
              paginatedSuppliers,
              totalSuppliers,
              startIndex,
              endIndex,
              totalPages,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // DATA
  // ---------------------------------------------------------------------------

  List<Supplier> get _filteredAndSortedSupplier {
    Iterable<Supplier> result =
        ref.watch(suppliersProvider).suppliers;

    if (_search.isNotEmpty) {
      final query = _search.toLowerCase();

      result = result.where(
        (supplier) {
          return supplier.name.toLowerCase() .contains(query) ||
              (supplier.commercialName != null && supplier.commercialName!.toLowerCase().contains(query)) ||
              (supplier.code != null && supplier.code!.toLowerCase() .contains(query)) ||
              (supplier.siren != null && supplier.siren!.toLowerCase().contains(query)) ||
              (supplier.siret != null && supplier.siret!.toLowerCase().contains(query)) ||
              (supplier.vatNumber != null && supplier.vatNumber!.toLowerCase().contains(query)) ||
              (supplier.contactFirstName != null && supplier.contactFirstName!.toLowerCase().contains(query)) ||
              (supplier.contactLastName != null && supplier.contactLastName!.toLowerCase().contains(query)) ||
              (supplier.contactJob != null && supplier.contactJob!.toLowerCase().contains(query)) ||
              (supplier.email != null && supplier.email!.toLowerCase().contains(query)) ||
              (supplier.phone != null && supplier.phone!.toLowerCase().contains(query)) ||
              (supplier.secondaryPhone != null && supplier.secondaryPhone!.toLowerCase().contains(query)) ||
              (supplier.address != null && supplier.address!.toLowerCase().contains(query)) ||
              (supplier.addressComplement != null && supplier.addressComplement!.toLowerCase().contains(query)) ||
              (supplier.postalCode != null && supplier.postalCode!.toLowerCase().contains(query)) ||
              (supplier.city != null && supplier.city!.toLowerCase().contains(query)) ||
              (supplier.notes != null && supplier.notes!.toLowerCase().contains(query)) ||
              supplier.type.name.toLowerCase().contains(query);
        },
      );
    }

    final suppliers = result.toList();

    suppliers.sort(
      (a, b) {
        int comparison;

        switch (_sortBy) {
          case 'Code':
            comparison = (a.code ?? '').compareTo(
              b.code ?? '',
            );
            break;

          case 'Email':
            comparison = (a.email ?? '').compareTo(
              b.email ?? '',
            );
            break;

          case 'Phone':
            comparison = (a.phone ?? '').compareTo(
              b.phone ?? '',
            );
            break;

          case 'Ville':
            comparison = (a.city ?? '').compareTo(
              b.city ?? '',
            );
            break;

          case 'Type':
            comparison = a.type.name.compareTo(
              b.type.name,
            );
            break;

          case 'Nom':
          default:
            comparison = a.name.compareTo(
              b.name,
            );
        }

        return _ascending
            ? comparison
            : -comparison;
      },
    );

    return suppliers;
  }

  // ---------------------------------------------------------------------------
  // MAIN TABLE
  // ---------------------------------------------------------------------------

  Widget _buildSuppliersTable(
    List<Supplier> suppliers,
    int totalSuppliers,
    int startIndex,
    int endIndex,
    int totalPages,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildSearchAndSort(
            totalSuppliers,
          ),

          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEAEAF0),
          ),

          _buildTableHeader(),

          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEAEAF0),
          ),

          Expanded(
            child: suppliers.isEmpty
                ? EmptyState(
                    title: 'Aucun fournisseur',
                    subTitle:
                        _search.isNotEmpty
                            ? 'Aucun fournisseur ne correspond à votre recherche.'
                            : 'Aucun fournisseur n’a encore été ajouté.',
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: suppliers.length,
                    separatorBuilder: (_, __) {
                      return const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFF1F5F9),
                      );
                    },
                    itemBuilder: (_, index) {
                      final supplier = suppliers[index];

                      return SupplierRow(
                        supplier: supplier,
                        onEdit: () {
                          _editSupplier(supplier);
                        },
                        onDelete: () {
                          _confirmDeleteItem(supplier);
                        },
                        onToggle: (value) {
                          ref
                              .read(
                                suppliersProvider.notifier,
                              )
                              .updateSupplier(
                                supplier.copyWith(
                                  isActive: value,
                                ),
                              );
                        },
                      );
                    },
                  ),
          ),

          if (!_isKeyboardVisible)
            _buildPagination(
              totalSuppliers: totalSuppliers,
              startIndex: startIndex,
              endIndex: endIndex,
              totalPages: totalPages,
            ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // TOOLBAR
  // ---------------------------------------------------------------------------

  Widget _buildSuppliersToolbar(
    int totalSuppliers,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ActionButton(
          icon: Icons.add_rounded,
          label: 'Nouveau fournisseur',
          primary: true,
          onPressed: _addSupplier,
        ),

        const SizedBox(width: 14),

        Text(
          '$totalSuppliers ${totalSuppliers <= 1 ? 'fournisseur' : 'fournisseurs'}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF64748B),
          ),
        ),

        const Spacer(),

        ActionButton(
          icon: Icons.file_download_outlined,
          label: 'Importer',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.file_upload_outlined,
          label: 'Exporter',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        _buildMoreActionsButton(),
      ],
    );
  }

  Widget _buildMoreActionsButton() {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: PopupMenuButton<String>(
        tooltip: 'Autres actions',
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.more_horiz_rounded,
          size: 21,
          color: Color(0xFF475569),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onSelected: (value) {
          switch (value) {
            case 'print':
              // TODO: Impression
              break;

            case 'pdf':
              // TODO: Export PDF
              break;
          }
        },
        itemBuilder: (context) {
          return const [
            PopupMenuItem<String>(
              value: 'print',
              child: Row(
                children: [
                  Icon(
                    Icons.print_outlined,
                    size: 19,
                    color: Color(0xFF475569),
                  ),
                  SizedBox(width: 12),
                  Text('Imprimer'),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'pdf',
              child: Row(
                children: [
                  Icon(
                    Icons.picture_as_pdf_outlined,
                    size: 19,
                    color: Color(0xFF475569),
                  ),
                  SizedBox(width: 12),
                  Text('Exporter en PDF'),
                ],
              ),
            ),
          ];
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // SEARCH + SORT
  // ---------------------------------------------------------------------------

  Widget _buildSearchAndSort(
    int totalSuppliers,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        14,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 44,
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _search = value.trim();
                    _currentPage = 1;
                  });
                },
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF1E293B),
                ),
                decoration: InputDecoration(
                  hintText:
                      'Rechercher un fournisseur, code, email, téléphone...',
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    size: 20,
                    color: Color(0xFF64748B),
                  ),
                  suffixIcon: _search.isNotEmpty
                      ? IconButton(
                          tooltip: 'Effacer',
                          onPressed: () {
                            _searchController.clear();

                            setState(() {
                              _search = '';
                              _currentPage = 1;
                            });
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            size: 17,
                            color: Color(0xFF64748B),
                          ),
                        )
                      : null,
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFFE2E8F0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFFE2E8F0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF8B5CF6),
                      width: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          _buildSortSelector(),

          const SizedBox(width: 8),

          _buildSortDirectionButton(),
        ],
      ),
    );
  }

  Widget _buildSortSelector() {
    return Container(
      height: 44,
      padding: const EdgeInsets.only(
        left: 12,
        right: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Trier par',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(width: 6),

          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _sortBy,
              isDense: true,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
                color: Color(0xFF475569),
              ),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Nom',
                  child: Text('Nom'),
                ),
                DropdownMenuItem(
                  value: 'Code',
                  child: Text('Code'),
                ),
                DropdownMenuItem(
                  value: 'Email',
                  child: Text('Email'),
                ),
                DropdownMenuItem(
                  value: 'Phone',
                  child: Text('Téléphone'),
                ),
                DropdownMenuItem(
                  value: 'Ville',
                  child: Text('Ville'),
                ),
                DropdownMenuItem(
                  value: 'Type',
                  child: Text('Type'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  _sortBy = value;
                  _currentPage = 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortDirectionButton() {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: IconButton(
        tooltip: _ascending
            ? 'Ordre croissant'
            : 'Ordre décroissant',
        onPressed: () {
          setState(() {
            _ascending = !_ascending;
            _currentPage = 1;
          });
        },
        icon: Icon(
          _ascending
              ? Icons.arrow_upward_rounded
              : Icons.arrow_downward_rounded,
          size: 18,
          color: const Color(0xFF5B21B6),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // TABLE HEADER
  // ---------------------------------------------------------------------------

  Widget _buildTableHeader() {
    return Container(
      color: const Color(0xFFFAFAFC),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: HeaderText(
              'Nom Sociéte',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Nom Contact',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Siret',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Email',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Téléphone',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Type',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Ville',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Statut',
            ),
          ),

          const SizedBox(
            width: 60,
            child: HeaderText(
              'Actions',
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // PAGINATION
  // ---------------------------------------------------------------------------

  Widget _buildPagination({
    required int totalSuppliers,
    required int startIndex,
    required int endIndex,
    required int totalPages,
  }) {
    final hasPrevious = _currentPage > 1;
    final hasNext = _currentPage < totalPages;

    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFEAEAF0),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            totalSuppliers == 0
                ? 'Aucun fournisseur'
                : 'Affichage de ${startIndex + 1} à $endIndex sur $totalSuppliers',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          _buildPaginationButton(
            icon: Icons.chevron_left_rounded,
            enabled: hasPrevious,
            onPressed: hasPrevious
                ? () {
                    setState(() {
                      _currentPage--;
                    });
                  }
                : null,
          ),

          const SizedBox(width: 4),

          _buildCurrentPage(),

          const SizedBox(width: 4),

          _buildPaginationButton(
            icon: Icons.chevron_right_rounded,
            enabled: hasNext,
            onPressed: hasNext
                ? () {
                    setState(() {
                      _currentPage++;
                    });
                  }
                : null,
          ),

          const SizedBox(width: 14),

          _buildPageSizeSelector(),
        ],
      ),
    );
  }

  Widget _buildPaginationButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 34,
      height: 34,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: enabled ? onPressed : null,
        icon: Icon(
          icon,
          size: 20,
          color: enabled
              ? const Color(0xFF475569)
              : const Color(0xFFCBD5E1),
        ),
      ),
    );
  }

  Widget _buildCurrentPage() {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF5B21B6),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        '$_currentPage',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildPageSizeSelector() {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: _pageSize,
          isDense: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 17,
            color: Color(0xFF64748B),
          ),
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF334155),
            fontWeight: FontWeight.w500,
          ),
          items: const [
            DropdownMenuItem(
              value: 10,
              child: Text('10 / page'),
            ),
            DropdownMenuItem(
              value: 20,
              child: Text('20 / page'),
            ),
            DropdownMenuItem(
              value: 50,
              child: Text('50 / page'),
            ),
            DropdownMenuItem(
              value: 100,
              child: Text('100 / page'),
            ),
          ],
          onChanged: (value) {
            if (value == null) return;

            setState(() {
              _pageSize = value;
              _currentPage = 1;
            });
          },
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // ADD
  // ---------------------------------------------------------------------------

  Future<void> _addSupplier() async {
    final Supplier? newSupplier =
        await showDialog<Supplier>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SupplierFormDialog(
          onSubmit: (supplier) {
            Navigator.of(context).pop(supplier);
          },
        );
      },
    );

    if (newSupplier == null) return;

    ref
        .read(suppliersProvider.notifier)
        .addSupplier(newSupplier);
  }

  // ---------------------------------------------------------------------------
  // EDIT
  // ---------------------------------------------------------------------------

  Future<void> _editSupplier(
    Supplier supplier,
  ) async {
    final Supplier? newSupplier =
        await showDialog<Supplier>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SupplierFormDialog(
          initialData: supplier,
          onSubmit: (supplier) {
            Navigator.of(context).pop(supplier);
          },
        );
      },
    );

    if (newSupplier == null) return;

    ref
        .read(suppliersProvider.notifier)
        .updateSupplier(newSupplier);
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> _confirmDeleteItem(
    Supplier supplier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final supplierName = supplier.name.trim();

        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFDC2626),
                size: 24,
              ),
              SizedBox(width: 10),
              Text(
                'Supprimer le fournisseur',
              ),
            ],
          ),
          content: Text(
            'Le fournisseur "$supplierName" sera supprimé. '
            'Cette action est irréversible.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  false,
                );
              },
              child: const Text(
                'Annuler',
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
              },
              child: const Text(
                'Supprimer',
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      ref
          .read(suppliersProvider.notifier)
          .removeSupplier(supplier.id);
    }
  }
}