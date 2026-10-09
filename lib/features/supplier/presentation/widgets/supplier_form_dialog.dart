import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/core/widgets/counter_field.dart';

import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/extended_custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/toggle_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_dialog_widgets.dart';
import 'package:pos_app/features/supplier/domain/entities/supplier.dart';

const Color supplierPurple = Color(0xFF7C3AED);
const Color supplierBorder = Color(0xFFE7E5EF);
const Color supplierBackground = Color(0xFFF8FAFC);

class SupplierFormDialog extends StatefulWidget {
  final Supplier? initialData;
  final ValueChanged<Supplier> onSubmit;

  const SupplierFormDialog({
    super.key,
    this.initialData,
    required this.onSubmit,
  });

  @override
  State<SupplierFormDialog> createState() =>
      _SupplierFormDialogState();
}

class _SupplierFormDialogState
    extends State<SupplierFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _commercialNameController;
  late final TextEditingController _codeController;
  late final TextEditingController _siretController;
  late final TextEditingController _sirenController;
  late final TextEditingController _vatController;

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _jobController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _secondaryPhoneController;

  late final TextEditingController _addressController;
  late final TextEditingController _addressComplementController;
  late final TextEditingController _postalCodeController;
  late final TextEditingController _cityController;

  late final TextEditingController _discountController;
  late final TextEditingController _minimumOrderController;
  late final TextEditingController _deliveryDelayController;
  late final TextEditingController _notesController;

  SupplierType _type = SupplierType.professional;
  PaymentTerm _paymentTerm = PaymentTerm.cash;
  String _country = 'France';
  bool _active = true;
  bool _mainSupplier = false;

  bool get _isEdit => widget.initialData != null;

  @override
  void initState() {
    super.initState();

    final data = widget.initialData;

    _nameController =
        TextEditingController(text: data?.name ?? '');
    _commercialNameController =
        TextEditingController(text: data?.commercialName ?? '');
    _codeController =
        TextEditingController(text: data?.code ?? '');
    _siretController =
        TextEditingController(text: data?.siret ?? '');
    _sirenController =
        TextEditingController(text: data?.siren ?? '');
    _vatController =
        TextEditingController(text: data?.vatNumber ?? '');

    _firstNameController =
        TextEditingController(text: data?.contactFirstName ?? '');
    _lastNameController =
        TextEditingController(text: data?.contactLastName ?? '');
    _jobController =
        TextEditingController(text: data?.contactJob ?? '');
    _emailController =
        TextEditingController(text: data?.email ?? '');
    _phoneController =
        TextEditingController(text: data?.phone ?? '');
    _secondaryPhoneController =
        TextEditingController(text: data?.secondaryPhone ?? '');

    _addressController =
        TextEditingController(text: data?.address ?? '');
    _addressComplementController =
        TextEditingController(text: data?.addressComplement ?? '');
    _postalCodeController =
        TextEditingController(text: data?.postalCode ?? '');
    _cityController =
        TextEditingController(text: data?.city ?? '');

    _discountController =
        TextEditingController(
          text: data?.usualDiscount?.toString() ?? '',
        );
    _minimumOrderController = 
        TextEditingController(
          text: fromCentstoString(data?.minimumOrderAmount),
        );
    _deliveryDelayController =
        TextEditingController(
          text: data?.deliveryDelayDays?.toString() ?? '',
        );
    _notesController =
        TextEditingController(text: data?.notes ?? '');

    if (data != null) {
      _type = data.type;
      _paymentTerm = data.paymentTerm;
      _country = data.country;
      _active = data.isActive;
      _mainSupplier = data.isMainSupplier;
    }
  }

  @override
  void dispose() {
    for (final controller in [
      _nameController,
      _commercialNameController,
      _codeController,
      _siretController,
      _sirenController,
      _vatController,
      _firstNameController,
      _lastNameController,
      _jobController,
      _emailController,
      _phoneController,
      _secondaryPhoneController,
      _addressController,
      _addressComplementController,
      _postalCodeController,
      _cityController,
      _discountController,
      _minimumOrderController,
      _deliveryDelayController,
      _notesController,
    ]) {
      controller.dispose();
    }

    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final now = DateTime.now();
    final old = widget.initialData;

    final supplier = Supplier(
      id: old?.id ?? '',
      name: _nameController.text.trim(),
      commercialName:
          _commercialNameController.text.trim().isEmpty
              ? null
              : _commercialNameController.text.trim(),
      type: _type,
      code: _codeController.text.trim().isEmpty
          ? null
          : _codeController.text.trim(),
      siret: _siretController.text.trim().isEmpty
          ? null
          : _siretController.text.trim(),
      siren: _sirenController.text.trim().isEmpty
          ? null
          : _sirenController.text.trim(),
      vatNumber: _vatController.text.trim().isEmpty
          ? null
          : _vatController.text.trim(),
      contactFirstName:
          _firstNameController.text.trim().isEmpty
              ? null
              : _firstNameController.text.trim(),
      contactLastName:
          _lastNameController.text.trim().isEmpty
              ? null
              : _lastNameController.text.trim(),
      contactJob: _jobController.text.trim().isEmpty
          ? null
          : _jobController.text.trim(),
      email: _emailController.text.trim().isEmpty
          ? null
          : _emailController.text.trim(),
      phone: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
      secondaryPhone:
          _secondaryPhoneController.text.trim().isEmpty
              ? null
              : _secondaryPhoneController.text.trim(),
      address: _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim(),
      addressComplement:
          _addressComplementController.text.trim().isEmpty
              ? null
              : _addressComplementController.text.trim(),
      postalCode:
          _postalCodeController.text.trim().isEmpty
              ? null
              : _postalCodeController.text.trim(),
      city: _cityController.text.trim().isEmpty
          ? null
          : _cityController.text.trim(),
      country: _country,
      paymentTerm: _paymentTerm,
      usualDiscount:
          double.tryParse(_discountController.text),
      minimumOrderAmount: fromControllerToCents(_minimumOrderController),
      deliveryDelayDays:
          int.tryParse(_deliveryDelayController.text),
      isMainSupplier: _mainSupplier,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      isActive: _active,
      createdAt: old?.createdAt ?? now,
      updatedAt: now,
      deletedAt: old?.deletedAt,
    );

    widget.onSubmit(supplier);
  }

  @override
  Widget build(BuildContext context) {
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
              _buildHeader(),
              const Divider(
                height: 1,
                color: supplierBorder,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28),
                  child: Form(
                    key: _formKey,
                    child: _buildContent(),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: supplierBorder,
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: DialogFooter(
                  onCancel: () => Navigator.pop(context),
                  onSubmit: _submit,
                  submitText:
                      _isEdit ? 'Enregistrer' : 'Créer le fournisseur',
                  submitColor: supplierPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: supplierPurple.withOpacity(.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.local_shipping_outlined,
              color: supplierPurple,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  _isEdit
                      ? 'Modifier le fournisseur'
                      : 'Nouveau fournisseur',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Gérez les informations de votre fournisseur',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildGeneralSection(),
                  const SizedBox(height: 16),
                  _buildContactSection(),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  _buildAddressSection(),
                  const SizedBox(height: 16),
                  _buildCommercialSection(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildNotesSection(),
      ],
    );
  }

  Widget _buildGeneralSection() {
    return SectionWidget(
      title: 'Informations générales',
      icon: Icons.business_outlined,
      child: Column(
        children: [
          CustomTextField(
            controller: _nameController,
            label: 'Nom / Raison sociale',
            hint: 'Ex. Metro France',
            required: true,
            icon: Icons.business_outlined,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _commercialNameController,
            label: 'Nom commercial',
            hint: 'Nom utilisé commercialement',
            icon: Icons.storefront_outlined,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _codeController,
            label: 'Code fournisseur',
            hint: 'Ex. FOUR-001',
            icon: Icons.tag_outlined,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _dropdownCard(
                  title: 'Type',
                  icon: Icons.category_outlined,
                  value: _type,
                  items: SupplierType.values,
                  label: _supplierTypeLabel,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _type = value);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ToggleWidget(
                  title: 'Actif',
                  subtitle: 'Disponible dans le système',
                  value: _active,
                  onChanged: (value) {
                    setState(() => _active = value);
                  },
                ),
              ),
            ],
          ),
          if (_type == SupplierType.professional) ...[
            const SizedBox(height: 12),
            CustomTextField(
              controller: _siretController,
              label: 'SIRET',
              hint: '14 chiffres',
              icon: Icons.badge_outlined,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _sirenController,
                    label: 'SIREN',
                    hint: '9 chiffres',
                    icon: Icons.numbers_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: _vatController,
                    label: 'TVA intracommunautaire',
                    hint: 'FR...',
                    icon: Icons.receipt_long_outlined,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return SectionWidget(
      title: 'Contact',
      icon: Icons.person_outline,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _firstNameController,
                  label: 'Prénom',
                  hint: 'Jean',
                  icon: Icons.person_outline,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: _lastNameController,
                  label: 'Nom',
                  hint: 'Dupont',
                  icon: Icons.person_outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _jobController,
            label: 'Fonction',
            hint: 'Ex. Commercial',
            icon: Icons.work_outline,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'contact@fournisseur.fr',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _phoneController,
                  label: 'Téléphone',
                  hint: '01 00 00 00 00',
                  icon: Icons.phone_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: _secondaryPhoneController,
                  label: 'Téléphone secondaire',
                  hint: 'Optionnel',
                  icon: Icons.phone_android_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return SectionWidget(
      title: 'Adresse',
      icon: Icons.location_on_outlined,
      child: Column(
        children: [
          CustomTextField(
            controller: _addressController,
            label: 'Adresse',
            hint: '12 rue de Paris',
            icon: Icons.home_outlined,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _addressComplementController,
            label: 'Complément',
            hint: 'Bâtiment, étage...',
            icon: Icons.add_home_outlined,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: CustomTextField(
                  controller: _postalCodeController,
                  label: 'Code postal',
                  hint: '75001',
                  icon: Icons.markunread_mailbox_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: _cityController,
                  label: 'Ville',
                  hint: 'Paris',
                  icon: Icons.location_city_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _dropdownCard(
            title: 'Pays',
            icon: Icons.public_outlined,
            value: _country,
            items: const ['France', 'Belgique', 'Luxembourg', 'Suisse'],
            label: (value) => value,
            onChanged: (value) {
              if (value != null) {
                setState(() => _country = value);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCommercialSection() {
    return SectionWidget(
      title: 'Informations commerciales',
      icon: Icons.payments_outlined,
      child: Column(
        children: [
          _dropdownCard(
            title: 'Conditions de paiement',
            icon: Icons.account_balance_wallet_outlined,
            value: _paymentTerm,
            items: PaymentTerm.values,
            label: _paymentTermLabel,
            onChanged: (value) {
              if (value == null) return;
              setState(() => _paymentTerm = value);
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ExtendedCustomTextField(
                  controller: _discountController,
                  label: 'Remise habituelle',
                  hint: '0',
                  icon: Icons.percent_outlined,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ExtendedCustomTextField(
                  controller: _minimumOrderController,
                  label: 'Minimum de commande',
                  hint: '0,00 €',
                  icon: Icons.euro_outlined,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: SettingsCard(
                  title: 'Délai de livraison',
                  subtitle: 'Délai moyen',
                  icon: Icons.local_shipping_outlined,
                  accentColor: supplierPurple,
                  trailing: CounterField(
                    value: int.tryParse(
                          _deliveryDelayController.text,
                        ) ??
                        0,
                    min: 0,
                    max: 999,
                    onChanged: (value) {
                      _deliveryDelayController.text =
                          value.toString();
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ToggleWidget(
                  title: 'Fournisseur principal',
                  subtitle: 'Prioritaire pour l’approvisionnement',
                  value: _mainSupplier,
                  onChanged: (value) {
                    setState(() => _mainSupplier = value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return SectionWidget(
      title: 'Notes internes',
      icon: Icons.notes_outlined,
      child: CustomTextField(
        controller: _notesController,
        label: 'Notes',
        hint: 'Informations complémentaires...',
        icon: Icons.notes_outlined,
        maxLines: 3,
      ),
    );
  }

  Widget _dropdownCard<T>({
    required String title,
    required IconData icon,
    required T value,
    required List<T> items,
    required String Function(T) label,
    required ValueChanged<T?> onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(label(item)),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  String _supplierTypeLabel(SupplierType value) {
    switch (value) {
      case SupplierType.professional:
        return 'Professionnel';
      case SupplierType.individual:
        return 'Particulier';
    }
  }

  String _paymentTermLabel(PaymentTerm value) {
    switch (value) {
      case PaymentTerm.cash:
        return 'Comptant';
      case PaymentTerm.days15:
        return '15 jours';
      case PaymentTerm.days30:
        return '30 jours';
      case PaymentTerm.days45:
        return '45 jours';
      case PaymentTerm.days60:
        return '60 jours';
    }
  }
}