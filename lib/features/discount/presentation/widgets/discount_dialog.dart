import 'package:flutter/material.dart';
import 'package:pos_app/core/theme/app_colors.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/discount/domain/entities/discount.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/selection_item.dart';
import 'package:pos_app/features/discount/presentation/widgets/discounts/widgets/target_selection_dialog.dart';

import 'discounts/widgets/custom_text_field.dart';
import 'discounts/widgets/dialog_footer.dart';
import 'discounts/widgets/section_widget.dart';
import 'discounts/widgets/settings_card.dart';
import 'discounts/widgets/toggle_widget.dart';
import 'discounts/widgets/counter_field.dart';

class DiscountDialog extends StatefulWidget {
  final Discount? initialData;
  final ValueChanged<Discount> onSubmit;
  final List<Product> products;
  final List<Category> categories;

  const DiscountDialog({
    super.key,
    this.initialData,
    required this.onSubmit,
    required this.products,
    required this.categories,
  });

  @override
  State<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends State<DiscountDialog> {
  Set<String> _productIds = {};
  Set<String> _categoryIds = {};

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _codeController = TextEditingController();
  final _valueController = TextEditingController();
  final _minimumAmountController = TextEditingController();
  final _maximumDiscountController = TextEditingController();

  bool _active = true;

  DiscountType _type = DiscountType.percentage;
  DiscountActivation _activation = DiscountActivation.manual;
  DiscountScope _scope = DiscountScope.order;

  int _triggerQuantity = 2;
  int _rewardQuantity = 1;

  QuantityRewardType _rewardType = QuantityRewardType.free;

  final _rewardValueController = TextEditingController();

  final _bundlePriceController = TextEditingController();

  int _minimumQuantity = 1;

  bool _hasUsageLimit = false;
  int _usageLimit = 100;
  bool _combinable = false;
  int _priority = 0;

  DateTime? _startDate;
  DateTime? _endDate;
  final Set<int> _daysOfWeek = {};
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;



  @override
  void initState() {
    super.initState();
    
    final discount = widget.initialData;

    if (discount == null) {
      return;
    }

    _nameController.text = discount.name;
    _descriptionController.text = discount.description ?? '';
    _codeController.text = discount.code ?? '';
    _type = discount.type;
    _activation = discount.activation;
    _scope = discount.scope;
    _valueController.text = fromCentstoString(discount.value);
    _minimumAmountController.text = fromCentstoString(discount.minimumAmount);
    _maximumDiscountController.text = fromCentstoString(discount.maximumDiscount);
    _minimumQuantity = discount.minimumQuantity ?? 1;
    _active = discount.isActive;
    _hasUsageLimit = discount.usageLimit != null;
    _usageLimit = discount.usageLimit ?? 100;
    _combinable = discount.combinable;
    _priority = discount.priority;
    _startDate = discount.startDate;
    _endDate = discount.endDate;
    _daysOfWeek.addAll(discount.daysOfWeek);
    _categoryIds = discount.categoryIds;
    _productIds = discount.productIds;
    if (discount.startTime != null) {
      _startTime =
          _parseTime(discount.startTime!);
    }

    if (discount.endTime != null) {
      _endTime =
          _parseTime(discount.endTime!);
    }

    final promotion = discount.quantityPromotion;

    if (promotion != null) {
      _triggerQuantity = promotion.triggerQuantity;
      _rewardQuantity = promotion.rewardQuantity;
      _rewardType = promotion.rewardType;
      _rewardValueController.text = promotion.rewardValue?.toString() ?? '';
      _bundlePriceController.text = promotion.bundlePrice?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _codeController.dispose();
    _valueController.dispose();
    _minimumAmountController.dispose();
    _maximumDiscountController.dispose();
    _rewardValueController.dispose();
    _bundlePriceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialData != null;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 24,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1120,
          maxHeight: 860,
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              _buildHeader(isEdit),

              const Divider(
                height: 1,
                color: AppColors.discountBorder,
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28),
                  child: _buildView(),
                ),
              ),

              const Divider(
                height: 1,
                color: AppColors.discountBorder,
              ),

              Padding(
                padding: const EdgeInsets.all(22),
                child: DialogFooter(
                  onCancel: () =>
                      Navigator.of(context).pop(),
                  onSubmit: _submit,
                  submitText: isEdit
                      ? 'Enregistrer'
                      : 'Créer la réduction',
                  submitColor: AppColors.discountOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isEdit) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        30,
        25,
        24,
        18,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.discountOrangeLight,
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.local_offer_outlined,
              color: AppColors.discountOrange,
              size: 25,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  isEdit
                      ? 'Modifier la réduction'
                      : 'Nouvelle réduction',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Créez une promotion pour vos produits ou commandes',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () =>
                Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return Column(
      children: [
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: _buildMainColumn(),
            ),

            const SizedBox(width: 20),

            Expanded(
              flex: 9,
              child: _buildSideColumn(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainColumn() {
    return Column(
      children: [
        _buildGeneralSection(),

        const SizedBox(height: 16),

        _buildTypeSection(),

        const SizedBox(height: 16),

        if (_type ==
            DiscountType.quantityPromotion)
          _buildQuantitySection()
        else
          _buildValueSection(),

        const SizedBox(height: 16),

        _buildTargetSection(),

        const SizedBox(height: 16),

        _buildConditionsSection(),
      ],
    );
  }

  Widget _buildSideColumn() {
    return Column(
      children: [
        _buildActivationSection(),

        const SizedBox(height: 16),

        _buildValiditySection(),

        const SizedBox(height: 16),

        _buildLimitSection(),

        const SizedBox(height: 16),

        _buildStatusSection(),
      ],
    );
  }

  Widget _buildGeneralSection() {
    return SectionWidget(
      title: 'Informations générales',
      icon: Icons.info_outline,
      child: Column(
        children: [
          CustomTextField(
            controller: _nameController,
            label: 'Nom de la réduction',
            hint: 'Ex. Happy Hour',
            required: true,
            icon: Icons.local_offer_outlined,
          ),

          const SizedBox(height: 10),

          CustomTextField(
            controller: _descriptionController,
            label: 'Description',
            hint:
                'Ex. -20 % sur les boissons de 16h à 18h',
            icon: Icons.notes_outlined,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSection() {
    return SectionWidget(
      title: 'Type de réduction',
      icon: Icons.discount_outlined,
      child: Column(
        children: [
          _buildTypeSelector(),

          const SizedBox(height: 12),

          Text(
            _typeDescription,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Row(
      children: [
        Expanded(
          child: _typeCard(
            type: DiscountType.percentage,
            icon: Icons.percent,
            title: 'Pourcentage',
            subtitle: '-20 %',
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _typeCard(
            type: DiscountType.fixedAmount,
            icon: Icons.euro,
            title: 'Montant',
            subtitle: '-5 €',
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _typeCard(
            type: DiscountType.fixedPrice,
            icon: Icons.sell_outlined,
            title: 'Prix fixe',
            subtitle: '5 €',
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _typeCard(
            type: DiscountType.quantityPromotion,
            icon: Icons.shopping_basket_outlined,
            title: 'Quantité',
            subtitle: '2 + 1',
          ),
        ),
      ],
    );
  }

  Widget _typeCard({
    required DiscountType type,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final selected = _type == type;

    return InkWell(
      onTap: () {
        setState(() {
          _type = type;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.discountPurpleLight
              : const Color(0xFFF8FAFC),
          borderRadius:
              BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? AppColors.discountOrange
                : AppColors.discountBorder,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: selected
                  ? AppColors.discountOrange
                  : const Color(0xFF64748B),
              size: 21,
            ),
            const SizedBox(height: 7),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: selected
                    ? AppColors.discountOrange
                    : const Color(0xFF334155),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _typeDescription {
    switch (_type) {
      case DiscountType.percentage:
        return 'Réduit le prix d’un pourcentage donné.';

      case DiscountType.fixedAmount:
        return 'Soustrait un montant fixe du prix.';

      case DiscountType.fixedPrice:
        return 'Remplace le prix par un prix promotionnel.';

      case DiscountType.quantityPromotion:
        return 'Déclenche une promotion selon la quantité achetée.';
    }
  }

  Widget _buildValueSection() {
    final label = switch (_type) {
      DiscountType.percentage =>
        'Pourcentage de réduction',
      DiscountType.fixedAmount =>
        'Montant de réduction',
      DiscountType.fixedPrice =>
        'Prix promotionnel',
      _ => 'Valeur',
    };

    final hint = switch (_type) {
      DiscountType.percentage => 'Ex. 20',
      DiscountType.fixedAmount => 'Ex. 5.00',
      DiscountType.fixedPrice => 'Ex. 4.90',
      _ => '',
    };

    final suffix = _type ==
            DiscountType.percentage
        ? '%'
        : '€';

    return SectionWidget(
      title: 'Valeur de la réduction',
      icon: Icons.calculate_outlined,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: _valueController,
              label: label,
              hint: hint,
              required: true,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              icon: _type ==
                      DiscountType.percentage
                  ? Icons.percent
                  : Icons.euro_outlined,
            ),
          ),

          const SizedBox(width: 12),

          Container(
            height: 48,
            padding:
                const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius:
                  BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.discountBorder,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              suffix,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF475569),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySection() {
    return SectionWidget(
      title: 'Promotion quantité',
      icon: Icons.shopping_basket_outlined,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SettingsCard(
                  title: 'Quantité déclencheuse',
                  subtitle:
                      'Articles nécessaires',
                  icon:
                      Icons.shopping_cart_outlined,
                  accentColor: AppColors.discountOrange,
                  trailing: CounterField(
                    value: _triggerQuantity,
                    min: 1,
                    max: 99,
                    onChanged: (value) {
                      setState(() {
                        _triggerQuantity = value;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SettingsCard(
                  title: 'Quantité offerte',
                  subtitle:
                      'Articles bénéficiant de l’avantage',
                  icon: Icons.card_giftcard_outlined,
                  accentColor: AppColors.discountOrange,
                  trailing: CounterField(
                    value: _rewardQuantity,
                    min: 1,
                    max: 99,
                    onChanged: (value) {
                      setState(() {
                        _rewardQuantity = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _buildRewardTypeSelector(),

          const SizedBox(height: 12),

          if (_rewardType ==
              QuantityRewardType.percentage)
            CustomTextField(
              controller:
                  _rewardValueController,
              label: 'Réduction',
              hint: 'Ex. 50',
              icon: Icons.percent,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

          if (_rewardType ==
              QuantityRewardType.fixedPrice)
            CustomTextField(
              controller:
                  _rewardValueController,
              label: 'Prix unitaire promotionnel',
              hint: 'Ex. 2.50',
              icon: Icons.euro_outlined,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

          if (_rewardType ==
              QuantityRewardType.bundlePrice)
            CustomTextField(
              controller:
                  _bundlePriceController,
              label: 'Prix total du pack',
              hint: 'Ex. 10.00',
              icon: Icons.euro_outlined,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRewardTypeSelector() {
    return Row(
      children: [
        Expanded(
          child: _rewardCard(
            QuantityRewardType.free,
            Icons.card_giftcard_outlined,
            'Gratuit',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _rewardCard(
            QuantityRewardType.percentage,
            Icons.percent,
            '- %',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _rewardCard(
            QuantityRewardType.fixedPrice,
            Icons.euro,
            'Prix fixe',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _rewardCard(
            QuantityRewardType.bundlePrice,
            Icons.inventory_2_outlined,
            'Prix du pack',
          ),
        ),
      ],
    );
  }

  Widget _rewardCard(
    QuantityRewardType type,
    IconData icon,
    String title,
  ) {
    final selected = _rewardType == type;

    return InkWell(
      onTap: () {
        setState(() {
          _rewardType = type;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding:
            const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.discountPurpleLight
              : const Color(0xFFF8FAFC),
          borderRadius:
              BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? AppColors.discountOrange
                : AppColors.discountBorder,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 19,
              color: selected
                  ? AppColors.discountOrange
                  : const Color(0xFF64748B),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: selected
                    ? AppColors.discountOrange
                    : const Color(0xFF475569),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetSection() {
    return SectionWidget(
      title: 'Application',
      icon: Icons.track_changes_outlined,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _scopeCard(
                  DiscountScope.order,
                  Icons.receipt_long_outlined,
                  'Commande',
                  'Toute la commande',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _scopeCard(
                  DiscountScope.products,
                  Icons.inventory_2_outlined,
                  'Produits',
                  'Produits sélectionnés',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _scopeCard(
                  DiscountScope.categories,
                  Icons.category_outlined,
                  'Catégories',
                  'Catégories sélectionnées',
                ),
              ),
            ],
          ),

          if (_scope != DiscountScope.order) ...[
            const SizedBox(height: 12),
            _buildSelectionPlaceholder(),
          ],
        ],
      ),
    );
  }

  Widget _scopeCard(
    DiscountScope scope,
    IconData icon,
    String title,
    String subtitle,
  ) {
    final selected = _scope == scope;

    return InkWell(
      onTap: () {
        setState(() {
          _scope = scope;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding:
            const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.discountPurpleLight
              : const Color(0xFFF8FAFC),
          borderRadius:
              BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? AppColors.discountOrange
                : AppColors.discountBorder,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? AppColors.discountOrange
                  : const Color(0xFF64748B),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? AppColors.discountOrange
                          : const Color(0xFF334155),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF94A3B8),
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

  Future<void> _openTargetSelectionDialog() async {
    final isProducts = _scope == DiscountScope.products;

    final result = await showDialog<Set<String>>(
      context: context,
      builder: (_) {
        return TargetSelectionDialog(
          title: isProducts
              ? 'Sélectionner les produits'
              : 'Sélectionner les catégories',

          items: isProducts
              ? widget.products
                  .map(
                    (product) => SelectionItem(
                      id: product.id,
                      name: product.name,
                    ),
                  )
                  .toList()
              : widget.categories
                  .map(
                    (category) => SelectionItem(
                      id: category.id,
                      name: category.name,
                    ),
                  )
                  .toList(),

          initialSelectedIds: isProducts
              ? _productIds
              : _categoryIds,
        );
      },
    );

    if (result == null) return;

    setState(() {
      if (isProducts) {
        _productIds = result;
      } else {
        _categoryIds = result;
      }
    });
  }

  Widget _buildSelectionPlaceholder() {
    final isProducts = _scope == DiscountScope.products;

    final selectedIds = isProducts
      ? _productIds
      : _categoryIds;

    return InkWell(
      onTap: _openTargetSelectionDialog,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedIds.isNotEmpty
                ? AppColors.discountPurple
                : AppColors.discountBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isProducts
                      ? Icons.inventory_2_outlined
                      : Icons.category_outlined,
                  size: 20,
                  color: selectedIds.isNotEmpty
                      ? AppColors.discountPurple
                      : const Color(0xFF64748B),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        isProducts
                            ? 'Produits concernés'
                            : 'Catégories concernées',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        selectedIds.isEmpty
                            ? isProducts
                                ? 'Sélectionner les produits concernés'
                                : 'Sélectionner les catégories concernées'
                            : '${selectedIds.length} sélectionné${selectedIds.length > 1 ? 's' : ''}',
                        style: TextStyle(
                          fontSize: 11,
                          color: selectedIds.isEmpty
                              ? const Color(0xFF64748B)
                              : AppColors.discountPurple,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF94A3B8),
                ),
              ],
            ),

            if (selectedIds.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildSelectedTargets(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedTargets() {
    final isProducts = _scope == DiscountScope.products;

    if (isProducts) {
      final selectedProducts = widget.products
          .where((product) => _productIds.contains(product.id))
          .toList();

      return Wrap(
        spacing: 6,
        runSpacing: 6,
        children: selectedProducts.map((product) {
          return _selectedChip(
            label: product.name,
            onRemove: () {
              setState(() {
                _productIds.remove(product.id);
              });
            },
          );
        }).toList(),
      );
    }

    final selectedCategories = widget.categories
        .where((category) => _categoryIds.contains(category.id))
        .toList();

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: selectedCategories.map((category) {
        return _selectedChip(
          label: category.name,
          onRemove: () {
            setState(() {
              _categoryIds.remove(category.id);
            });
          },
        );
      }).toList(),
    );
  }

  Widget _selectedChip({
    required String label,
    required VoidCallback onRemove,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.discountPurple.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.discountBorder,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(20),
            child: const Icon(
              Icons.close,
              size: 14,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  /*Widget _buildSelectionPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius:
            BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.discountBorder,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.touch_app_outlined,
            size: 20,
            color: Color(0xFF64748B),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _scope == DiscountScope.products
                  ? 'Sélectionner les produits concernés'
                  : 'Sélectionner les catégories concernées',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFF94A3B8),
          ),
        ],
      ),
    );
  }*/

  Widget _buildConditionsSection() {
    return SectionWidget(
      title: 'Conditions',
      icon: Icons.rule_outlined,
      child: Row(
        children: [
          if(_type == DiscountType.quantityPromotion) ...[
            Expanded(
              child: SettingsCard(
                title: 'Quantité minimum',
                subtitle:
                    'Articles nécessaires',
                icon: Icons.numbers_outlined,
                accentColor: AppColors.discountOrange,
                trailing: CounterField(
                  value: _minimumQuantity,
                  min: 1,
                  max: 999,
                  onChanged: (value) {
                    setState(() {
                      _minimumQuantity = value;
                    });
                  },
                ),
              ),
            )
          ] else ...[
            Expanded(
              child: CustomTextField(
                controller:
                    _minimumAmountController,
                label: 'Montant minimum',
                hint: 'Ex. 30.00',
                icon: Icons.euro_outlined,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            )
          ]

        ],
      ),
    );
  }

  Widget _buildActivationSection() {
    return SectionWidget(
      title: 'Activation',
      icon: Icons.play_circle_outline,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child:
              _activationCard(
                DiscountActivation.automatic,
                Icons.auto_awesome_outlined,
                'Automatique',
                'Appliquée automatiquement',
              )),

              const SizedBox(width: 8),
              
              Expanded(child:
              _activationCard(
                DiscountActivation.promoCode,
                Icons.qr_code_2_outlined,
                'Code promotionnel',
                'Nécessite un code',
              )),

              const SizedBox(width: 8),

              Expanded(child:
              _activationCard(
                DiscountActivation.manual,
                Icons.touch_app_outlined,
                'Manuelle',
                'Activée par le caissier',
              )),
            ],
          ),
          if (_activation ==
              DiscountActivation.promoCode) ...[
            const SizedBox(height: 12),

            CustomTextField(
              controller: _codeController,
              label: 'Code promotionnel',
              hint: 'Ex. WELCOME10',
              required: true,
              icon: Icons.confirmation_number_outlined,
            ),
          ],
        ],
      )
    );
  }

  Widget _activationCard(
    DiscountActivation activation,
    IconData icon,
    String title,
    String subtitle,
  ) {
    final selected =
        _activation == activation;

    return InkWell(
      onTap: () {
        setState(() {
          _activation = activation;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding:
            const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.discountPurpleLight
              : const Color(0xFFF8FAFC),
          borderRadius:
              BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? AppColors.discountOrange
                : AppColors.discountBorder,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? AppColors.discountOrange
                  : const Color(0xFF64748B),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? AppColors.discountOrange
                          : const Color(0xFF334155),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              const Icon(
                Icons.check_circle,
                size: 19,
                color: AppColors.discountOrange,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildValiditySection() {
    return SectionWidget(
      title: 'Période de validité',
      icon: Icons.calendar_month_outlined,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _dateButton(
                  title: 'Date de début',
                  date: _startDate,
                  onPressed: () =>
                      _selectDate(true),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _dateButton(
                  title: 'Date de fin',
                  date: _endDate,
                  onPressed: () =>
                      _selectDate(false),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _buildDaysSelector(),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _timeButton(
                  title: 'Heure de début',
                  time: _startTime,
                  onPressed: () =>
                      _selectTime(true),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _timeButton(
                  title: 'Heure de fin',
                  time: _endTime,
                  onPressed: () =>
                      _selectTime(false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dateButton({
    required String title,
    required DateTime? date,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding:
            const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius:
              BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.discountBorder,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: Color(0xFF64748B),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    date == null
                        ? 'Non définie'
                        : _formatDate(date),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
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

  Widget _timeButton({
    required String title,
    required TimeOfDay? time,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding:
            const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius:
              BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.discountBorder,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.schedule_outlined,
              size: 18,
              color: Color(0xFF64748B),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    time == null
                        ? 'Toute la journée'
                        : time.format(context),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
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

  Widget _buildDaysSelector() {
    const days = [
      'L',
      'M',
      'M',
      'J',
      'V',
      'S',
      'D',
    ];

    return Row(
      children: List.generate(7, (index) {
        final day = index + 1;
        final selected =
            _daysOfWeek.contains(day);

        return Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 2,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (selected) {
                    _daysOfWeek.remove(day);
                  } else {
                    _daysOfWeek.add(day);
                  }
                });
              },
              borderRadius:
                  BorderRadius.circular(8),
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.discountOrange
                      : const Color(0xFFF8FAFC),
                  borderRadius:
                      BorderRadius.circular(8),
                  border: Border.all(
                    color: selected
                        ? AppColors.discountOrange
                        : AppColors.discountBorder,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  days[index],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight:
                        FontWeight.w700,
                    color: selected
                        ? Colors.white
                        : const Color(
                            0xFF64748B,
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildLimitSection() {
    return SectionWidget(
      title: 'Limites et cumul',
      icon: Icons.tune_outlined,
      child: Column(
        children: [
          SettingsCard(
            title: 'Plafond de réduction',
            subtitle:
                'Montant maximum pouvant être déduit',
            icon: Icons.price_check_outlined,
            accentColor: AppColors.discountOrange,
            trailing: SizedBox(
              width: 130,
              child: CustomTextField(
                controller:
                    _maximumDiscountController,
                label: '',
                hint: 'Ex. 20 €',
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          ToggleWidget(
            title: 'Limiter le nombre d’utilisations',
            subtitle:
                'Définir un nombre maximum d’utilisations',
            value: _hasUsageLimit,
            onChanged: (value) {
              setState(() {
                _hasUsageLimit = value;
              });
            },
          ),

          if (_hasUsageLimit) ...[
            const SizedBox(height: 8),
            SettingsCard(
              title: 'Nombre maximum',
              subtitle:
                  'Nombre total d’utilisations',
              icon: Icons.confirmation_number_outlined,
              accentColor: AppColors.discountOrange,
              trailing: CounterField(
                value: _usageLimit,
                min: 1,
                max: 999999,
                onChanged: (value) {
                  setState(() {
                    _usageLimit = value;
                  });
                },
              ),
            ),
          ],

          const SizedBox(height: 8),

          ToggleWidget(
            title: 'Cumulable',
            subtitle:
                'Autoriser cette réduction avec d’autres réductions',
            value: _combinable,
            onChanged: (value) {
              setState(() {
                _combinable = value;
              });
            },
          ),

          if (_combinable) ...[
            const SizedBox(height: 8),
            SettingsCard(
              title: 'Priorité',
              subtitle:
                  'Ordre d’application des réductions',
              icon: Icons.low_priority_outlined,
              accentColor: AppColors.discountOrange,
              trailing: CounterField(
                value: _priority,
                min: 0,
                max: 99,
                onChanged: (value) {
                  setState(() {
                    _priority = value;
                  });
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return SectionWidget(
      title: 'État',
      icon: Icons.toggle_on_outlined,
      child: ToggleWidget(
        title: 'Actif',
        subtitle: 'Cette réduction peut être appliquée',
        value: _active,
        onChanged: (value) {
          setState(() {
            _active = value;
          });
        },
      ),
    );
  }

  Future<void> _selectDate(bool start) async {
    final selected = await showDatePicker(
      context: context,
      initialDate:
          start
              ? (_startDate ??
                  DateTime.now())
              : (_endDate ??
                  _startDate ??
                  DateTime.now()),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (selected == null) {
      return;
    }

    setState(() {
      if (start) {
        _startDate = selected;
      } else {
        _endDate = selected;
      }
    });
  }

  Future<void> _selectTime( bool start) async {
    final selected = await showTimePicker(
      context: context,
      initialTime:
          start
              ? (_startTime ??
                  const TimeOfDay(
                    hour: 0,
                    minute: 0,
                  ))
              : (_endTime ??
                  const TimeOfDay(
                    hour: 23,
                    minute: 59,
                  )),
    );

    if (selected == null) {
      return;
    }

    setState(() {
      if (start) {
        _startTime = selected;
      } else {
        _endTime = selected;
      }
    });
  }

  void _submit() {
    final name =_nameController.text.trim();

    if (name.isEmpty) {
      return;
    }

    QuantityPromotion? quantityPromotion;

    if (_type ==DiscountType.quantityPromotion) {
      quantityPromotion = QuantityPromotion(
        triggerQuantity: _triggerQuantity,
        rewardQuantity: _rewardQuantity,
        rewardType: _rewardType,
        rewardValue: fromControllerToCents(_rewardValueController),
        bundlePrice: fromControllerToCents(_bundlePriceController),
      );
    }

    final discount = Discount(
      id: widget.initialData?.id ?? '',
      name: name,
      description:
          _descriptionController.text
                  .trim()
                  .isEmpty
              ? null
              : _descriptionController.text
                  .trim(),
      type: _type,
      activation: _activation,
      code:
          _activation ==
                  DiscountActivation
                      .promoCode
              ? _codeController.text
                  .trim()
              : null,
      scope: _scope,
      productIds: _scope == DiscountScope.products ? _productIds : {},
      categoryIds: _scope == DiscountScope.categories ? _categoryIds : {},
      value: fromControllerToCents(_valueController),
      quantityPromotion: quantityPromotion,
      minimumAmount: fromControllerToCents(_minimumAmountController),
      minimumQuantity: _minimumQuantity,
      maximumDiscount: fromControllerToCents(_maximumDiscountController),
      usageLimit: _hasUsageLimit ? _usageLimit : null,
      usageCount: widget.initialData?.usageCount ?? 0,
      startDate: _startDate,
      endDate: _endDate,
      daysOfWeek: _daysOfWeek.toList()..sort(),
      startTime: _formatTime(_startTime),
      endTime: _formatTime(_endTime),
      combinable: _combinable,
      priority: _priority,
      isActive: _active,
      createdAt: widget.initialData?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    Navigator.of(context).pop(
      discount,
    );
  }

  String? _formatTime(
    TimeOfDay? time,
  ) {
    if (time == null) {
      return null;
    }

    final hour =
        time.hour.toString().padLeft(2, '0');

    final minute =
        time.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  TimeOfDay _parseTime(
    String value,
  ) {
    final parts = value.split(':');

    return TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 0,
      minute: parts.length > 1
          ? int.tryParse(parts[1]) ?? 0
          : 0,
    );
  }

  String _formatDate(
    DateTime date,
  ) {
    final day =
        date.day.toString().padLeft(2, '0');

    final month =
        date.month.toString().padLeft(2, '0');

    return '$day/$month/${date.year}';
  }
}