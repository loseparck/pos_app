import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';
import 'package:pos_app/features/catalog/domain/entities/product.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProductDialog extends ConsumerStatefulWidget {
  const ProductDialog({
    super.key,
    this.product,
    this.categoryId,
  });

  final Product? product;
  final String? categoryId;

  @override
  ConsumerState<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends ConsumerState<ProductDialog> {
  final _formKey = GlobalKey<FormState>();

  int _currentStep = 0;
  bool _isSaving = false;

  late final TextEditingController nameController;
  late final TextEditingController skuController;
  late final TextEditingController descriptionController;
  late final TextEditingController codeBarresController;
  late final TextEditingController priceController;
  late final TextEditingController vatController;
  late final TextEditingController stockController;
  late final TextEditingController imageController;

  bool isActive = true;
  Category? selectedCategory;
  int? selectedColor;
  final List<Option> selectedOptions = [];
  Color pickerColor = Colors.blue;

  final List<int> colors = [
    0xFFE57373,
    0xFF64B5F6,
    0xFF81C784,
    0xFFFFD54F,
    0xFFBA68C8,
    0xFFFF8A65,
    0xFF90A4AE,
  ];

  @override
  void initState() {
    super.initState();

    final p = widget.product;
    nameController = TextEditingController(text: p?.name ?? '');
    skuController = TextEditingController(text: p?.sku ?? '');
    descriptionController = TextEditingController(text: p?.description ?? '');
    codeBarresController = TextEditingController(text: p?.codeBarres ?? '');
    priceController = TextEditingController(text: p?.price.toString() ?? '');
    vatController = TextEditingController(text: p?.vat?.toString() ?? '');
    stockController = TextEditingController(text: p?.stockQuantity?.toString() ?? '');
    imageController = TextEditingController(text: p?.image ?? '');

    isActive = p?.isActive ?? true;
    
    if(p != null && p.category != null){
      selectedCategory = ref.read(productsProvider.notifier).getCategory(p.category?.id ?? '');
    } else if (widget.categoryId != null){
      selectedCategory = ref.read(productsProvider.notifier).getCategory(widget.categoryId ?? '');
    }
    
    selectedColor = p?.color;

    if (p?.options != null) {
      selectedOptions.addAll(p!.options!);
    }

    pickerColor = Color(widget.product?.color ?? 0xFF2196F3);
    selectedColor = pickerColor.value;
  }

  @override
  void dispose() {
    nameController.dispose();
    skuController.dispose();
    descriptionController.dispose();
    codeBarresController.dispose();
    priceController.dispose();
    vatController.dispose();
    stockController.dispose();
    imageController.dispose();
    super.dispose();
  }
  File? selectedImageFile;
  final _infoFormKey = GlobalKey<FormState>();
  final _priceFormKey = GlobalKey<FormState>();

  List<Step> get _steps {
    final steps = <Step>[
      Step(
        title: const Text('Infos'),
        content: Form(
          key: _infoFormKey,
          child: _buildInfoStep(),
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text('Prix'),
        content: Form(
          key: _priceFormKey,
          child: _buildPriceStep(),
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text('Image & couleur'),
        content: _buildMediaStep(),
        isActive: _currentStep >= 2,
      ),
    ];

    if (ref.watch(productsProvider).options.isNotEmpty) {
      steps.add(
        Step(
          title: const Text('Options'),
          content: _buildOptionsStep(),
          isActive: _currentStep >= 3,
        ),
      );
    }

    return steps;
  }

  bool _validateCurrentStep() {
    if (_currentStep == 0) {
      return _infoFormKey.currentState?.validate() ?? false;
    }

    if (_currentStep == 1) {
      return _priceFormKey.currentState?.validate() ?? false;
    }

    return true;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked == null) return;

    setState(() {
      selectedImageFile = File(picked.path);
      imageController.text = picked.path;
    });
  }

  Future<void> _submit() async {
    if (!_validateCurrentStep()) return;

    /*if (selectedCategory == null) {
      setState(() => _currentStep = 0);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez choisir une catégorie')),
      );
      return;
    }*/

    setState(() => _isSaving = true);

    final product = Product(
      id: widget.product?.id ?? '',
      name: nameController.text.trim(),
      sku: skuController.text.trim().isEmpty ? null : skuController.text.trim(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
      codeBarres: codeBarresController.text.trim().isEmpty
          ? null
          : codeBarresController.text.trim(),
      price: double.parse(priceController.text.trim()),
      vat: double.tryParse(vatController.text.trim()),
      stockQuantity: double.tryParse(stockController.text.trim()),
      image: imageController.text.trim().isEmpty ? null : imageController.text.trim(),
      color: selectedColor,
      isActive: isActive,
      options: selectedOptions,
      category: selectedCategory,
    );

    if(widget.product!=null){
      ref.read(productsProvider.notifier).updateProduct(product);
    } else {
      ref.read(productsProvider.notifier).addProduct(product);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
     // title: Text(widget.product == null ? 'Nouveau produit' : 'Modifier produit'),
      title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.product == null ? 'Nouveau produit' : 'Modifier produit'),
                IconButton(
                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

      content: SizedBox(
        width: 700,
        height: 520,
        child: Form(
          key: _formKey,
          child: Stepper(
              physics: const NeverScrollableScrollPhysics(),
              currentStep: _currentStep,
              type: StepperType.horizontal,
              onStepTapped: (step) {
                if (_validateCurrentStep()) {
                  setState(() => _currentStep = step);
                }
              },
              controlsBuilder: (context, details) {
                final steps = _steps;
                final isLast = _currentStep == steps.length - 1;

                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       if (_currentStep > 0)
                        TextButton(
                          onPressed: _isSaving
                              ? null
                              : () {
                                  setState(() => _currentStep--);
                                },
                          child: const Text('Retour'),
                        ),

                      const SizedBox(width: 8),

                      ElevatedButton(
                        onPressed: _isSaving
                            ? null
                            : () {
                                if (!_validateCurrentStep()) return;
                                if (isLast) {
                                  _submit();
                                } else {
                                  setState(() => _currentStep++);
                                }
                              },
                        child: Text(isLast ? 'Enregistrer' : 'Suivant'),
                      ),                 
                    ],
                  ),
                );
              },
              steps: _steps
            ),  
        ),
      ),
      actions: [
      ],
    );
  }

  Widget _buildInfoStep() {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Nom *'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Le nom est obligatoire';
            }
            if (value.trim().length < 2) {
              return 'Le nom doit contenir au moins 2 caractères';
            }
            return null;
          },
        ),
        TextFormField(
          controller: skuController,
          decoration: const InputDecoration(labelText: 'SKU'),
        ),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
          maxLines: 3,
        ),
        TextFormField(
          controller: codeBarresController,
          decoration: const InputDecoration(labelText: 'Code-barres'),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<Category?>(
          initialValue: selectedCategory,
          decoration: const InputDecoration(labelText: 'Catégorie'),
          items: [
            const DropdownMenuItem<Category?>(
              value: null,
              child: Text('Sans catégorie'),
            ),
            ...ref.watch(productsProvider).categories.map((category) {
              return DropdownMenuItem<Category?>(
                value: category,
                child: Text(category.name),
              );
            }),
          ],
          onChanged: (value) {
            setState(() => selectedCategory = value);
          },
        ),
        SwitchListTile(
          value: isActive,
          title: const Text('Produit actif'),
          onChanged: (value) {
            setState(() => isActive = value);
          },
        ),
      ],
    );
  }

  Widget _buildPriceStep() {
    return Column(
      children: [
        TextFormField(
          controller: priceController,
          decoration: const InputDecoration(labelText: 'Prix *'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            final price = double.tryParse(value?.replaceAll(',', '.') ?? '');
            if (price == null) {
              return 'Prix invalide';
            }
            if (price < 0) {
              return 'Le prix doit être positif';
            }
            return null;
          },
        ),
        TextFormField(
          controller: vatController,
          decoration: const InputDecoration(labelText: 'TVA (%)'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.trim().isEmpty) return null;

            final vat = double.tryParse(value.replaceAll(',', '.'));
            if (vat == null) return 'TVA invalide';
            if (vat < 0 || vat > 100) return 'La TVA doit être entre 0 et 100';

            return null;
          },
        ),
        TextFormField(
          controller: stockController,
          decoration: const InputDecoration(labelText: 'Quantité en stock'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.trim().isEmpty) return null;

            final stock = double.tryParse(value.replaceAll(',', '.'));
            if (stock == null) return 'Quantité invalide';
            if (stock < 0) return 'La quantité doit être positive';

            return null;
          },
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Center(
      child: InkWell(
        onTap: _pickImage,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade100,
          ),
          child: selectedImageFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    selectedImageFile!,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_photo_alternate, size: 42),
                    SizedBox(height: 8),
                    Text('Choisir une image'),
                  ],
                ),
        ),
      ),
    );
  }

  /*Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Image du produit'),
        const SizedBox(height: 8),

        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: selectedImageFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    selectedImageFile!,
                    fit: BoxFit.cover,
                  ),
                )
              : const Center(
                  child: Icon(Icons.image, size: 40),
                ),
        ),

        const SizedBox(height: 8),

        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.upload),
          label: const Text('Choisir une image'),
        ),
      ],
    );
  }
*/
  
  Widget _buildColorPalette() {
    final colors = [
      0xFFE57373,
      0xFF64B5F6,
      0xFF81C784,
      0xFFFFD54F,
      0xFFBA68C8,
      0xFFFF8A65,
      0xFF4DB6AC,
      0xFFA1887F,
      0xFF90A4AE,
      0xFFFFFFFF,
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: colors.map((colorValue) {
        final selected = selectedColor == colorValue;

        return InkWell(
          onTap: () {
            setState(() => selectedColor = colorValue);
          },
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Color(colorValue),
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? Colors.blue : Colors.grey.shade400,
                width: selected ? 4 : 1,
              ),
            ),
            child: selected
                ? const Icon(Icons.check, color: Colors.black)
                : null,
          ),
        );
      }).toList(),
    );
  }
 
  Widget _buildMediaStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImagePicker(),
        const SizedBox(height: 24),
        const Text('Couleur du produit'),
        const SizedBox(height: 8),
        _buildColorPalette(),
      ],
    );
  }
  /*Widget _buildMediaStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: imageController,
          decoration: const InputDecoration(
            labelText: 'Image',
            hintText: 'Chemin local ou URL',
          ),
        ),
        const SizedBox(height: 20),
        const Text('Couleur du produit'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: colors.map((colorValue) {
            final selected = selectedColor == colorValue;

            return GestureDetector(
              onTap: () {
                setState(() => selectedColor = colorValue);
              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Color(colorValue),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? Colors.black : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: selected
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
*/

  /*Widget _buildOptionsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Options disponibles'),
        const SizedBox(height: 8),
        if (widget.availableOptions.isEmpty)
          const Text('Aucune option disponible')
        else
          ...widget.availableOptions.map((option) {
            final selected = selectedOptions.any((o) => o.id == option.id);

            return CheckboxListTile(
              value: selected,
              title: Text(option.name),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    selectedOptions.add(option);
                  } else {
                    selectedOptions.removeWhere((o) => o.id == option.id);
                  }
                });
              },
            );
          }),
      ],
    );
  }*/

  Widget _buildOptionsStep() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: ref.watch(productsProvider).options.map((option) {
        final selected = selectedOptions.any((o) => o.id == option.id);

        return InkWell(
          onTap: () {
            setState(() {
              if (selected) {
                selectedOptions.removeWhere((o) => o.id == option.id);
              } else {
                selectedOptions.add(option);
              }
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? Colors.blue.shade100 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? Colors.blue : Colors.grey.shade300,
                width: selected ? 2 : 1,
              ),
            ),
            child: Text(
              option.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}