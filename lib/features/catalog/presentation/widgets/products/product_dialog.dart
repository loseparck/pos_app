import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'dart:io';
import 'package:pos_app/features/catalog/presentation/widgets/commun/color_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_input_decoration.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/drop_down_widget.dart';

import 'package:pos_app/features/catalog/presentation/widgets/commun/image_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/toggle_widget.dart';

class ProductEditorDialog extends StatefulWidget {
  final Product? product;

  final List<Category> categories;

  final List<Option> options;

  final Category? parentCategory;

  const ProductEditorDialog({
    super.key,
    this.product,
    required this.categories,
    required this.options,
    this.parentCategory
  });

  static Future<Product?> show({
    required BuildContext context,
    Product? product,
    required List<Category> categories,
    required List<Option> options,
    Category? parentCategory
  }) {
    return showDialog<Product>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return ProductEditorDialog(
          product: product,
          categories: categories,
          options: options,
          parentCategory: parentCategory
        );
      },
    );
  }

  @override
  State<ProductEditorDialog> createState() => _ProductEditorDialogState();
}

class _ProductEditorDialogState extends State<ProductEditorDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _skuController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _barcodeController;

  late final TextEditingController _salePriceController;
  late final TextEditingController _purchasePriceController;
  late final TextEditingController _costPriceController;

  late final TextEditingController _stockQuantityController;
  late final TextEditingController _stockMinController;
  late final TextEditingController _stockMaxController;
  late final TextEditingController _reorderPointController;

  late final TextEditingController _supplierNameController;
  late final TextEditingController _supplierReferenceController;
  late final TextEditingController _supplierContactController;

  int _step = 0;

  String? _categoryId;

  String _unit = 'Pièce';

  double _taxRate = 20;

  bool _isActive = true;
  bool _favorite = false;
  bool _isWeighable = false;
  bool _isService = false;
  bool _stockEnabled = false;
  bool _allowNegativeStock = true;

  String? _imagePath;
  Color? _selectedColor;

  final Set<Option> _selectedOption = {};

  bool get isEditing => widget.product != null;


  final FocusNode salePriceFocusNode = FocusNode();
  final FocusNode purchasePriceFocusNode = FocusNode();
  final FocusNode costPriceFocusNode = FocusNode();
  final FocusNode stockQuantityFocusNode = FocusNode();
  final FocusNode stockMinFocusNode = FocusNode();
  final FocusNode stockMaxFocusNode = FocusNode();
  final FocusNode reorderPointFocusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();

    final product = widget.product;

    _nameController = TextEditingController(
      text: product?.name ?? '',
    );

    _skuController = TextEditingController(
      text: product?.sku ?? '',
    );

    _descriptionController = TextEditingController(
      text: product?.description ?? '',
    );

    _barcodeController = TextEditingController(
      text: product?.barcode ?? '',
    );

    _salePriceController = TextEditingController(
      text: _formatNumber(product?.salePrice),
    );

    _purchasePriceController = TextEditingController(
      text: _formatNumber(product?.purchasePrice),
    );

    _costPriceController = TextEditingController(
      text: _formatNumber(product?.costPrice),
    );

    _stockQuantityController = TextEditingController(
      text: _formatNumber(product?.stockQuantity),
    );

    _stockMinController = TextEditingController(
      text: _formatNumber(product?.stockMin),
    );

    _stockMaxController = TextEditingController(
      text: _formatNumber(product?.stockMax),
    );

    _reorderPointController = TextEditingController(
      text: _formatNumber(product?.reorderPoint),
    );

    _supplierNameController = TextEditingController(
      text: '', //text: product?.supplierName ?? '',
    );

    _supplierReferenceController = TextEditingController(
      text: '', //text: product?.supplierReference ?? '',
    );

    _supplierContactController = TextEditingController(
      text: '', //text: product?.supplierContact ?? '',
    );
    
    salePriceFocusNode.addListener(() {
      if (!salePriceFocusNode.hasFocus) {
        if (_salePriceController.text.trim().isEmpty) {
          _salePriceController.text = '0';
        }
      }
    });

    purchasePriceFocusNode.addListener(() {
      if (!purchasePriceFocusNode.hasFocus) {
        if (_purchasePriceController.text.trim().isEmpty) {
          _purchasePriceController.text = '0';
        }
      }
    });

    costPriceFocusNode.addListener(() {
      if (!costPriceFocusNode.hasFocus) {
        if (_costPriceController.text.trim().isEmpty) {
          _costPriceController.text = '0';
        }
      }
    });

    stockQuantityFocusNode.addListener(() {
      if (!stockQuantityFocusNode.hasFocus) {
        if (_stockQuantityController.text.trim().isEmpty) {
          _stockQuantityController.text = '0';
        }
      }
    });

    stockMinFocusNode.addListener(() {
      if (!stockMinFocusNode.hasFocus) {
        if (_stockMinController.text.trim().isEmpty) {
          _stockMinController.text = '0';
        }
      }
    });

    stockMaxFocusNode.addListener(() {
      if (!stockMaxFocusNode.hasFocus) {
        if (_stockMaxController.text.trim().isEmpty) {
          _stockMaxController.text = '0';
        }
      }
    });

    reorderPointFocusNode.addListener(() {
      if (!reorderPointFocusNode.hasFocus) {
        if (_reorderPointController.text.trim().isEmpty) {
          _reorderPointController.text = '0';
        }
      }
    });

    _categoryId = widget.parentCategory != null ? widget.parentCategory!.id : product?.category?.id;

    _unit = product?.unit ?? 'Pièce';

    _taxRate = product?.taxRate ?? 20;

    _isActive = product?.isActive ?? true;
    _favorite = product?.favorite ?? false;
    _isService = product?.service ?? true;
    _isWeighable = product?.weighted ?? false;

    _stockEnabled = product?.stockEnabled ?? true;

    _allowNegativeStock = product?.allowNegativeStock ?? true;

    _imagePath = product?.image;
    _selectedColor = product?.color != null ? Color(product!.color!) : null;

    _selectedOption.addAll(
      product?.options ?? const [],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _skuController.dispose();
    _descriptionController.dispose();
    _barcodeController.dispose();

    _salePriceController.dispose();
    _purchasePriceController.dispose();
    _costPriceController.dispose();

    _stockQuantityController.dispose();
    _stockMinController.dispose();
    _stockMaxController.dispose();
    _reorderPointController.dispose();

    _supplierNameController.dispose();
    _supplierReferenceController.dispose();
    _supplierContactController.dispose();

    salePriceFocusNode.dispose();
    purchasePriceFocusNode.dispose();
    costPriceFocusNode.dispose();
    stockQuantityFocusNode.dispose();
    stockMinFocusNode.dispose();
    stockMaxFocusNode.dispose();

    super.dispose();
  }

  String _formatNumber(double? value) {
    if (value == null) return '0';

    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toString();
  }

  double _toDouble(String value) {
    return double.tryParse(
          value.trim().replaceAll(',', '.'),
        ) ??
        0;
  }

  String? _nullable(String value) {
    final result = value.trim();

    return result.isEmpty ? null : result;
  }

  double get _salePrice => _toDouble(_salePriceController.text);

  double get _purchasePrice => _toDouble(_purchasePriceController.text);

  double get _costPrice => _toDouble(_costPriceController.text);

  double get _margin => _salePrice - _costPrice;

  double get _marginPercentage =>
      _salePrice <= 0 ? 0 : (_margin / _salePrice) * 100;

  void _next() {
    if (_step == 0) {
      if (!_formKey.currentState!.validate()) {
        return;
      }
    }

    if (_step < 3) {
      setState(() {
        _step++;
      });
      return;
    }

    _save();
  }

  void _previous() {
    if (_step == 0) return;

    setState(() {
      _step--;
    });
  }

  void _goToStep(int step) {
    if (step <= _step) {
      setState(() {
        _step = step;
      });
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _step = 0;
      });

      return;
    }

    final existing = widget.product;

    final Product result;
    
    if (existing == null) {
      result = Product(
        name: _nameController.text.trim(),
        sku: _nullable(_skuController.text),
        description: _nullable(_descriptionController.text),
        barcode: _nullable(_barcodeController.text),
        category:
            _categoryId != null ? Category(name: '', id: _categoryId!) : null,
        unit: _unit,
        isActive: _isActive,
        favorite: _favorite,
        weighted: _isWeighable,
        service: _isService,
        image: _imagePath,
        color: _selectedColor?.toARGB32(),
        /* supplierName:
          _nullable(_supplierNameController.text),
      supplierReference:
          _nullable(
            _supplierReferenceController.text,
          ),
      supplierContact:
          _nullable(
            _supplierContactController.text,
          ),*/
        salePrice: _salePrice,
        purchasePrice: _purchasePrice,
        costPrice: _costPrice,
        taxRate: _taxRate,
        stockEnabled: _stockEnabled,
        allowNegativeStock:  _allowNegativeStock,
        stockQuantity: _toDouble(
          _stockQuantityController.text,
        ),
        stockMin: _toDouble(
          _stockMinController.text,
        ),
        stockMax: _toDouble(
          _stockMaxController.text,
        ),
        reorderPoint:  _toDouble(
            _reorderPointController.text,
        ),
        options: _selectedOption.toList()
      );
    } else {
      result = existing.copyWith(
        name: _nameController.text.trim(),
        sku: _nullable(_skuController.text),
        description: _nullable(_descriptionController.text),
        barcode: _nullable(_barcodeController.text),
        category:
            _categoryId != null ? Category(name: '', id: _categoryId!) : null,
        unit: _unit,
        isActive: _isActive,
        favorite: _favorite,
        service: _isService,
        weighted: _isWeighable,
        image: _imagePath,
        color: _selectedColor?.toARGB32(),
        /*supplierName:
          _nullable(_supplierNameController.text),
      supplierReference:
          _nullable(
            _supplierReferenceController.text,
          ),
      supplierContact:
          _nullable(
            _supplierContactController.text,
          ),*/
        salePrice: _salePrice,
        purchasePrice: _purchasePrice,
        costPrice: _costPrice,
        taxRate: _taxRate,
        stockEnabled: _stockEnabled,
        allowNegativeStock: _allowNegativeStock,
        stockQuantity: _toDouble(
          _stockQuantityController.text,
        ),
        stockMin: _toDouble(
          _stockMinController.text,
        ),
        stockMax: _toDouble(
          _stockMaxController.text,
        ),
        reorderPoint: _toDouble(
            _reorderPointController.text,
        ),
        options: _selectedOption.toList(),
        resetCategory: _categoryId == null,
        resetColor: _selectedColor == null,
        resetImage: _imagePath == null,
      );
    }

    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFF7F5FA),
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1120,
          maxHeight: 860,
        ),
        child: Column(
          children: [
            _buildHeader(),
            _buildStepper(),
            Expanded(
              child: Form(
                key: _formKey,
                child: IndexedStack(
                  index: _step,
                  children: [
                    _buildInformationTab(),
                    _buildPriceInventoryTab(),
                    _buildOptionsTab(),
                    _buildSummaryTab(),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        28,
        20,
        20,
        16,
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE6FF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFF6541C1),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEditing ? 'Modifier le produit' : 'Nouveau produit',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  isEditing
                      ? 'Modifiez les informations de votre produit'
                      : 'Ajoutez un produit à votre catalogue ${widget.parentCategory != null ? widget.parentCategory!.name.toUpperCase() : 'POS'}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    const labels = [
      'Informations',
      'Prix & inventaire',
      'Options',
      'Résumé',
    ];

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 28,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E1EA),
        ),
      ),
      child: Row(
        children: List.generate(
          labels.length,
          (index) {
            final active = index == _step;

            final completed = index < _step;

            return Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: completed ? () => _goToStep(index) : null,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: active || completed
                                ? const Color(
                                    0xFF6841C6,
                                  )
                                : const Color(
                                    0xFFE1DFE5,
                                  ),
                          ),
                          child: Center(
                            child: completed
                                ? const Icon(
                                    Icons.check,
                                    size: 17,
                                    color: Colors.white,
                                  )
                                : Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: active
                                          ? Colors.white
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                active ? FontWeight.w700 : FontWeight.w500,
                            color: active
                                ? const Color(
                                    0xFF5B2DB8,
                                  )
                                : const Color(
                                    0xFF4D4A51,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index < labels.length - 1)
                    Expanded(
                      child: Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        color: index < _step
                            ? const Color(
                                0xFF8D70CD,
                              )
                            : const Color(
                                0xFFE0DDE5,
                              ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInformationTab() {
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
                child: SectionWidget(
                  title: 'Informations générales',
                  icon: Icons.info_outline,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        label: 'Nom du produit',
                        hint: 'Ex. Coca Cola 33cl',
                        required: true,
                        icon: Icons.shopping_bag_outlined,
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _skuController,
                              label: 'SKU / Référence',
                              hint: 'Ex. PROD-001',
                              icon: Icons.tag_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _barcodeController,
                              label: 'Code-barres',
                              hint: 'Scanner ou saisir',
                              icon: Icons.qr_code_2_outlined,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      CustomTextField(
                        controller: _descriptionController,
                        label: 'Description',
                        hint: 'Description du produit...',
                        icon: Icons.notes_outlined,
                        maxLines: 3,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: DropDownWidget<String>(
                              label: 'Catégorie',
                              value: _categoryId,
                              hint: 'Sélectionner',
                              items: 
                              [
                                DropdownMenuItem<String>(
                                      value: null,
                                      child: Text(
                                        'Sans Catégorie',
                                      ),
                                ),
                                ...widget.categories
                                  .map(
                                    (category) => DropdownMenuItem<String>(
                                      value: category.id,
                                      child: Text(
                                        category.name,
                                      ),
                                    ),
                                  )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _categoryId = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: DropDownWidget<String>(
                              label: 'Unité de mesure',
                              value: _unit,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Pièce',
                                  child: Text(
                                    'Pièce',
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Kg',
                                  child: Text(
                                    'Kilogramme',
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'g',
                                  child: Text(
                                    'Gramme',
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'L',
                                  child: Text(
                                    'Litre',
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'cl',
                                  child: Text(
                                    'Centilitre',
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'm',
                                  child: Text(
                                    'Mètre',
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }

                                setState(() {
                                  _unit = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: ToggleWidget(
                            title: 'Produit actif',
                            subtitle: 'Disponible à la vente',
                            value: _isActive,
                            onChanged: (value) {
                              setState(() {
                                _isActive = value;
                              });
                            },
                          ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: ToggleWidget(
                              title: 'Produit pesable',
                              subtitle: 'Vendu au poids',
                              value: _isWeighable,
                              onChanged: (value) {
                                setState(() {
                                  _isWeighable = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: ToggleWidget(
                              title: 'Produit service',
                              subtitle: 'Sans stock physique',
                              value: _isService,
                              onChanged: (value) {
                                setState(() {
                                  _isService = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: ToggleWidget(
                              title: 'Produit favori',
                              subtitle: 'Afficher en priorité dans le POS',
                              value: _favorite,
                              onChanged: (value) {
                                setState(() {
                                  _favorite = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                     DropDownWidget<String>(
                              label: 'fournisseur',
                              value: _categoryId,
                              hint: 'Sélectionner',
                              items: widget.categories
                                  .map(
                                    (category) => DropdownMenuItem<String>(
                                      value: category.id,
                                      child: Text(
                                        category.name,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _categoryId = value;
                                });
                              },
                            ),
                    ],
                  ),
                ),
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

  Widget _localImage() {
    if (_imagePath == null) {
      return const SizedBox();
    }

    if (_imagePath!.startsWith('http')) {
      return Image.network(
        _imagePath!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _imageError(),
      );
    }

    return Image.file(
      File(_imagePath!),
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _imageError(),
    );
  }

  Widget _imageError() {
    return Container(
      color: const Color(0xFFF0EDF4),
      child: const Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 42,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPriceInventoryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          SectionWidget(
            title: 'Tarification',
            icon: Icons.euro_outlined,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _numberField(
                        controller: _salePriceController,
                        focusNode: salePriceFocusNode,
                        label: 'Prix de vente',
                        suffix: 'DH',
                        required: true,
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: _numberField(
                        controller: _purchasePriceController,
                        focusNode: purchasePriceFocusNode,
                        label: 'Prix d’achat',
                        suffix: 'DH',
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: _numberField(
                        controller: _costPriceController,
                        focusNode: costPriceFocusNode,
                        label: 'Prix coûtant',
                        suffix: 'DH',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
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
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: _buildMarginCard(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SectionWidget(
            title: 'Paramètres d’inventaire',
            icon: Icons.inventory_2_outlined,
            child: Column(
              children: [
                ToggleWidget(
                  title: 'Gestion du stock',
                  subtitle:
                      'Déduire automatiquement les quantités lors des ventes',
                  value: _stockEnabled,
                  onChanged: (value) {
                    setState(() {
                      _stockEnabled = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                IgnorePointer(
                  ignoring: !_stockEnabled,
                  child: Opacity(
                    opacity: _stockEnabled ? 1 : .45,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _numberField(
                                controller: _stockQuantityController,
                                focusNode: stockQuantityFocusNode,
                                label: 'Stock initial',
                                suffix: _unit,
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: _numberField(
                                controller: _reorderPointController,
                                focusNode: reorderPointFocusNode,
                                label: 'Seuil de réapprovisionnement',
                                suffix: _unit,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _numberField(
                                controller: _stockMinController,
                                focusNode: stockMinFocusNode,
                                label: 'Stock minimum',
                                suffix: _unit,
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: _numberField(
                                controller: _stockMaxController,
                                focusNode: stockMaxFocusNode,
                                label: 'Stock maximum',
                                suffix: _unit,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        ToggleWidget(
                          title: 'Autoriser le stock négatif',
                          subtitle:
                              'Permettre une vente même si le stock atteint zéro',
                          value: _allowNegativeStock,
                          onChanged: (value) {
                            setState(() {
                              _allowNegativeStock = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarginCard() {
    final margin = _margin;

    final percentage = _marginPercentage;

    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EEFF),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: const Color(0xFFE1D5F8),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.trending_up,
            color: Color(0xFF6841C6),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Marge estimée',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${margin.toStringAsFixed(2)} €'
                '  (${percentage.toStringAsFixed(1)} %)',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6841C6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: SectionWidget(
        title: 'Options du produit',
        icon: Icons.tune_outlined,
        subtitle:
            'Sélectionnez les options déjà configurées qui seront disponibles pour ce produit.',
        child: widget.options.isEmpty
            ? _emptyOptions()
            : Column(
                children: widget.options
                    .map(
                      (option) => _optionTile(
                        option,
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }

  Widget _emptyOptions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF8FD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE2DCEC),
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.tune_outlined,
            size: 44,
            color: Color(0xFF8B78B4),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Aucune option disponible',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Les options doivent être créées '
            'depuis la gestion des options.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionTile(
    Option option,
  ) {
    final selected = _selectedOption.contains(option);
    return InkWell(
      onTap: () {
        setState(() {
          if (selected) {
            _selectedOption.remove(option);
          } else {
            _selectedOption.add(option);
          }
        });
      },
      borderRadius: BorderRadius.circular(13),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 9,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(
                  0xFFF4EEFF,
                )
              : Colors.white,
          borderRadius: BorderRadius.circular(
            13,
          ),
          border: Border.all(
            color: selected
                ? const Color(
                    0xFFB9A5E4,
                  )
                : const Color(
                    0xFFE5E1E9,
                  ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: selected
                    ? const Color(
                        0xFFE7DCFA,
                      )
                    : const Color(
                        0xFFF3F1F5,
                      ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Icon(
                Icons.tune,
                size: 19,
                color: selected
                    ? const Color(
                        0xFF6841C6,
                      )
                    : Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Expanded(
              child: Text(
                option.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Checkbox(
              value: selected,
              activeColor: const Color(
                0xFF6841C6,
              ),
              onChanged: (_) {
                setState(() {
                  if (selected) {
                    _selectedOption.remove(
                      option,
                    );
                  } else {
                    _selectedOption.add(
                      option,
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryTab() {
    final category = widget.categories
        .where(
          (c) => c.id == _categoryId,
        )
        .firstOrNull;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          _summaryHero(),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _summarySection(
                  title: 'Informations',
                  icon: Icons.info_outline,
                  step: 0,
                  children: [
                    _summaryRow(
                      'Nom',
                      _nameController.text.trim(),
                    ),
                    _summaryRow(
                      'SKU',
                      _display(
                        _skuController.text,
                      ),
                    ),
                    _summaryRow(
                      'Code-barres',
                      _display(
                        _barcodeController.text,
                      ),
                    ),
                    _summaryRow(
                      'Catégorie',
                      category?.name ?? 'Aucune',
                    ),
                    _summaryRow(
                      'Unité',
                      _unit,
                    ),
                    _summaryRow(
                      'Favori',
                      _favorite ? 'Oui' : 'Non',
                    ),
                    _summaryRow(
                      'Statut',
                      _isActive ? 'Actif' : 'Inactif',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: _summarySection(
                  title: 'Prix & inventaire',
                  icon: Icons.inventory_2_outlined,
                  step: 1,
                  children: [
                    _summaryRow(
                      'Prix de vente',
                      '${_salePrice.toStringAsFixed(2)} €',
                    ),
                    _summaryRow(
                      'Prix d’achat',
                      '${_purchasePrice.toStringAsFixed(2)} €',
                    ),
                    _summaryRow(
                      'Prix coûtant',
                      '${_costPrice.toStringAsFixed(2)} €',
                    ),
                    _summaryRow(
                      'TVA',
                      '${_taxRate.toStringAsFixed(_taxRate == _taxRate.roundToDouble() ? 0 : 1)} %',
                    ),
                    _summaryRow(
                      'Marge',
                      '${_margin.toStringAsFixed(2)} € '
                          '(${_marginPercentage.toStringAsFixed(1)} %)',
                    ),
                    _summaryRow(
                      'Stock',
                      _stockEnabled
                          ? '${_toDouble(_stockQuantityController.text)} $_unit'
                          : 'Désactivé',
                    ),
                    _summaryRow(
                      'Seuil réappro.',
                      '${_toDouble(_reorderPointController.text)} $_unit',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _summarySection(
                  title: 'Options',
                  icon: Icons.tune_outlined,
                  step: 2,
                  children: [
                    if (_selectedOption.isEmpty)
                      _summaryRow(
                        'Options',
                        'Aucune',
                      )
                    else
                      ..._selectedOption.map(
                        (option) => _summaryRow(
                          'Option',
                          option.name,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: _summarySection(
                  title: 'Fournisseur',
                  icon: Icons.local_shipping_outlined,
                  step: 0,
                  children: [
                    _summaryRow(
                      'Fournisseur',
                      _display(
                        _supplierNameController.text,
                      ),
                    ),
                    _summaryRow(
                      'Référence',
                      _display(
                        _supplierReferenceController.text,
                      ),
                    ),
                    _summaryRow(
                      'Contact',
                      _display(
                        _supplierContactController.text,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          _summarySection(
            title: 'Description',
            icon: Icons.notes_outlined,
            step: 0,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _descriptionController.text.trim().isEmpty
                      ? 'Aucune description'
                      : _descriptionController.text.trim(),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryHero() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE5E0E9),
        ),
      ),
      child: Row(
        children: [
          _summaryProductImage(),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _nameController.text.trim().isEmpty
                      ? 'Nouveau produit'
                      : _nameController.text.trim(),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _categoryName(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    _statusChip(
                      _isActive ? 'Actif' : 'Inactif',
                      _isActive,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    if (_favorite)
                      _statusChip(
                        'Favori',
                        true,
                        icon: Icons.star,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${_salePrice.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6841C6),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Prix de vente',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryProductImage() {
    if (_imagePath == null || _imagePath!.isEmpty) {
      return Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: _selectedColor ??
              const Color(
                0xFFEDE8F7,
              ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(
          Icons.shopping_bag_outlined,
          size: 30,
          color: Colors.white,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: 76,
        height: 76,
        child: _localImage(),
      ),
    );
  }

  String _categoryName() {
    for (final category in widget.categories) {
      if (category.id == _categoryId) {
        return category.name;
      }
    }

    return 'Aucune catégorie';
  }

  Widget _statusChip(
    String label,
    bool active, {
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFEDE7FA) : const Color(0xFFF0EFF2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.circle,
            size: icon == null ? 7 : 13,
            color: active
                ? const Color(
                    0xFF6841C6,
                  )
                : Colors.grey,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: active
                  ? const Color(
                      0xFF6841C6,
                    )
                  : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _summarySection({
    required String title,
    required IconData icon,
    required int step,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE6E1EA),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF0EAFE,
                  ),
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 17,
                  color: const Color(
                    0xFF6841C6,
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _goToStep(step),
                child: const Text(
                  'Modifier',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 22,
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _display(String value) {
    final v = value.trim();

    return v.isEmpty ? '-' : v;
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        28,
        15,
        28,
        20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFE5E1E9),
          ),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Annuler',
              style: TextStyle(
                color: Color(0xFF625A6C),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          if (_step > 0)
            OutlinedButton.icon(
              onPressed: _previous,
              icon: const Icon(
                Icons.arrow_back,
                size: 17,
              ),
              label: const Text(
                'Précédent',
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(
                  0xFF5B2DB8,
                ),
                side: const BorderSide(
                  color: Color(
                    0xFFD8CBEF,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    11,
                  ),
                ),
              ),
            ),
          if (_step > 0)
            const SizedBox(
              width: 10,
            ),
          FilledButton.icon(
            onPressed: _next,
            icon: Icon(
              _step == 3 ? Icons.check : Icons.arrow_forward,
              size: 18,
            ),
            label: Text(
              _step == 3 ? 'Enregistrer' : 'Suivant',
            ),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(
                0xFF6841C6,
              ),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    String? suffix,
    bool required = false,
    bool enabled = true,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: CustomInputDecoration.dropDownDecoration(
        label: label,
        suffix: suffix,
      ),
      onTap: (){
        if(controller.text == '0'){
          controller.text = '';
        }
      },
      onChanged: (value){
        setState(() {});
      },
      validator: required
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Champ obligatoire';
              }

              if (_toDouble(value) < 0) {
                return 'Valeur invalide';
              }

              return null;
            }
          : null,
    );
  }
}