import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/presentation/orders_view.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/application/plan_notifier.dart';
import 'package:pos_app/features/plan/presentation/widgets/draggable_table.dart';
import 'package:pos_app/features/plan/presentation/widgets/grid_painter.dart';
import 'package:pos_app/features/plan/presentation/widgets/table_editor_panel.dart';

final editModeProvider = StateProvider<bool>((ref) => false);

class PlanView extends ConsumerStatefulWidget{
  const PlanView({super.key});

  @override
  ConsumerState<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends ConsumerState<PlanView>{
  final FocusNode _focusNode = FocusNode();
  final TransformationController _controller = TransformationController();

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      
      final state = ref.read(planProvider);
      if (state.selectedPlanId == null &&
          state.plans.isNotEmpty) {
        ref
            .read(planProvider.notifier)
            .selectPlan(state.plans.first.id);
      }

      FocusScope.of(context).requestFocus(_focusNode);
      
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return;
    final notifier = ref.read(planProvider.notifier);
    final isEditMode = ref.read(editModeProvider);

    if (!isEditMode) return;

    final step = HardwareKeyboard.instance.isShiftPressed ? 20.0 : 5.0;
    if(HardwareKeyboard.instance.isControlPressed){
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          notifier.scaleVertically(step);
          notifier.scaleHorizentally(step);
          break;
        case LogicalKeyboardKey.arrowDown:
          notifier.scaleVertically(-step);
          notifier.scaleHorizentally(-step);
          break;
      }
    } else {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          notifier.changePositionY(-step);
          break;
        case LogicalKeyboardKey.arrowDown:
          notifier.changePositionY(step);
          break;
        case LogicalKeyboardKey.arrowLeft:
          notifier.changePositionX(-step);
          break;
        case LogicalKeyboardKey.arrowRight:
          notifier.changePositionX(step);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupState = ref.watch(planProvider);
    final notifier = ref.read(planProvider.notifier);
    final isEditMode = ref.watch(editModeProvider);
    final tables = groupState.selectedPlanTables;
    final selectedGroup = groupState.selectedPlan;
    
    return Scaffold(
      body: KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKeyEvent,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Column(
        children: [
          //Top BAR
          Container(
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  ...groupState.plans.map((group) {
                    final isSelected = group.id == groupState.selectedPlanId;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? Colors.blue : Colors.grey,
                        ),
                        onPressed: () => notifier.selectPlan(group.id),
                        onLongPress: isEditMode
                          ? () => _showEditGroupDialog(context, notifier, group)
                          : null,
                        child: Text(group.name),
                      ),
                    );
                  }),

                  const Spacer(),

                  if(!isEditMode)
                    TextButton(
                      style: ElevatedButton.styleFrom(backgroundColor:  Colors.orange.shade400),
                      onPressed: () {
                        notifier.startEdition();
                        ref.read(editModeProvider.notifier).state = true;
                      },
                      child: Icon(Icons.edit),
                    ),

                  if(isEditMode) ...[
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Group/Etage"),
                      onPressed: () =>
                            _showAddGroupDialog(context, notifier),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:  Colors.red),
                      onPressed: () {
                        notifier.cancelEdition();
                        ref.read(editModeProvider.notifier).state = false;
                      },
                      child:  Icon(Icons.cancel),
                    ),
                    const SizedBox(width: 8),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
                      onPressed: () {
                        notifier.validateEdition();
                        ref.read(editModeProvider.notifier).state = false;
                      },
                      child:  Icon(Icons.check),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                          notifier.maxY = constraints.maxHeight;
                          notifier.maxX = constraints.maxWidth;
                          return Stack(
                          children: [
                            CustomPaint(
                              size: Size.infinite,
                              painter: GridPainter(),
                            ),
                            ...tables.map((t) =>
                              DraggableTable(table: t, editMode: isEditMode),
                            ),
                            if(isEditMode)
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: Tooltip(
                                  message: "Ajouter une Table",
                                  child: 
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      //shape: const CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.green.shade300,
                                    // minimumSize: const Size(80, 80),
                                    // maximumSize: const Size(100, 100),
                                    ),
                                    onPressed: () => notifier.startTableChange(),//notifier.addTable("Table", 4),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.add_circle_outline_rounded),
                                        Text(
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          "Ajouter une Nouvelle Table"),
                                      ],
                                    )
                                    
                                  ),
                                )
                              ),
                            if(!isEditMode && tables.isEmpty)
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                top: 0,
                                child: Center(
                                  child: Tooltip(
                                  message: "Creer une Commande",
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: EdgeInsets.zero,
                                      backgroundColor: Colors.greenAccent.shade400,
                                      minimumSize: const Size(80, 80),
                                      maximumSize: const Size(100, 100),
                                    ),
                                    onPressed: () {
                                      ref.read(ordersProvider.notifier).initSelectedOrderByTableOrGroupId(selectedGroup.id, false);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersView(supportId:selectedGroup.id, isTable: false,)));
                                    },
                                    child: const Icon(Icons.assignment_add, size: 60),
                                  ),
                                )
                                ),
                              ),
                          const SizedBox(width: 20),
                          ],
                        );
                        })
                      ),
                      if (isEditMode && groupState.tableChange)
                        const SizedBox(
                          width: 300,
                          child: TableEditorPanel(),
                        ),
                    ]
                  ),
                )
              ),
            ],
          ),
        ),
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
              notifier.addPlan(controller.text.trim());
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
    Plan group,
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
              notifier.removePlan(group.id);
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
              notifier.renamePlan(group.id, controller.text);
              Navigator.pop(context);
            }, 
            child: const Text("Valider"),
          ),
        ],
       )
    );
  }
}