import 'package:flutter/material.dart';

Future<String?> showProductNoteDialog(
  BuildContext context, {
  String? initialNote,
}) async {
  final controller = TextEditingController(
    text: initialNote ?? '',
  );

  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Note pour le produit'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            hintText: 'Ex: sans oignons, bien cuit...',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (_) {
            Navigator.of(context).pop(controller.text.trim());
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(
                controller.text.trim(),
              );
            },
            child: const Text('Ajouter'),
          ),
        ],
      );
    },
  );
}
