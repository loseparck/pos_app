import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';

class DiscountDialog extends ConsumerStatefulWidget {
  const DiscountDialog({
    super.key,
  });

  @override
  ConsumerState<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends ConsumerState<DiscountDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();

  DiscountType discountType = DiscountType.amount;
  bool _isSaving = false;


  @override
  void dispose() {
    _nameController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSaving = true);
    
    ref.read(productsProvider.notifier).addDiscount(
      Discount(
        name: _nameController.text.trim(),
        value: double.parse(_valueController.text.trim()),
        discountType: discountType
        ));

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nouvelle Réduction'),
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

            TextFormField(
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: 'Valeur *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'La valeur est obligatoire';
                }

                if (double.tryParse(value.trim()) == null) {
                  return 'La valeur doit etre un nombre';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<DiscountType>(
              initialValue: DiscountType.amount,
              decoration: const InputDecoration(
                labelText: 'Type de la Réduction',
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem<DiscountType>(
                  value: DiscountType.amount,
                  child: Text('DH'),
                ),
                const DropdownMenuItem<DiscountType>(
                  value: DiscountType.percentage,
                  child: Text('%'),
                ),
              ],
              onChanged: (value) {
                setState(() => discountType = (value ?? DiscountType.amount));
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
              : Text('Enregistrer'),
        ),
      ],
    );
  }
}