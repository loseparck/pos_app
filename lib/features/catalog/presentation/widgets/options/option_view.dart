import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/empty_state.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/header_text.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/tree_action_button.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/item_row.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_group_dialog.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_item_dialog.dart';

class OptionView extends ConsumerStatefulWidget {

  const OptionView({
    super.key,
  });

  @override
  ConsumerState<OptionView> createState() =>
      _OptionViewState();
}

class _OptionViewState
    extends ConsumerState<OptionView> with WidgetsBindingObserver{

  Option? _selectedOption;
  bool _isKeyboardVisible = false;
  String _searchOption = '';
  String _searchItem = '';
  String _sortBy = 'Nom';
  bool _ascending = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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

  @override
  Widget build(BuildContext context) {
    final filtredItems = _filteredAndSortedItems;
    final filtredOption = _filteredOptions;
    return Row(
        children: [
           Expanded(
            flex: 2,
            child: Container(
              width: 250,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(
                    color: Color(0xFFE8E7F0),
                  ),
                ),
              ),
              child: Column(
                children: [
                  _buildHeader(),
                  _buildSearch(),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _buildTree(filtredOption),
                  ),
                  _buildAddButton(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: _builItemsArea(filtredItems),
          ),
        ],
      );
  }

  List<Option> get _filteredOptions {
    Iterable<Option> result = ref.watch(productsProvider).options;

    if (_searchOption.isNotEmpty) {
      final query = _searchOption.toLowerCase();

      result = result.where(
        (option) {
          return option.name
                  .toLowerCase()
                  .contains(query) ||
            (option.description != null && option.description!
                .toLowerCase()
                .contains(_searchOption.toLowerCase()));
        },
      );
    }

    final options = result.toList();

    options.sort(
      (a, b) {
        return a.name
                .toLowerCase()
                .compareTo(
                  b.name.toLowerCase(),
                );
      },
    );
    return options;
  }

  List<Item> get _filteredAndSortedItems {
    Iterable<Item> result = ref.read(productsProvider).items;

    if(_selectedOption == null){
      return [];
    }

    result = result.where(
      (item) =>
          item.option.id == _selectedOption!.id
    );


    if (_searchItem.isNotEmpty) {
      final query = _searchItem.toLowerCase();

      result = result.where(
        (item) {
          return item.name
                  .toLowerCase()
                  .contains(query) ||
            (item.sku != null && item.sku!
                .toLowerCase()
                .contains(_searchItem.toLowerCase())) ||
            (item.description != null && item.description!.contains(_searchItem)) ||
            item.additionalPrice.toString().contains(_searchItem);
        },
      );
    }

    final items = result.toList();

    items.sort(
      (a, b) {
        int comparison;

        switch (_sortBy) {
          case 'Supplement':
            comparison = a.additionalPrice.compareTo(b.additionalPrice);
            break;

          case 'Ordre':
            comparison = a.displayOrder.compareTo(b.displayOrder);
            break;

          case 'Sku':
            comparison = (a.sku ?? "").compareTo(
              b.sku ?? "",
            );
            break;

          case 'Etat':
            comparison = (b.active ? 1 : 0).compareTo(a.active ? 1 : 0);
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

    return items;
  }

  Widget _builItemsArea(
    List<Item> items,
  ) {
    final productNotifier = ref.read(productsProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _buildItemsToolbar(),

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
                    child: items.isEmpty
                        ? EmptyState(title: 'Aucun Item', subTitle: 'Aucun Item ne correspond à votre recherche.')
                        : ListView.separated(
                            itemCount: items.length,
                            separatorBuilder: (_, __) =>
                                const Divider(
                              height: 1,
                              color: Color(0xFFF0F0F4),
                            ),
                            itemBuilder: (_, index) {
                              final item =
                                  items[index];
          
                              return ItemRow(
                                item: item,
                                onEdit: () {_editItem(item);},
                                onDelete: () {_confirmDeleteItem(item);},
                                onToggle: (value) {productNotifier.updateItem( item.copyWith(active: value));},
                              );
                            },
                          ),
                  ),
                  if(!_isKeyboardVisible)
                    _buildPagination(
                      items.length,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsToolbar() {
    return Row(
      children: [
        ActionButton(
          icon: Icons.add_box_outlined,
          label: 'Nouvelle Item',
          primary: true,
          onPressed: _selectedOption != null ? _addItem : null,
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
                  _searchItem = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText:
                    'Rechercher un item, SKU ou description...',
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF94A3B8),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 20,
                  color: Color(0xFF64748B),
                ),
                suffixIcon: _searchItem.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _searchItem = '';
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
                    value: 'Supplement',
                    child: Text('Supplement'),
                  ),
                  DropdownMenuItem(
                    value: 'Ordre',
                    child: Text('Ordre'),
                  ),
                  DropdownMenuItem(
                    value: 'Etat',
                    child: Text('Etat'),
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
              'Item',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'SKU',
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
              'Supplement',
            ),
          ),

          const Expanded(
            flex: 1,
            child: HeaderText(
              'Ordre',
            ),
          ),

          const Expanded(
            flex: 2,
            child: HeaderText(
              'Etat',
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
            'Affichage de 1 à $count sur $count produits',
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

  void _addOption() async {
    final option = await OptionGroupDialog.show(
      context : context,
    );

    if (option != null) {
      print("nouveau group : $option");
      ref.read(productsProvider.notifier).addOption(option);
    }
  }

  void _editOption(
    Option option,
  ) async {
    final updatedOption = await OptionGroupDialog.show(
      context: context,
      initialData: option,
    );
    if(updatedOption != null){
      ref.read(productsProvider.notifier).updateOption(updatedOption);
    }
  }

  void _editItem(Item item) async {
    final result = await OptionItemDialog.show(
      context,
      _selectedOption!,
      initialData: item
    );

    if (result != null) {
      ref.read(productsProvider.notifier).updateItem(result);
    }
  }

  void _addItem() async {
    final result = await OptionItemDialog.show(
      context,
      _selectedOption!
    );

    if (result != null) {
      ref.read(productsProvider.notifier).addItem(result);
    }
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(22, 22, 22, 12),
      child: Row(
        children: [
          Icon(
            Icons.folder_outlined,
            size: 20,
            color: Color(0xFF4F46E5),
          ),
          SizedBox(width: 10),
          Text(
            'Options',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchOption = value.trim().toLowerCase();
          });
        },
        decoration: InputDecoration(
          hintText: 'Rechercher...',
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 13,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 19,
            color: Color(0xFF94A3B8),
          ),
          suffixIcon: _searchOption.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _searchOption = '';
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7EB),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7EB),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF8B5CF6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        18,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: OutlinedButton.icon(
          onPressed: _addOption,
          icon: const Icon(
            Icons.add_rounded,
            size: 20,
          ),
          label: const Text(
            'Nouvelle Option',
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF5B21B6),
            side: const BorderSide(
              color: Color(0xFF8B5CF6),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTree(List<Option> options) {
    if (options.isEmpty) {
      return const Center(
        child: Text(
          'Aucune Option',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13,
          ),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      itemCount: options.length,
      separatorBuilder: (_, index) {
        return const SizedBox(height: 6);
      },
      itemBuilder: (context, index) {
        final option = options[index ];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 1,
          ),
          child: _optionListItem(option),
        );
      },
    );
  }

  Widget _optionListItem(Option option) {
    final selected = _selectedOption != null ? _selectedOption!.id == option.id : false;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
              setState(() {
                _selectedOption = option;
              });
            },
      onLongPress: () {
        _showOptionActions(
          option,
        );
      },
      child: Container(
        //height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFF3EEFF)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              Icons.folder_open_outlined,
              size: 19,
              color: selected
                  ? const Color(0xFF6D28D9)
                  : const Color(0xFF475569),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                option.name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: selected
                      ? const Color(0xFF6D28D9)
                      : const Color(0xFF334155),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showOptionActions(
    Option option,
  ) async {
    final action = await showDialog<_OptionAction>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 380,
            ),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3EEFF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.folder_outlined,
                      color: Color(0xFF6D28D9),
                      size: 26,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    option.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Que souhaitez-vous faire ?',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TreeActionButton(
                    icon: Icons.edit_outlined,
                    label: "Modifier le groupe d'options",
                    color: const Color(0xFF6D28D9),
                    background: const Color(0xFFF5F3FF),
                    onTap: () {
                      Navigator.pop(
                        context,
                        _OptionAction.edit,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  TreeActionButton(
                    icon: Icons.delete_outline_rounded,
                    label: "Supprimer le groupe d'options",
                    color: const Color(0xFFDC2626),
                    background: const Color(0xFFFFF1F2),
                    onTap: () {
                      Navigator.pop(
                        context,
                        _OptionAction.delete,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Annuler',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (!mounted || action == null) {
      return;
    }

    switch (action) {
      case _OptionAction.edit:
        _editOption(option);
        break;
      case _OptionAction.delete:
        await _confirmDelete(option);
        break;
    }
  }

  Future<void> _confirmDelete(
    Option option,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Supprimer le groupe d'options ?",
          ),
          content: Text(
            'Le groupe ${option.name} sera supprimée.',
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
      ref.read(productsProvider.notifier).removeOption(option.id);
    }
  }

  Future<void> _confirmDeleteItem(
    Item item,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Supression d'une option!",
          ),
          content: Text(
            "l'option ${item.name} sera supprimée.",
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
      ref.read(productsProvider.notifier).removeItem(item.id);
    }
  }
}

enum _OptionAction {
  edit,
  delete,
}