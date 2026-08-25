import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/application/plan_notifier.dart';
import 'package:pos_app/features/plan/presentation/widgets/draggable_table.dart';
import 'package:pos_app/features/plan/presentation/widgets/grid_painter.dart';
import 'package:pos_app/features/plan/presentation/widgets/table_editor_panel.dart';
import 'package:pos_app/features/settings/presentation/pages/setting_pos.dart';
import 'package:pos_app/features/settings/presentation/widgets/sidebar_item.dart';

final editModeProvider = StateProvider<bool>((ref) => false);
final moreActionProvider = StateProvider<bool>((ref) => false);

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
      if (state.selectedPlanId == null && state.plans.isNotEmpty) {
        ref.read(planProvider.notifier).selectPlan(state.plans.first.id);
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

  @override
  Widget build(BuildContext context) {
    final groupState = ref.watch(planProvider);
    final notifier = ref.read(planProvider.notifier);
    final isEditMode = ref.watch(editModeProvider);
    final tables = groupState.selectedPlanTables;
    final selectedGroup = groupState.selectedPlan;
    final isMoreActionActivated = ref.watch(moreActionProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(_focusNode),
          child: Stack(
            children: [
              // Contenu principal de la grille
              Column(
                children: [
                  Expanded(
                    child: selectedGroup == null
                        ? const Center(
                            child: Text(
                              "Sélectionnez ou créez un étage pour commencer",
                              style: TextStyle(color: Color(0xFF64748B), fontSize: 16),
                            ),
                          )
                        : InteractiveViewer(
                            transformationController: _controller,
                            minScale: 0.5,
                            maxScale: 3.0,
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
                                          ...tables.map((t) => DraggableTable(table: t, editMode: isEditMode)),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                if (isEditMode && groupState.tableChange)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: .05),//.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: const Offset(-5, 0),
                                        ),
                                      ],
                                    ),
                                    width: 320,
                                    child: const TableEditorPanel(),
                                  ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),

              // 1. Barre de navigation des étages (Style capsule moderne)
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .9),//.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .03),//.withOpacity(0.03),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: groupState.plans.map((group) {
                      final isSelected = group.id == groupState.selectedPlanId;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => notifier.selectPlan(group.id),
                            onLongPress: isEditMode ? () => _showEditGroupDialog(context, notifier, group) : null,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF0F172A) : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFF0F172A).withValues(alpha: .3),//.withOpacity(0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        )
                                      ]
                                    : [],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    group.name,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFF64748B),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  /*Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white.withOpacity(0.18)
                                          : const Color(0xFFEFF1F5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '${group.id == groupState.selectedPlanId ? tables.length : 0}',
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : const Color(0xFF64748B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // 2. Boutons d'actions en haut à droite (Style groupé épuré)
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .03),//.withOpacity(0.03),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isEditMode) ...[
                        IconButton(
                          onPressed: () {
                            notifier.startEdition();
                            ref.read(editModeProvider.notifier).state = true;
                          },
                          icon: const Icon(Icons.edit_rounded, size: 20, color: Color(0xFF0F172A)),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFFF1F5F9),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          onPressed: () {
                            ref.read(moreActionProvider.notifier).state = !isMoreActionActivated;
                          },
                          icon: const Icon(Icons.more_horiz_rounded, size: 20, color: Color(0xFF0F172A)),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ] else ...[
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          icon: const Icon(Icons.add_rounded, size: 18),
                          label: const Text("Étage", style: TextStyle(fontWeight: FontWeight.w600)),
                          onPressed: () => _showAddGroupDialog(context, notifier),
                        ),
                        const SizedBox(width: 6),
                        IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFFEF4444),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          icon: const Icon(Icons.close_rounded, color: Colors.white, size: 20),
                          onPressed: () {
                            notifier.cancelEdition();
                            ref.read(editModeProvider.notifier).state = false;
                          },
                        ),
                        const SizedBox(width: 4),
                        IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          icon: const Icon(Icons.check_rounded, color: Colors.white, size: 20),
                          onPressed: () {
                            notifier.validateEdition();
                            ref.read(editModeProvider.notifier).state = false;
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (isMoreActionActivated) ...[
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      ref.read(moreActionProvider.notifier).state = !isMoreActionActivated;
                    },
                    child: const SizedBox.expand(),
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 20,
                  width: 240,
                  child: Material(
                    elevation: 12,
                    shadowColor: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SidebarItem(
                            icon: Icons.settings_outlined,
                            label: 'Gestion',
                            action: () {
                              ref.read(moreActionProvider.notifier).state = !isMoreActionActivated;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SettingPos(),
                                ),
                              );
                            },
                          ),

                          const Divider(
                            height: 1,
                            color: Color(0xFFF1F5F9),
                          ),

                          SidebarItem(
                            icon: Icons.history_rounded,
                            label: 'Historique des Ventes',
                            action: () {
                              
                            },
                          ),

                          SidebarItem(
                            icon: Icons.point_of_sale_outlined,
                            label: 'Ventes en cours',
                            action: () {
                              
                            },
                          ),

                          SidebarItem(
                            icon: Icons.logout_rounded,
                            label: 'Se déconnecter',
                            action: () {
                              
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              // 4. Bouton flottant d'ajout de table (Bas de page en mode édition)
              if (isEditMode && !groupState.tableChange)
                Positioned(
                  bottom: 24,
                  right: 24,
                  child: FloatingActionButton.extended(
                    backgroundColor: const Color(0xFF0F172A),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    onPressed: () => notifier.startTableChange(),
                    icon: const Icon(Icons.add_rounded, color: Colors.white),
                    label: const Text(
                      "Ajouter une table",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: 20,
                bottom: 20,
                child: const _PlanLegend(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddGroupDialog(BuildContext context, PlanGroupNotifier notifier) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text("Ajouter un Étage / Zone", style: TextStyle(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Nom (ex: Terrasse, 1er Étage)",
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler", style: TextStyle(color: Color(0xFF64748B))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              notifier.addPlan(controller.text.trim());
              Navigator.pop(context);
            },
            child: const Text("Créer", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showEditGroupDialog(BuildContext context, PlanGroupNotifier notifier, Plan group) {
    final controller = TextEditingController(text: group.name);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text("Changer le nom ?", style: TextStyle(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              notifier.removePlan(group.id);
              Navigator.pop(context);
            },
            child: const Text("Supprimer", style: TextStyle(color: Color(0xFFEF4444))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              notifier.renamePlan(group.id, controller.text);
              Navigator.pop(context);
            },
            child: const Text("Changer", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

}

class _PlanLegend extends StatelessWidget {
  const _PlanLegend();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .95),//.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),//.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LegendItem(
            color: Color(0xFF22C55E),
            label: 'Disponible',
          ),

          SizedBox(width: 18),

          _LegendItem(
            color: Color(0xFFF59E0B),
            label: 'Occupée',
          ),

          SizedBox(width: 18),

          _LegendItem(
            color: Color(0xFF3B82F6),
            label: 'Réservée',
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 6),

        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}