import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/data/repositories/plan_group_provider.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';

class TableEditorPanel extends ConsumerWidget {
  const TableEditorPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupState = ref.watch(planGroupProvider);
    final notifier = ref.read(planGroupProvider.notifier);
    final table = groupState.selectedTable;
    if (table == null) {
      return const Center(child: Text("Aucune table sélectionnée"));
    }

    final nameController = TextEditingController(text: table.name);
    

    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text("Configuration Table",
              style: TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),

          /// NOM
          TextField(
            decoration: const InputDecoration(
              labelText: "Nom / Numéro",
            ),
            controller: nameController,
            onChanged: (value) {
               notifier.changeSeatName(value);
            },
          ),

          const SizedBox(height: 10),

          /// SEATS
          Row(
            children: [
              const Text("Places: "),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  notifier.updateSeatPlaces(-1);
                },
              ),
              Text("${table.seats}"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  notifier.updateSeatPlaces(1);
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// FORME
          Row(
            children: [
              ChoiceChip(
                label: const Text("Carré"),
                selected: table.shape == TableShape.square,
                onSelected: (_) {
                  notifier.toggleShape(TableShape.square);
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text("Cercle"),
                selected: table.shape == TableShape.circle,
                onSelected: (_) {
                  notifier.toggleShape(TableShape.circle);
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// WIDTH
          Row(
            children: [
              const Text("Largeur"),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  notifier.scaleHorizentally(-10);
                },
              ),
              Text("${table.width}"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  notifier.scaleHorizentally(10);
                },
              ),
            ],
          ),

          /// HEIGHT
          Row(
            children: [
              const Text("Hauteur"),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  notifier.scaleVertically(-10);
                },
              ),
              Text("${table.height}"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  notifier.scaleVertically( 10);
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// ROTATION
          Row(
            children: [
              const Text("Rotation"),
              IconButton(
                icon: const Icon(Icons.rotate_left),
                onPressed: () {
                  notifier.rotateTable(-0.25);
                },
              ),
              Text("${table.rotation}"),
              IconButton(
                icon: const Icon(Icons.rotate_right),
                onPressed: () {
                  notifier.rotateTable(0.25);
                },
              ),
            ],
          ),

          const Spacer(),

          /// DELETE
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                notifier.removeTable();
              },
              child: const Text(
                "Supprimer",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}