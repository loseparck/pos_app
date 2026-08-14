import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderNoteField extends ConsumerWidget {
  const OrderNoteField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(46),
        alignment: Alignment.centerLeft,
      ),
      onPressed: () {
        // ouvrira un dialog
      },
      icon: const Icon(Icons.note_alt_outlined),
      label: const Text("Ajouter une note à la commande"),
    );
  }
}