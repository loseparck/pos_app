import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/category.dart';

class CategoryDialog extends ConsumerStatefulWidget {
  const CategoryDialog({
    super.key,
    this.categoryId,
    this.parentId,
  });

  final String? categoryId;
  final String? parentId;

  @override
  ConsumerState<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends ConsumerState<CategoryDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController;

  Category? selectedParent;
  bool _isSaving = false;
  
  late final Category category;

  @override
  void initState(){
    super.initState();
    if(widget.categoryId != null && widget.categoryId != ''){
      category = ref.read(productsProvider.notifier).getCategory(widget.categoryId ?? '');
      _nameController = TextEditingController(text: category.name);
      if(category.parent != null){
        selectedParent = ref.read(productsProvider.notifier).getCategory(category.parent?.id ?? '');
      }
    } else{
      category = Category(name: '');
      _nameController = TextEditingController();
      if(widget.parentId != null && widget.parentId != ''){
        selectedParent = ref.read(productsProvider.notifier).getCategory(widget.parentId ?? '');
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    if(widget.categoryId == null){
      ref.read(productsProvider.notifier).addCategory(category.copyWith( name: _nameController.text.trim()).copyWith(parent: selectedParent, resetParent: selectedParent == null));
    } else {
      ref.read(productsProvider.notifier).updateCategory(category.copyWith( name: _nameController.text.trim()).copyWith(parent: selectedParent, resetParent: selectedParent == null));
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.categoryId == null ? 'Nouvelle catégorie' : 'Modifier catégorie'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom *',
                border: OutlineInputBorder(),
              ),
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

            const SizedBox(height: 16),

            DropdownButtonFormField<Category?>(
              initialValue: selectedParent,
              decoration: const InputDecoration(
                labelText: 'Catégorie parente',
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem<Category?>(
                  value: null,
                  child: Text('Sans catégorie parente'),
                ),
                ...ref.watch(productsProvider).categories.where((category) => category.id != widget.categoryId).map((category) {
                  return DropdownMenuItem<Category?>(
                    value: category,
                    child: Text(category.name),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() => selectedParent = value);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _submit,
          child: _isSaving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(widget.categoryId == null ? 'Enregistrer': 'Modifier'),
        ),
      ],
    );
  }
}