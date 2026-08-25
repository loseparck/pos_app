import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/color_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/image_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/toggle_widget.dart';

import 'option_dialog_widgets.dart';

class OptionGroupDialog extends StatefulWidget {
  final Option? initialData;

  final Future<String?> Function()? onPickImage;

  const OptionGroupDialog({
    super.key,
    this.initialData,
    this.onPickImage,
  });

  static Future<Option?> show({
    required BuildContext context, 
    Option? initialData,
    Future<String?> Function()? onPickImage,
  }) {
    return showDialog<Option>(
      context: context,
      barrierDismissible: false,
      builder: (_) => OptionGroupDialog(
        initialData: initialData,
        onPickImage: onPickImage,
      ),
    );
  }

  @override
  State<OptionGroupDialog> createState() =>
      _OptionGroupDialogState();
}

class _OptionGroupDialogState
    extends State<OptionGroupDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  late bool _required;
  late bool _fixMaxSelection;
  late bool _allowDuplicateSelection;
  late bool _active;

  late int _minSelection;
  late int _maxSelection;

  late Color? _selectedColor;
  String? _imagePath;
   
  @override
  void initState() {
    super.initState();

    final data = widget.initialData;

    _nameController = TextEditingController(
      text: data?.name ?? '',
    );

    _descriptionController = TextEditingController(
      text: data?.description ?? '',
    );

    _required = data?.mandatory ?? false;
    _allowDuplicateSelection =
        data?.allowDuplicateSelection ?? false;
    _active = data?.isActive ?? true;

    _minSelection = data?.minSelection ?? 0;
    _maxSelection = data?.maxSelection ?? 0;
    _fixMaxSelection = _maxSelection > 0;

    _selectedColor =
        data?.color != null ? Color(int.parse(data!.color!)) : null;

    _imagePath = data?.image;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateRequired(bool value) {
    setState(() {
      _required = value;

      if (_required && _minSelection < 1) {
        _minSelection = 1;
      }

      if (_fixMaxSelection && _maxSelection < _minSelection) {
        _maxSelection = _minSelection;
      }
    });
  }

  void _updateMin(int value) {
    setState(() {
      _minSelection = value;
      if (_fixMaxSelection && _maxSelection < value) {
        _maxSelection = value;
      }
    });
  }

  void _updateMax(int value) {
    setState(() {

      if (_maxSelection >= _minSelection) {
        _maxSelection = value;
      }
    });
  }

  void _submit() {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      _showError('Le nom du groupe est obligatoire.');
      return;
    }

    if (_minSelection > _maxSelection) {
      _showError(
        'Le minimum ne peut pas être supérieur au maximum.',
      );
      return;
    }

    final result = Option(
      id: widget.initialData?.id ?? '',
      name: name,
      description: _descriptionController.text.trim(),
      image: _imagePath,
      color: _selectedColor != null ? '${_selectedColor!.toARGB32()}': null,
      mandatory: _required,
      minSelection: _minSelection,
      maxSelection: _maxSelection,
      allowDuplicateSelection:
          _allowDuplicateSelection,
      active: _active,
    );

    Navigator.of(context).pop(result);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  30,
                  25,
                  24,
                  18,
                ),
                child: OptionDialogHeader(
                  icon: Icons.category_outlined,
                  title: isEdit
                      ? 'Modifier le groupe'
                      : 'Nouveau groupe d’options',
                  subtitle:
                      'Créez un groupe pour organiser vos options',
                  color: optionPurple,
                  onClose: () =>
                      Navigator.of(context).pop(),
                ),
              ),
              const Divider(
                height: 1,
                color: optionBorder,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28),
                  child:  _buildView(),
                ),
              ),
              const Divider(
                height: 1,
                color: optionBorder,
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: DialogFooter(
                  onCancel: () =>
                      Navigator.of(context).pop(),
                  onSubmit: _submit,
                  submitText: isEdit
                      ? 'Enregistrer'
                      : 'Créer le groupe',
                  submitColor: optionPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceInventoryTab() {
    return Column(
        children: [
          SectionWidget(
            title: 'Informations générales',
            icon: Icons.info_outline,
            child: Column(
              children: [
                CustomTextField(
                  controller: _nameController,
                  label: 'Nom du groupe',
                  hint: 'Ex. Glace',
                  required: true,
                  icon: Icons.shopping_bag_outlined,
                ),

                const SizedBox(
                  height: 8,
                ),

                CustomTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Ex. Choisissez votre parfum de glace préféré.',
                  icon: Icons.notes_outlined,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SectionWidget(
            title: 'Règles de sélection',
            icon: Icons.inventory_2_outlined,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ToggleWidget(
                        title: 'Obligatoire',
                        subtitle:
                            'Le client doit sélectionner au moins une option',
                        value: _required,
                        onChanged: _updateRequired,
                      )
                    ),
                    if(_required)...[
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: SettingsCard(
                          title: 'Nombre minimum à sélectionner',
                          subtitle:
                              'Minimum d’options requises',
                          icon: Icons.looks_one_outlined,
                          accentColor: optionPurple,
                          trailing: CounterField(
                            value: _minSelection,
                            min: 0,
                            max: 99,
                            onChanged: _updateMin,
                          ),
                        )
                      ),
                    ]
                  ]
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ToggleWidget(
                          title: 'Sélection multiple',
                          subtitle:
                              'Autoriser plusieurs options différentes',
                          value: _fixMaxSelection,
                          onChanged: (value) {
                            setState(() {
                              _fixMaxSelection = value;
                              if (value) {
                                _maxSelection = _minSelection;
                              } else {
                                _maxSelection = 0;
                              }
                            });
                          },
                        )
                      ),
                    if(_maxSelection > 0)...[
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: SettingsCard(
                          title: 'Nombre maximum à sélectionner',
                          subtitle:
                              'Maximum d’options autorisées',
                          icon: Icons.tune_rounded,
                          accentColor: optionPurple,
                          trailing: CounterField(
                            value: _maxSelection,
                            min: 0,
                            max: 99,
                            onChanged: _updateMax,
                          ),
                        )
                      ),
                    ]
                  ]
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ToggleWidget(
                        title: 'Autoriser la répétition',
                        subtitle:
                          'Une même option peut être sélectionnée plusieurs fois',
                        value: _allowDuplicateSelection,
                        onChanged: (value) {
                          setState(() {
                            _allowDuplicateSelection =
                                value;
                          });
                        },
                      )
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ToggleWidget(
                        title: 'Actif',
                        subtitle:
                          'Groupe disponible à la vente',
                        value: _active,
                        onChanged: (value) {
                          setState(() {
                            _active = value;
                          });
                        },
                      )
                    ),
                  ]
                ),
              ],
            ),
          ),
        ],
      );
  }

  Widget _buildView(){
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 15
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: _buildPriceInventoryTab(),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 16,
                  children: [
                    ImageWidget(
                      onpressed:  (newPath) => setState(() => _imagePath = newPath),
                      imagePath: _imagePath,
                    ),
                    ColorWidget(
                      title: "Couleur de l'option",
                      onpressed:   (newColor) => setState(() => _selectedColor = newColor),
                      selectedColor: _selectedColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}