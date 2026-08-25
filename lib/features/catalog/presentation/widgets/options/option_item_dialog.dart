import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/color_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/drop_down_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/image_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/toggle_widget.dart';

import 'option_dialog_widgets.dart';

class OptionItemDialog extends StatefulWidget {
  final Item? initialData;
  final Option option;

  final Future<String?> Function()? onPickImage;

  const OptionItemDialog({
    super.key,
    required this.option,
    this.initialData,
    this.onPickImage,
  });

  static Future<Item?> show(
    BuildContext context, 
    Option option,{
    Item? initialData,
    Future<String?> Function()? onPickImage,
  }) {
    return showDialog<Item>(
      context: context,
      barrierDismissible: false,
      builder: (_) => OptionItemDialog(
        initialData: initialData,
        onPickImage: onPickImage,
        option: option,
      ),
    );
  }

  @override
  State<OptionItemDialog> createState() =>
      _OptionGroupDialogState();
}

class _OptionGroupDialogState
    extends State<OptionItemDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _skuController;
  late final TextEditingController _additionalPriceController;

  late bool _active;
  late bool _inStock;
  late int _displayOrder;
  double _taxRate = 20;

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

    _skuController = TextEditingController(
      text: data?.sku ?? '',
    );

    _additionalPriceController = TextEditingController(
      text: _formatNumber(data?.additionalPrice),
    );

    _active = data?.isActive ?? true;
    _inStock = data?.inStock ?? true;
    _displayOrder = data?.displayOrder ?? 0;

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

  double _toDouble(String value) {
    return double.tryParse(
          value.trim().replaceAll(',', '.'),
        ) ??
        0;
  }

  String _formatNumber(double? value) {
    if (value == null) return '0';

    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toString();
  }

  void _submit() {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      _showError("Le nom de l'option est obligatoire.");
      return;
    }

    final result = Item(
      id: widget.initialData?.id ?? '',
      name: name,
      description: _descriptionController.text.trim(),
      additionalPrice: _toDouble(
          _additionalPriceController.text,
        ),
      sku: _skuController.text.trim(),
      image: _imagePath,
      color: _selectedColor != null ? '${_selectedColor!.toARGB32()}': null,
      active: _active,
      inStock: _inStock,
      displayOrder: _displayOrder,
      option: widget.option,
      taxRate: _taxRate
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
                      ? "Modifier l'option"
                      : 'Nouvelle options',
                  subtitle:
                      'Ajouter votre option dans le groupe ${widget.option.name}',
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
                      : "Créer l'option",
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

                const SizedBox(
                  height: 8,
                ),

                CustomTextField(
                  controller: _skuController,
                  label: 'Code/SKU',
                  hint: 'Ex. Glace',
                  required: true,
                  icon: Icons.tag_outlined,
                ),

                const SizedBox(
                  height: 8,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _additionalPriceController,
                        label: 'Prix additionnel',
                        hint: 'Ex. Glace',
                        required: true,
                        icon: Icons.attach_money_rounded,
                      )
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: DropDownWidget<double>(
                        label: 'TVA',
                        value: _taxRate,
                        items: const [
                          DropdownMenuItem(
                            value: 0,
                            child: Text(
                              '0 %',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 5.5,
                            child: Text(
                              '5,5 %',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 10,
                            child: Text(
                              '10 %',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 20,
                            child: Text(
                              '20 %',
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            _taxRate = value;
                          });
                        },
                      ),
                    )                    
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SectionWidget(
            title: "Paramètres de l'option",
            icon: Icons.inventory_2_outlined,
            child: Column(
              children: [
                Row(
                  children: [
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
                    const SizedBox(width: 16),
                    Expanded(
                      child: ToggleWidget(
                        title: 'En Stock',
                        subtitle:
                          'Option disponible en stock',
                        value: _inStock,
                        onChanged: (value) {
                          setState(() {
                            _inStock = value;
                          });
                        },
                      )
                    ),
                  ]
                ),
                const SizedBox(height: 6),
                SettingsCard(
                          title: "Ordre d'affichage",
                          subtitle:
                              "Position de l'option dans la liste",
                          icon: Icons.sort_by_alpha_rounded,
                          accentColor: optionPurple,
                          trailing: CounterField(
                            value: _displayOrder,
                            min: 0,
                            max: 99,
                            onChanged:(value){
                              setState(() {
                                _displayOrder = value;
                              });
                            },
                          ),
                        )
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