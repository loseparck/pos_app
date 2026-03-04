import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pos_app/features/plan/data/repositories/plan_group_provider.dart';
import 'package:pos_app/features/plan/domain/entities/plan_group_entity.dart';
import 'package:pos_app/features/plan/presentation/state/plan_state_notifier.dart';
import 'package:pos_app/features/plan/presentation/widgets/draggable_table.dart';
import 'package:pos_app/features/plan/presentation/widgets/grid_painter.dart';

final editModeProvider = StateProvider<bool>((ref) => false);

class PlanView extends ConsumerStatefulWidget{
  const PlanView({super.key});

  @override
  ConsumerState<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends ConsumerState<PlanView>{

  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    final groupState = ref.watch(planGroupProvider);
    final notifier = ref.read(planGroupProvider.notifier);
    final isEditMode = ref.watch(editModeProvider);
    final selectedGroup = groupState.selectedGroup;

    return Scaffold(
      body: Column(
        children: [
          //Top BAR
          Container(
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  // Tabs des groupes
                  ...groupState.groups.map((group) {
                    final isSelected = group.id == groupState.selectedGroupId;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? Colors.blue : Colors.grey,
                        ),
                        onPressed: () => notifier.selectGroup(group.id),
                        onLongPress: isEditMode
                          ? () => _showEditGroupDialog(context, notifier, group)
                          : null,
                        child: Text(group.name),
                      ),
                    );
                  }),

                  const Spacer(),

                  if(!isEditMode)
                    ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text("Modifier"),
                      onPressed: () {
                        notifier.startEdition();
                        ref.read(editModeProvider.notifier).state = true;
                      },
                    ),

                  if(isEditMode) ...[
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Group/Etage"),
                      onPressed: () =>
                            _showAddGroupDialog(context, notifier),
                    ),
                    const SizedBox(width: 8),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.table_restaurant),
                      label: const Text("Table"),
                      onPressed: selectedGroup == null
                        ? null
                        : () => _showAddTableDialog(context, notifier),
                    ),
                    const SizedBox(width: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:  Colors.red),
                      onPressed: () {
                        notifier.cancelEdition();
                        ref.read(editModeProvider.notifier).state = false;
                      },
                      child: const Text("Annuler"),
                    ),
                    const SizedBox(width: 8),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
                      onPressed: () {
                        notifier.validateEdition();
                        ref.read(editModeProvider.notifier).state = false;
                      },
                      child: const Text("Valider"),
                    ),
                  ]
                ],
              ),
          ),

          Expanded(
            child: selectedGroup == null
              ? const Center(child: Text("Ajouter un Group ou étage pour commencer"))
              : InteractiveViewer(
                  transformationController: _controller,
                  minScale: 0.5,
                  maxScale: 3.0,
                  //boundaryMargin: const EdgeInsets.all(500),
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size.infinite,
                        painter: GridPainter(),
                      ),
                      ...selectedGroup.tables.map((t) =>
                        DraggableTable(table: t, editMode: isEditMode),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }

  void _showAddGroupDialog(
    BuildContext context,
    PlanGroupNotifier notifier
  ) {
    final controller = TextEditingController();

    showDialog(
      context: context,
       builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Ajouter un Group ou étage"),
            IconButton(
              style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: TextField(
          controller: controller,
          decoration:  const InputDecoration(hintText: "Nom du Group ou étage"),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
            onPressed: () {
              notifier.addGroup(controller.text.trim());
              Navigator.pop(context);
            }, 
            child: const Text("Ajouter"),
          ),
        ],
       )
    );
  }

  void _showAddTableDialog(
    BuildContext context,
    PlanGroupNotifier notifier
  ) {
    final nameController = TextEditingController();
    final seatsController = TextEditingController();

    showDialog(
      context: context,
       builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Ajouter une Table"),
            IconButton(
              style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration:  const InputDecoration(hintText: "Nom ou Numéro"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: seatsController,
              keyboardType: TextInputType.number,
              decoration:  const InputDecoration(hintText: "Nombre de Places"),
            ),
          ],
        ) ,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
            onPressed: () {
              final seats = int.tryParse(
                seatsController.text.trim()) ??
                4;
              notifier.addTable(nameController.text, seats);
              Navigator.pop(context);
            }, 
            child: const Text("Ajouter"),
          ),
        ],
       )
    );
  }

  void _showEditGroupDialog(
    BuildContext context,
    PlanGroupNotifier notifier,
    PlanGroup group,
  ) {
    final controller = TextEditingController(text: group.name);

    showDialog(
      context: context,
       builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Modifier Group ou étage"),
            IconButton(
              style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () {
              notifier.removeGroup(group.id);
              Navigator.pop(context);
            }, 
            child: const Text(
              "Supprimer",
              style: TextStyle(color: Colors.red)
              ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
            onPressed: () {
              notifier.renameGroup(group.id, controller.text);
              Navigator.pop(context);
            }, 
            child: const Text("Valider"),
          ),
        ],
       )
    );
  }
}