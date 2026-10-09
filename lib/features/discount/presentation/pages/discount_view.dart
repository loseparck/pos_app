import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/discount/data/repositories/discount_repository_provider.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';

import 'package:pos_app/features/discount/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/empty_state.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/header_text.dart';
import 'package:pos_app/features/discount/presentation/widgets/discount_dialog.dart';
import 'package:pos_app/features/discount/presentation/widgets/discount_row.dart';

class DiscountView extends ConsumerStatefulWidget{

  const DiscountView({
    super.key,
  });

  @override
  ConsumerState<DiscountView> createState() =>
      _DiscountViewState();
}

class _DiscountViewState
    extends ConsumerState<DiscountView> with WidgetsBindingObserver{

  bool _isKeyboardVisible = false;
  String _search = '';
  String _sortBy = 'Nom';
  bool _ascending = true;

  @override
  Widget build(BuildContext context) {
    final filtredDiscounts = _filteredAndSortedDiscount;
    final discountNotifier = ref.read(discountsProvider.notifier);
    
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _buildDiscountsToolbar(),

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
                    child: filtredDiscounts.isEmpty
                        ? EmptyState(title: 'Aucune Réduction', subTitle: 'Aucun réduction ne correspond à votre recherche.')
                        : ListView.separated(
                            itemCount: filtredDiscounts.length,
                            separatorBuilder: (_, __) =>
                                const Divider(
                              height: 1,
                              color: Color(0xFFF0F0F4),
                            ),
                            itemBuilder: (_, index) {
                              final discount =
                                  filtredDiscounts[index];

                              return DiscountRow(
                                discount: discount,
                                onEdit:  () {_editDiscount(discount);},
                                onDelete: () {_confirmDeleteItem(discount);},
                                onToggle:  (value) {discountNotifier.toggleDiscount(discount.id, value);},
                              );
                            },
                          ),
                  ),
                  if(!_isKeyboardVisible)
                    _buildPagination(filtredDiscounts.length),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Discount> get _filteredAndSortedDiscount {
    Iterable<Discount> result = ref.watch(discountsProvider).discounts;

    if (_search.isNotEmpty) {
      final query = _search.toLowerCase();

      result = result.where(
        (discount) {
          return discount.name
                  .toLowerCase()
                  .contains(query) ||
            (discount.description != null && discount.description!
                .toLowerCase()
                .contains(_search.toLowerCase())) ||
            (discount.code != null && discount.code!.contains(_search)) ||
            discount.type.label.toLowerCase().contains(_search.toLowerCase()) ||
            discount.activation.label.toLowerCase().contains(_search.toLowerCase()) ||
            discount.scope.label.toLowerCase().contains(_search.toLowerCase()) ||
            (discount.quantityPromotion != null && discount.quantityPromotion!.rewardType.label.toLowerCase().contains(_search.toLowerCase()))
            ;
        },
      );
    }

    final discounts = result.toList();

    discounts.sort(
      (a, b) {
        int comparison;

        switch (_sortBy) {
          case 'Type':
            comparison = a.type.label.compareTo(b.type.label);
            break;

          case 'Code':
            comparison = (a.code ?? "").compareTo(
              b.code ?? "",
            );
            break;

          case 'Mode':
             comparison = a.activation.label.compareTo(b.activation.label);
            break;

          case 'Scope':
             comparison = a.scope.label.compareTo(b.scope.label);
            break;

          case 'Nom':
          default:
            comparison = a.name
                .toLowerCase()
                .compareTo(
                  b.name.toLowerCase(),
                );
        }

        return _ascending
            ? comparison
            : -comparison;
      },
    );

    return discounts;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(discountsProvider.notifier).load();
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

  Widget _buildDiscountsToolbar() {
    return Row(
      children: [
        ActionButton(
          icon: Icons.add_box_outlined,
          label: 'Nouvelle Réduction',
          primary: true,
          onPressed: _addDiscount,
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
                    'Rechercher une réduction, code, description ou type...',
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
                    value: 'Mode',
                    child: Text('Mode'),
                  ),
                  DropdownMenuItem(
                    value: 'Scope',
                    child: Text('Scope'),
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
            flex: 4,
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
            flex: 3,
            child: HeaderText(
              'Description',
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
              'Scope',
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
            'Affichage de 1 à $count sur $count réductions',
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

  void _addDiscount() async {
    final Discount? newDiscount = await showDialog<Discount>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return DiscountDialog(
          products: ref.read(productsProvider).products,
          categories: ref.read(productsProvider).categories,
          onSubmit: (discount) {
            Navigator.of(context).pop(discount);
          },
        );
      },
    );
    
    if (newDiscount == null) return;

    ref.read(discountsProvider.notifier).addDiscount(newDiscount);
  }

  void _editDiscount(Discount discount) async {
    final Discount? newDiscount = await showDialog<Discount>(
      context: context,
      barrierDismissible: false,
      
      builder: (context) {
        return DiscountDialog(
          products: ref.read(productsProvider).products,
          categories: ref.read(productsProvider).categories,
          initialData: discount,
          onSubmit: (discount) {
            Navigator.of(context).pop(discount);
          },
        );
      },
    );
    
    if (newDiscount == null) return;

    ref.read(discountsProvider.notifier).updateDiscount(newDiscount);
  }

  Future<void> _confirmDeleteItem(
    Discount discount,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Supression d'une réduction!",
          ),
          content: Text(
            "la réduction ${discount.name} sera supprimé.",
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
      ref.read(discountsProvider.notifier).removeDiscount(discount.id);
    }
  }
}