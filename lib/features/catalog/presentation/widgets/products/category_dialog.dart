import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';

import 'package:image_picker/image_picker.dart';


class CategoryDialog extends StatefulWidget {
  final Category? category;

  final List<Category> categories;

  final String? parentId;

  const CategoryDialog({
    super.key,
    this.category,
    required this.categories,
    this.parentId,
  });

  static Future<Category?> show({
    required BuildContext context,
    Category? category,
    required List<Category> categories,
    String? parentId,
  }) {
    return showDialog<Category>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return CategoryDialog(
          category: category,
          categories: categories,
          parentId: parentId,
        );
      },
    );
  }

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;

  final ImagePicker _imagePicker = ImagePicker();

  String? _parentId;

  String? _imagePath;

  bool _removeImage = false;

  bool _isPickingImage = false;

  bool get isEditing => widget.category != null;

  Color? _selectedColor;

  @override
  void initState() {
    super.initState();

    final category = widget.category;

    _nameController = TextEditingController(
      text: category?.name ?? '',
    );

    _parentId = category?.parentId ??  widget.parentId;

    _imagePath = category?.image;
    _selectedColor = category?.color != null ? Color(int.tryParse(category!.color ?? '0') ?? 0) : null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  List<Category> get _availableParents {
    final editingId = widget.category?.id;

    if (editingId == null || editingId.isEmpty) {
      return widget.categories;
    }

    final excludedIds = <String>{
      editingId,
    };

    bool added = true;

    while (added) {
      added = false;

      for (final category in widget.categories) {
        if (category.parentId != null &&
            excludedIds.contains(category.parentId) &&
            !excludedIds.contains(category.id)) {
          excludedIds.add(category.id);
          added = true;
        }
      }
    }

    return widget.categories
        .where((category) => !excludedIds.contains(category.id))
        .toList();
  }

  Future<void> _pickImage() async {
    try {
      setState(() {
        _isPickingImage = true;
      });

      final XFile? file = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (file == null) {
        return;
      }

      setState(() {
        _imagePath = file.path;
        _removeImage = false;
      });
      
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Impossible de sélectionner l’image : $e',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isPickingImage = false;
        });
      }
    }
  }

  void _removeImageFile() {
    setState(() {
      _imagePath = null;
      _removeImage = true;
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _nameController.text.trim();

    final image = _removeImage
        ? null
        : _imagePath;

    final parent = _parentId == null
        ? null
        : _findCategory(_parentId!);

    final result = widget.category == null
        ? Category(
            name: name,
            parent: parent,
            parentId: _parentId,
            image: image,
            color: '${_selectedColor?.toARGB32()}',
          )
        : widget.category!.copyWith(
            name: name,
            parent: parent,
            image: image,
            color: '${_selectedColor?.toARGB32()}',
            resetParent: _parentId == null,
            resetImage: image == null,
            resetColor: _selectedColor == null
          );

    Navigator.of(context).pop(result);
  }

  Category? _findCategory(String id) {
    for (final category in widget.categories) {
      if (category.id == id) {
        return category;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 700,
          maxHeight: 750,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  28,
                  8,
                  28,
                  10,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      _buildImageSection(),

                      const SizedBox(height: 24),

                      _buildLabel(
                        'Nom de la catégorie',
                        required: true,
                      ),

                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _nameController,
                        decoration: _inputDecoration(
                          hintText: 'Ex. Boissons',
                          icon: Icons.category_outlined,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Le nom est obligatoire';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 22),

                      _buildLabel(
                        'Catégorie parente',
                        required: false,
                      ),

                      const SizedBox(height: 8),

                      _buildParentSelector(),

                      const SizedBox(height: 8),

                      Text(
                        'Laissez vide pour créer une catégorie principale.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 22),

                      _buildLabel(
                        'Couleur',
                        required: false,
                      ),

                      const SizedBox(height: 10),

                      _buildColorSelector(),


                    ],
                  ),
                ),
              ),
            ),

            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSelector() {
    const colors = [
      Color(0xFFEF4444),
      Color(0xFFF97316),
      Color(0xFFF59E0B),
      Color(0xFFEAB308),
      Color(0xFF84CC16),
      Color(0xFF22C55E),
      Color(0xFF10B981),
      Color(0xFF14B8A6),
      Color(0xFF06B6D4),
      Color(0xFF0EA5E9),
      Color(0xFF3B82F6),
      Color(0xFF6366F1),
      Color(0xFF8B5CF6),
      Color(0xFFA855F7),
      Color(0xFFD946EF),
      Color(0xFFEC4899),
      Color(0xFFF43F5E),

      Color(0xFF64748B),
      Color(0xFF475569),
      Color(0xFF334155),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _buildColorOption(
            color: null,
            selected: _selectedColor == null,
            onTap: () {
              setState(() {
                _selectedColor = null;
              });
            },
          ),
          ...colors.map(
            (color) {
              return _buildColorOption(
                color: color,
                selected: _selectedColor?.toARGB32() == color.toARGB32(),
                onTap: () {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption({
    required Color? color,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: color == null
          ? 'Aucune couleur'
          : _colorName(color),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 36,
          height: 36,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selected
                  ? const Color(0xFF1677D2)
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? Colors.white,
              border: Border.all(
                color: color == null
                    ? const Color(0xFFCBD5E1)
                    : Colors.transparent,
              ),
            ),
            child: color == null
                ? const Icon(
                    Icons.block,
                    size: 18,
                    color: Color(0xFF94A3B8),
                  )
                : selected
                    ? const Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      )
                    : null,
          ),
        ),
      ),
    );
  }

  String _colorName(Color color) {
    const names = {
      0xFFEF4444: 'Rouge',
      0xFFF97316: 'Orange',
      0xFFF59E0B: 'Ambre',
      0xFFEAB308: 'Jaune',
      0xFF84CC16: 'Vert citron',
      0xFF22C55E: 'Vert',
      0xFF10B981: 'Émeraude',
      0xFF14B8A6: 'Turquoise',
      0xFF06B6D4: 'Cyan',
      0xFF0EA5E9: 'Bleu ciel',
      0xFF3B82F6: 'Bleu',
      0xFF6366F1: 'Indigo',
      0xFF8B5CF6: 'Violet',
      0xFFA855F7: 'Violet clair',
      0xFFD946EF: 'Fuchsia',
      0xFFEC4899: 'Rose',
      0xFFF43F5E: 'Rose rouge',
      0xFF64748B: 'Ardoise',
      0xFF475569: 'Gris foncé',
      0xFF334155: 'Anthracite',
    };

    return names[color.toARGB32()] ?? 'Couleur';
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        28,
        24,
        20,
        18,
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              isEditing
                  ? Icons.edit_outlined
                  : Icons.category_outlined,
              color: const Color(0xFF1677D2),
              size: 24,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  isEditing
                      ? 'Modifier la catégorie'
                      : 'Nouvelle catégorie',
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  isEditing
                      ? 'Modifiez les informations de cette catégorie.'
                      : 'Ajoutez une nouvelle catégorie à votre catalogue.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    final hasImage =
        _imagePath != null &&
        _imagePath!.isNotEmpty &&
        !_removeImage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(
          'Image',
          required: true,
        ),

        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
            ),
          ),
          child: hasImage
              ? _buildImagePreview()
              : _buildImagePlaceholder(),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder() {
    return InkWell(
      onTap: _isPickingImage ? null : _pickImage,
      borderRadius: BorderRadius.circular(18),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.cloud_upload_outlined,
              size: 30,
              color: Color(0xFF1677D2),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            _isPickingImage
                ? 'Chargement...'
                : 'Ajouter une image',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF334155),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Cliquez pour sélectionner une image',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: _buildImage(),
        ),

        Positioned(
          top: 10,
          right: 10,
          child: Row(
            children: [
              _ImageButton(
                icon: Icons.edit_outlined,
                onPressed: _pickImage,
              ),

              const SizedBox(width: 8),

              _ImageButton(
                icon: Icons.delete_outline,
                danger: true,
                onPressed: _removeImageFile,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    final path = _imagePath!;

    if (path.startsWith('http://') ||
        path.startsWith('https://')) {
      return Image.network(
        path,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return _buildImageError();
        },
      );
    }
  
    return Image.file(
      File(path),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) {
        return _buildImageError();
      },
    );
  }

  Widget _buildImageError() {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            size: 42,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          Text(
            'Image indisponible',
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentSelector() {
    return DropdownButtonFormField<String?>(
      initialValue: _parentId,
      isExpanded: true,
      decoration: _inputDecoration(
        hintText: 'Aucune catégorie parente',
        icon: Icons.account_tree_outlined,
      ),
      items: [
        const DropdownMenuItem<String?>(
          value: null,
          child: Text(
            'Aucune catégorie parente',
          ),
        ),

        ..._availableParents.map(
          (category) {
            return DropdownMenuItem<String?>(
              value: category.id,
              child: Text(
                category.name,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ],
      onChanged: (value) {
        setState(() {
          _parentId = value;
        });
      },
    );
  }

  Widget _buildLabel(
    String text, {
    required bool required,
  }) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF334155),
        ),
        children: required
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Color(0xFFDC2626),
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14,
      ),
      prefixIcon: Icon(
        icon,
        size: 20,
        color: Colors.grey.shade500,
      ),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF1677D2),
          width: 1.5,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        28,
        16,
        28,
        22,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Annuler',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ),

          const SizedBox(width: 12),

          FilledButton.icon(
            onPressed: _isPickingImage
                ? null
                : _submit,
            icon: const Icon(
              Icons.check_rounded,
              size: 19,
            ),
            label: Text(
              isEditing
                  ? 'Enregistrer'
                  : 'Créer la catégorie',
            ),
            style: FilledButton.styleFrom(
              backgroundColor:
                  const Color(0xFF1677D2),
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool danger;

  const _ImageButton({
    required this.icon,
    required this.onPressed,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.95),
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Icon(
            icon,
            size: 19,
            color: danger
                ? const Color(0xFFDC2626)
                : const Color(0xFF334155),
          ),
        ),
      ),
    );
  }
}