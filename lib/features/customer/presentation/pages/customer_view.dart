/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/empty_state.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/header_text.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository_provider.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';
import 'package:pos_app/features/customer/presentation/widgets/discounts/customer_form_dialog.dart.dart';
import 'package:pos_app/features/customer/presentation/widgets/discounts/customer_row.dart';

class CustomerView extends ConsumerStatefulWidget{

  const CustomerView({
    super.key,
  });

  @override
  ConsumerState<CustomerView> createState() =>
      _CustomerViewState();
}

class _CustomerViewState
    extends ConsumerState<CustomerView> with WidgetsBindingObserver{

  bool _isKeyboardVisible = false;
  String _search = '';
  String _sortBy = 'Nom';
  bool _ascending = true;

  @override
  Widget build(BuildContext context) {
    final filtredCustomers = _filteredAndSortedCustomer;
    
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _buildCustomersToolbar(),

          const SizedBox(height: 14),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE7E5EF),
                ),
              ),
              child: Column(
                children: [
                  _buildSearchAndSort(),

                  const Divider(
                    height: 1,
                    color: Color(0xFFEAEAF0),
                  ),

                  _buildTableHeader(),

                  const Divider(
                    height: 1,
                    color: Color(0xFFEAEAF0),
                  ),

                  Expanded(
                    child: filtredCustomers.isEmpty
                        ? EmptyState(title: 'Aucun client', subTitle: 'Aucun client ne correspond à votre recherche.')
                        : ListView.separated(
                            itemCount: filtredCustomers.length,
                            separatorBuilder: (_, __) =>
                                const Divider(
                              height: 1,
                              color: Color(0xFFF0F0F4),
                            ),
                            itemBuilder: (_, index) {
                              final customer =
                                  filtredCustomers[index];

                              return CustomerRow(
                                customer: customer,
                                onEdit:  () {_editCustomer(customer);},
                                onDelete: () {_confirmDeleteItem(customer);},
                                onToggle:  (value) {ref.read(customersProvider.notifier).updateCustomer(customer.copyWith(isActive: value));},
                              );
                            },
                          ),
                  ),
                  if(!_isKeyboardVisible)
                    _buildPagination(filtredCustomers.length),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Customer> get _filteredAndSortedCustomer {
    Iterable<Customer> result = ref.watch(customersProvider).customers;

    if (_search.isNotEmpty) {
      final query = _search.toLowerCase();

      result = result.where(
        (customer) {
          return customer.lastName
                  .toLowerCase()
                  .contains(query) ||
            (customer.firstName != null && customer.firstName!
                .toLowerCase()
                .contains(query)) ||
            (customer.companyName != null && customer.companyName!.toLowerCase().contains(query)) ||
            (customer.email != null && customer.email!.contains(query)) ||
            (customer.phone != null && customer.phone!.contains(query)) ||
            (customer.secondaryPhone != null && customer.secondaryPhone!.contains(query)) ||
            (customer.city != null && customer.city!.contains(query)) ||
            (customer.siren != null && customer.siren!.contains(query)) ||
            (customer.siret != null && customer.siret!.contains(query)) ||
            (customer.code != null && customer.code!.contains(query)) ||
            (customer.vatNumber != null && customer.vatNumber!.contains(query)) ||
            (customer.addressComplement != null && customer.addressComplement!.contains(query)) ||
            (customer.postalCode != null && customer.postalCode!.contains(query)) ||
            (customer.notes != null && customer.notes!.contains(query)) ||
            (customer.address != null && customer.address!.toLowerCase().contains(query))
            ;
        },
      );
    }

    final customers = result.toList();

    customers.sort(
      (a, b) {
        int comparison;

        switch (_sortBy) {
          case 'Code':
            comparison = (a.code ?? "").compareTo(b.code ?? "");
            break;
          case 'Email':
            comparison = (a.email ?? "").compareTo(b.email ?? "");
            break;
          case 'Phone':
            comparison = (a.phone ?? "").compareTo(b.phone ?? "");
            break;
          case 'Ville': 
            comparison = (a.city ?? "").compareTo(b.city ?? "");
            break;
          case 'Type': 
            comparison = (a.type.name).compareTo(b.type.name);
            break;
          case 'Nom':
          default:
            comparison = a.name.compareTo(b.name);
        }

        return _ascending
            ? comparison
            : -comparison;
      },
    );

    return customers;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(customersProvider.notifier).load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = View.of(context).viewInsets.bottom;
    final newValue = bottomInset > 0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  Widget _buildCustomersToolbar() {
    return Row(
      children: [
        ActionButton(
          icon: Icons.add_box_outlined,
          label: 'Nouveau Client',
          primary: true,
          onPressed: _addCustomer,
        ),

        const Spacer(),

        ActionButton(
          icon: Icons.print_outlined,
          label: 'Imprimer',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.picture_as_pdf_outlined,
          label: 'PDF',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.download_outlined,
          label: 'Importer',
          onPressed: () {},
        ),

        const SizedBox(width: 8),

        ActionButton(
          icon: Icons.upload_outlined,
          label: 'Exporter',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchAndSort() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _search = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText:
                    'Rechercher un client, code, description ou type...',
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
                        onPressed: () {
                          setState(() {
                            _search = '';
                          });
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                        ),
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFFF8F8FC),
                contentPadding:
                    const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Color(0xFF8B5CF6),
                    width: 1.3,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          const Text(
            'Trier par',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(width: 8),

          Container(
            height: 46,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _sortBy,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
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
                    child: Text('Phone'),
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
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _sortBy = value;
                  });
                },
              ),
            ),
          ),

          const SizedBox(width: 8),

          Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              tooltip: _ascending
                  ? 'Croissant'
                  : 'Décroissant',
              onPressed: () {
                setState(() {
                  _ascending = !_ascending;
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
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      child: Row(
        children: [

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Nom',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Code',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Note',
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
              'Phone',
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

  Widget _buildPagination(int count) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Text(
            'Affichage de 1 à $count sur $count clients',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_left_rounded,
            ),
          ),

          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF5B21B6),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right_rounded,
            ),
          ),

          const SizedBox(width: 12),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Row(
              children: [
                Text(
                  '10 / page',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 17,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addCustomer() async {
    final Customer? newCustomer = await showDialog<Customer>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomerFormDialog(
          onSubmit: (customer) {
            Navigator.of(context).pop(customer);
          },
        );
      },
    );
    
    print("customer $newCustomer");

    if (newCustomer == null) return;

    ref.read(customersProvider.notifier).addCustomer(newCustomer);
  }

  void _editCustomer(Customer customer) async {
    final Customer? newCustomer = await showDialog<Customer>(
      context: context,
      barrierDismissible: false,
      
      builder: (context) {
        return CustomerFormDialog(
          initialData: customer,
          onSubmit: (customer) {
            Navigator.of(context).pop(customer);
          },
        );
      },
    );
    
    print("customer $newCustomer");

    if (newCustomer == null) return;

    ref.read(customersProvider.notifier).updateCustomer(newCustomer);
  }

  Future<void> _confirmDeleteItem(
    Customer customer,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Supression d'un client!",
          ),
          content: Text(
            "le client ${customer.lastName} ${customer.firstName ?? ""} sera supprimé.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Annuler'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      ref.read(customersProvider.notifier).removeCustomer(customer.id);
    }
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/empty_state.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/header_text.dart';
import 'package:pos_app/features/customer/data/repositories/customer_repository_provider.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';
import 'package:pos_app/features/customer/presentation/widgets/discounts/customer_form_dialog.dart.dart';
import 'package:pos_app/features/customer/presentation/widgets/discounts/customer_row.dart';

class CustomerView extends ConsumerStatefulWidget {
  const CustomerView({
    super.key,
  });

  @override
  ConsumerState<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends ConsumerState<CustomerView>
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

    ref.read(customersProvider.notifier).load();
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
    final customers = _filteredAndSortedCustomer;

    final totalCustomers = customers.length;

    final totalPages = totalCustomers == 0
        ? 1
        : (totalCustomers / _pageSize).ceil();

    if (_currentPage > totalPages) {
      _currentPage = totalPages;
    }

    final startIndex = totalCustomers == 0
        ? 0
        : (_currentPage - 1) * _pageSize;

    final endIndex = totalCustomers == 0
        ? 0
        : (startIndex + _pageSize > totalCustomers
            ? totalCustomers
            : startIndex + _pageSize);

    final paginatedCustomers = totalCustomers == 0
        ? <Customer>[]
        : customers.sublist(
            startIndex,
            endIndex,
          );

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _buildCustomersToolbar(
            totalCustomers,
          ),

          const SizedBox(height: 16),

          Expanded(
            child: _buildCustomersTable(
              paginatedCustomers,
              totalCustomers,
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

  List<Customer> get _filteredAndSortedCustomer {
    Iterable<Customer> result =
        ref.watch(customersProvider).customers;

    if (_search.isNotEmpty) {
      final query = _search.toLowerCase();

      result = result.where(
        (customer) {
          return customer.lastName
                  .toLowerCase()
                  .contains(query) ||
              (customer.firstName != null &&
                  customer.firstName!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.companyName != null &&
                  customer.companyName!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.email != null &&
                  customer.email!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.phone != null &&
                  customer.phone!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.secondaryPhone != null &&
                  customer.secondaryPhone!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.city != null &&
                  customer.city!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.siren != null &&
                  customer.siren!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.siret != null &&
                  customer.siret!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.code != null &&
                  customer.code!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.vatNumber != null &&
                  customer.vatNumber!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.addressComplement != null &&
                  customer.addressComplement!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.postalCode != null &&
                  customer.postalCode!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.notes != null &&
                  customer.notes!
                      .toLowerCase()
                      .contains(query)) ||
              (customer.address != null &&
                  customer.address!
                      .toLowerCase()
                      .contains(query));
        },
      );
    }

    final customers = result.toList();

    customers.sort(
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

    return customers;
  }

  // ---------------------------------------------------------------------------
  // MAIN TABLE
  // ---------------------------------------------------------------------------

  Widget _buildCustomersTable(
    List<Customer> customers,
    int totalCustomers,
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
            totalCustomers,
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
            child: customers.isEmpty
                ? EmptyState(
                    title: 'Aucun client',
                    subTitle:
                        _search.isNotEmpty
                            ? 'Aucun client ne correspond à votre recherche.'
                            : 'Aucun client n’a encore été ajouté.',
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: customers.length,
                    separatorBuilder: (_, __) {
                      return const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFF1F5F9),
                      );
                    },
                    itemBuilder: (_, index) {
                      final customer = customers[index];

                      return CustomerRow(
                        customer: customer,
                        onEdit: () {
                          _editCustomer(customer);
                        },
                        onDelete: () {
                          _confirmDeleteItem(customer);
                        },
                        onToggle: (value) {
                          ref
                              .read(
                                customersProvider.notifier,
                              )
                              .updateCustomer(
                                customer.copyWith(
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
              totalCustomers: totalCustomers,
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

  Widget _buildCustomersToolbar(
    int totalCustomers,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ActionButton(
          icon: Icons.add_rounded,
          label: 'Nouveau client',
          primary: true,
          onPressed: _addCustomer,
        ),

        const SizedBox(width: 14),

        Text(
          '$totalCustomers ${totalCustomers <= 1 ? 'client' : 'clients'}',
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
    int totalCustomers,
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
                      'Rechercher un client, code, email, téléphone...',
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
              'Nom',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Code',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Note',
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
    required int totalCustomers,
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
            totalCustomers == 0
                ? 'Aucun client'
                : 'Affichage de ${startIndex + 1} à $endIndex sur $totalCustomers',
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

  Future<void> _addCustomer() async {
    final Customer? newCustomer =
        await showDialog<Customer>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomerFormDialog(
          onSubmit: (customer) {
            Navigator.of(context).pop(customer);
          },
        );
      },
    );

    if (newCustomer == null) return;

    ref
        .read(customersProvider.notifier)
        .addCustomer(newCustomer);
  }

  // ---------------------------------------------------------------------------
  // EDIT
  // ---------------------------------------------------------------------------

  Future<void> _editCustomer(
    Customer customer,
  ) async {
    final Customer? newCustomer =
        await showDialog<Customer>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomerFormDialog(
          initialData: customer,
          onSubmit: (customer) {
            Navigator.of(context).pop(customer);
          },
        );
      },
    );

    if (newCustomer == null) return;

    ref
        .read(customersProvider.notifier)
        .updateCustomer(newCustomer);
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> _confirmDeleteItem(
    Customer customer,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final customerName =
            '${customer.lastName} ${customer.firstName ?? ''}'
                .trim();

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
                'Supprimer le client',
              ),
            ],
          ),
          content: Text(
            'Le client "$customerName" sera supprimé. '
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
          .read(customersProvider.notifier)
          .removeCustomer(customer.id);
    }
  }
}