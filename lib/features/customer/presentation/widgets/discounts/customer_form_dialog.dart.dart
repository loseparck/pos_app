import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/money_extension.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/extended_custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/toggle_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_dialog_widgets.dart';
import 'package:pos_app/features/customer/domain/entities/customer.dart';

const Color customerBlue = Color(0xFF2563EB);
const Color customerBorder = Color(0xFFE7E5EF);

class CustomerFormDialog extends StatefulWidget {
  final Customer? initialData;
  final ValueChanged<Customer> onSubmit;

  const CustomerFormDialog({
    super.key,
    this.initialData,
    required this.onSubmit,
  });

  @override
  State<CustomerFormDialog> createState() =>
      _CustomerFormDialogState();
}

class _CustomerFormDialogState
    extends State<CustomerFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _companyController;
  late final TextEditingController _codeController;

  late final TextEditingController _siretController;
  late final TextEditingController _sirenController;
  late final TextEditingController _vatController;

  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _secondaryPhoneController;

  late final TextEditingController _addressController;
  late final TextEditingController _addressComplementController;
  late final TextEditingController _postalCodeController;
  late final TextEditingController _cityController;

  late final TextEditingController _discountController;
  late final TextEditingController _creditLimitController;
  late final TextEditingController _notesController;

  CustomerType _type = CustomerType.individual;
  String _country = 'France';
  String _priceList = 'Standard';

  bool _allowCredit = false;
  bool _active = true;

  bool get _isEdit => widget.initialData != null;

  @override
  void initState() {
    super.initState();

    final data = widget.initialData;

    _firstNameController =
        TextEditingController(text: data?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: data?.lastName ?? '');
    _companyController =
        TextEditingController(text: data?.companyName ?? '');
    _codeController =
        TextEditingController(text: data?.code ?? '');

    _siretController =
        TextEditingController(text: data?.siret ?? '');
    _sirenController =
        TextEditingController(text: data?.siren ?? '');
    _vatController =
        TextEditingController(text: data?.vatNumber ?? '');

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
          text: data?.permanentDiscount?.toString() ?? '',
        );

    _creditLimitController =
        TextEditingController(
          text: fromCentstoString(data?.creditLimit),
        );

    _notesController =
        TextEditingController(text: data?.notes ?? '');

    if (data != null) {
      _type = data.type;
      _country = data.country;
      _priceList = data.priceList;
      _allowCredit = data.allowCredit;
      _active = data.isActive;
    }
  }

  @override
  void dispose() {
    for (final controller in [
      _firstNameController,
      _lastNameController,
      _companyController,
      _codeController,
      _siretController,
      _sirenController,
      _vatController,
      _emailController,
      _phoneController,
      _secondaryPhoneController,
      _addressController,
      _addressComplementController,
      _postalCodeController,
      _cityController,
      _discountController,
      _creditLimitController,
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

    final customer = Customer(
      id: old?.id ?? '',
      type: _type,
      firstName: _firstNameController.text.trim().isEmpty
          ? null
          : _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      companyName: _companyController.text.trim().isEmpty
          ? null
          : _companyController.text.trim(),
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
      priceList: _priceList,
      permanentDiscount:
          double.tryParse(_discountController.text),
      allowCredit: _allowCredit,
      creditLimit: fromControllerToCents(_creditLimitController),
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      isActive: _active,
      createdAt: old?.createdAt ?? now,
      updatedAt: now,
      deletedAt: old?.deletedAt,
    );

    widget.onSubmit(customer);
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
          maxWidth: 1050,
          maxHeight: 850,
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
                color: customerBorder,
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
                color: customerBorder,
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: DialogFooter(
                  onCancel: () => Navigator.pop(context),
                  onSubmit: _submit,
                  submitText:
                      _isEdit ? 'Enregistrer' : 'Créer le client',
                  submitColor: customerBlue,
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
              color: customerBlue.withOpacity(.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.person_outline,
              color: customerBlue,
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
                      ? 'Modifier le client'
                      : 'Nouveau client',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Gérez les informations de votre client',
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
                  _buildIdentitySection(),
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

  Widget _buildIdentitySection() {
    return SectionWidget(
      title: 'Informations générales',
      icon: Icons.person_outline,
      child: Column(
        children: [
          _dropdownCard<CustomerType>(
            title: 'Type de client',
            icon: Icons.badge_outlined,
            value: _type,
            items: CustomerType.values,
            label: _customerTypeLabel,
            onChanged: (value) {
              if (value == null) return;

              setState(() {
                _type = value;
              });
            },
          ),
          const SizedBox(height: 12),
          if (_type == CustomerType.individual) ...[
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
                    required: true,
                    icon: Icons.person_outline,
                  ),
                ),
              ],
            ),
          ] else ...[
            CustomTextField(
              controller: _companyController,
              label: 'Raison sociale',
              hint: 'Ex. Dupont SARL',
              required: true,
              icon: Icons.business_outlined,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _firstNameController,
                    label: 'Prénom contact',
                    hint: 'Jean',
                    icon: Icons.person_outline,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: _lastNameController,
                    label: 'Nom contact',
                    hint: 'Dupont',
                    icon: Icons.person_outline,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 8),
          CustomTextField(
            controller: _codeController,
            label: 'Code client',
            hint: 'Ex. CLI-001',
            icon: Icons.tag_outlined,
          ),
          if (_type == CustomerType.professional) ...[
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
      icon: Icons.contact_phone_outlined,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'client@email.com',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _phoneController,
            label: 'Téléphone',
            hint: '06 00 00 00 00',
            icon: Icons.phone_outlined,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _secondaryPhoneController,
            label: 'Téléphone secondaire',
            hint: 'Optionnel',
            icon: Icons.phone_android_outlined,
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
          _dropdownCard<String>(
            title: 'Pays',
            icon: Icons.public_outlined,
            value: _country,
            items: const [
              'France',
              'Belgique',
              'Luxembourg',
              'Suisse',
            ],
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
          _dropdownCard<String>(
            title: 'Tarif client',
            icon: Icons.price_change_outlined,
            value: _priceList,
            items: const [
              'Standard',
              'Professionnel',
              'Grossiste',
              'VIP',
            ],
            label: (value) => value,
            onChanged: (value) {
              if (value != null) {
                setState(() => _priceList = value);
              }
            },
          ),
          const SizedBox(height: 12),
          ExtendedCustomTextField(
            controller: _discountController,
            label: 'Remise permanente',
            hint: '0 %',
            icon: Icons.percent_outlined,
            keyboardType:
                const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          const SizedBox(height: 12),
          ToggleWidget(
            title: 'Autoriser le crédit',
            subtitle:
                'Permettre les ventes à crédit pour ce client',
            value: _allowCredit,
            onChanged: (value) {
              setState(() => _allowCredit = value);
            },
          ),
          if (_allowCredit) ...[
            const SizedBox(height: 12),
            ExtendedCustomTextField(
              controller: _creditLimitController,
              label: 'Plafond de crédit',
              hint: '0,00 €',
              icon: Icons.account_balance_wallet_outlined,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
          ],
          const SizedBox(height: 12),
          ToggleWidget(
            title: 'Actif',
            subtitle: 'Client disponible dans le POS',
            value: _active,
            onChanged: (value) {
              setState(() => _active = value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return SectionWidget(
      title: 'Notes',
      icon: Icons.notes_outlined,
      child: CustomTextField(
        controller: _notesController,
        label: 'Notes internes',
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

  String _customerTypeLabel(CustomerType value) {
    switch (value) {
      case CustomerType.individual:
        return 'Particulier';
      case CustomerType.professional:
        return 'Professionnel';
    }
  }
}