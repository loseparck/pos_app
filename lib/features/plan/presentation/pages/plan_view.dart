import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/widgets/overlay_side_bar.dart';
import 'package:pos_app/core/widgets/plan_sidebar_item.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/presentation/pages/pos_page.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';
import 'package:pos_app/features/plan/application/plan_notifier.dart';
import 'package:pos_app/features/plan/presentation/widgets/delivery_order_card.dart';
import 'package:pos_app/features/plan/presentation/widgets/draggable_table.dart';
import 'package:pos_app/features/plan/presentation/widgets/grid_painter.dart';
import 'package:pos_app/features/plan/presentation/widgets/plan_form_dialog.dart';
import 'package:pos_app/features/plan/presentation/widgets/table_editor_panel.dart';
import 'package:pos_app/features/settings/presentation/pages/setting_pos.dart';

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
  final ScrollController _plansScrollController = ScrollController();

  bool _canScrollPlansLeft = false;
  bool _canScrollPlansRight = false;

  @override
  void initState() {
    super.initState();
    _plansScrollController.addListener(_updatePlansScrollArrows);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final state = ref.read(planProvider);
      if (state.selectedPlanId == null && state.plans.isNotEmpty) {
        ref.read(planProvider.notifier).selectPlan(state.plans.first.id);
      }
      FocusScope.of(context).requestFocus(_focusNode);

      _updatePlansScrollArrows();
    });
    
  }

  void _updatePlansScrollArrows() {
    if (!_plansScrollController.hasClients) return;

    final position = _plansScrollController.position;

    setState(() {
      _canScrollPlansLeft = position.pixels > 2;
      _canScrollPlansRight =
          position.pixels < position.maxScrollExtent - 2;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _plansScrollController.dispose();
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
    final ordersState = ref.watch(ordersProvider);
    final deliveryOrders = selectedGroup == null ? <Order>[] : ordersState.getOrderByGroup(selectedGroup.id);

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
                        : selectedGroup.isDelivery ? 
                          deliveryOrders.isEmpty ? 
                          const Center( child: Text( "Aucune commande en cours", style: TextStyle( color: Color(0xFF64748B), fontSize: 16, ), ), ) 
                          : GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 6,
                              childAspectRatio: 3.4,
                            ),
                              padding: const EdgeInsets.fromLTRB( 20, 100, 20, 100, ),
                              itemCount: deliveryOrders.length,
                              itemBuilder: (context, index) {
                                final order = deliveryOrders[index]; 
                                return DeliveryOrderCard(
                                  order: order,
                                  onTap: (){
                                    
                                    ref.read(ordersProvider.notifier).setTableAndGroupId(
                                      groupId: selectedGroup.id,
                                      orderId: order.id);
                                    ref.read(ordersProvider).copyWith(
                                      selectedOrderId: order.id
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => PosPage( isTable: false)));
                                  } ,); 
                              },
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
                              ],
                            ),
                          ),
                  ),
                ],
              ),

              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ============================================================
                    // 1. BARRE DES ÉTAGES
                    // ============================================================
                    if(groupState.plans.isNotEmpty)...[
                      Expanded(
                        child: Container(
                          height: 62,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .9),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: const Color(0xFFE2E8F0),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .03),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // ======================================================
                              // LISTE DES ÉTAGES
                              // ======================================================
                              SingleChildScrollView(
                                controller: _plansScrollController,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.only(
                                  left: _canScrollPlansLeft ? 34 : 0,
                                  right: _canScrollPlansRight ? 34 : 0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: groupState.plans.map((group) {
                                    final isSelected =
                                        group.id == groupState.selectedPlanId;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(16),
                                          onTap: () => notifier.selectPlan(group.id),
                                          onLongPress: isEditMode
                                              ? () => _updatePlan(
                                                    notifier,
                                                    group,
                                                  )
                                              : null,
                                          child: AnimatedContainer(
                                            duration:
                                                const Duration(milliseconds: 250),
                                            curve: Curves.easeInOut,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? const Color(0xFF0F172A)
                                                      .withValues(alpha: 0.3)
                                                  : group.color != null
                                                      ? Color(group.color!)
                                                      : Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: isSelected
                                                  ? Border.all(
                                                      color: Colors.black,
                                                      width: 3,
                                                    )
                                                  : null,
                                              boxShadow: isSelected
                                                  ? [
                                                      BoxShadow(
                                                        color:
                                                            const Color(0xFF0F172A)
                                                                .withValues(
                                                                    alpha: .3),
                                                        blurRadius: 12,
                                                        offset: const Offset(0, 4),
                                                      ),
                                                    ]
                                                  : [],
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (group.isDelivery) ...[
                                                  Icon(
                                                    Icons.delivery_dining,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                  const SizedBox(width: 8),
                                                ],

                                                Text(
                                                  group.name,
                                                  style: TextStyle(
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                              // ======================================================
                              // FLÈCHE GAUCHE
                              // ======================================================
                              if (_canScrollPlansLeft)
                                Positioned(
                                  left: 2,
                                  top: 5,
                                  bottom: 5,
                                  child: _PlanScrollButton(
                                    icon: Icons.chevron_left_rounded,
                                    onTap: () {
                                      _plansScrollController.animateTo(
                                        (_plansScrollController.offset - 180)
                                            .clamp(
                                              0.0,
                                              _plansScrollController
                                                  .position.maxScrollExtent,
                                            ),
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.easeOut,
                                      );
                                    },
                                  ),
                                ),

                              // ======================================================
                              // FLÈCHE DROITE
                              // ======================================================
                              if (_canScrollPlansRight)
                                Positioned(
                                  right: 2,
                                  top: 5,
                                  bottom: 5,
                                  child: _PlanScrollButton(
                                    icon: Icons.chevron_right_rounded,
                                    onTap: () {
                                      _plansScrollController.animateTo(
                                        (_plansScrollController.offset + 180)
                                            .clamp(
                                              0.0,
                                              _plansScrollController
                                                  .position.maxScrollExtent,
                                            ),
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.easeOut,
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),
                    ] else ...[
                      Spacer()
                    ],

                    // ============================================================
                    // 2. BOUTONS D'ACTIONS
                    // ============================================================
                    if (!groupState.tableChange)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .03),
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

                                  ref
                                      .read(editModeProvider.notifier)
                                      .state = true;
                                },
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  size: 20,
                                  color: Color(0xFF0F172A),
                                ),
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFFF1F5F9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 4),

                              IconButton(
                                onPressed: () {
                                  ref
                                          .read(
                                              moreActionProvider.notifier)
                                          .state =
                                      !isMoreActionActivated;
                                },
                                icon: const Icon(
                                  Icons.more_horiz_rounded,
                                  size: 20,
                                  color: Color(0xFF0F172A),
                                ),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                            ] else ...[
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFF10B981),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.add_rounded,
                                  size: 18,
                                ),
                                label: const Text(
                                  "Étage",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () => _addPlan(notifier),
                              ),

                              const SizedBox(width: 6),

                              IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFFEF4444),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  notifier.cancelEdition();

                                  ref
                                      .read(editModeProvider.notifier)
                                      .state = false;
                                },
                              ),

                              const SizedBox(width: 4),

                              IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFF10B981),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  notifier.validateEdition();

                                  ref
                                      .read(editModeProvider.notifier)
                                      .state = false;
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              // 1. Barre de navigation des étages (Style capsule moderne)
              /*Positioned(
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
                                color: isSelected ? const  Color(0xFF0F172A).withValues(alpha: 0.3) : group.color != null ? Color(group.color!) : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(16),
                                border: isSelected ? BoxBorder.all(color: Colors.black, width: 3) : null,
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
                                  if(group.isDelivery)...[
                                    Icon(Icons.delivery_dining),
                                    const SizedBox(width: 8),
                                  ],
                                  Text(
                                    group.name,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
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
                      if(!groupState.tableChange)
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
                          onPressed: () => _addPlan(notifier),//_showAddGroupDialog(context, notifier),
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
              */
              if (isEditMode && groupState.tableChange) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                )                
              ],
              if (isMoreActionActivated) ...[
                OverlaySideBar(
                  onClosePressed: () => ref.read(moreActionProvider.notifier).state = false,
                  gestureOnTap: () => ref.read(moreActionProvider.notifier).state = false,
                  item: Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(14),
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(
                            8,
                            6,
                            8,
                            10,
                          ),
                          child: Text(
                            'GESTION',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ),

                        PlanSidebarItem(
                          icon: Icons.settings_outlined,
                          label: 'Gestion',
                          subtitle: 'Produits, clients, fournisseurs...',
                          onTap: () {
                            ref
                                .read(moreActionProvider.notifier)
                                .state = false;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SettingPos(),
                              ),
                            );
                          },
                        ),

                        PlanSidebarItem(
                          icon: Icons.history_rounded,
                          label: 'Historique des ventes',
                          subtitle: 'Consulter les ventes passées',
                          onTap: () {
                            ref
                                .read(moreActionProvider.notifier)
                                .state = false;
                          },
                        ),

                        PlanSidebarItem(
                          icon: Icons.point_of_sale_outlined,
                          label: 'Ventes en cours',
                          subtitle: 'Commandes actuellement ouvertes',
                          onTap: () {
                            ref
                                .read(moreActionProvider.notifier)
                                .state = false;
                          },
                        ),

                        const SizedBox(height: 20),

                        const Padding(
                          padding: EdgeInsets.fromLTRB(
                            8,
                            0,
                            8,
                            10,
                          ),
                          child: Text(
                            'COMPTE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ),

                        PlanSidebarItem(
                          icon: Icons.logout_rounded,
                          label: 'Se déconnecter',
                          subtitle: 'Quitter la session actuelle',
                          iconColor: const Color(0xFFDC2626),
                          textColor: const Color(0xFFDC2626),
                          onTap: () {
                            ref
                                .read(moreActionProvider.notifier)
                                .state = false;
                          },
                        ),
                      ],
                    ),
                  )
                )
              ],
              // 4. Bouton flottant d'ajout de table (Bas de page en mode édition)
              if (isEditMode && !groupState.tableChange && groupState.selectedPlan != null && !groupState.selectedPlan!.isDelivery)
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
              if (!isEditMode) ...[
                if(selectedGroup != null && selectedGroup.isDelivery) ...[
                  Positioned(
                    bottom: 24,
                    right: 24,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        ref
                            .read(ordersProvider.notifier)
                            .setTableAndGroupId(
                              groupId: selectedGroup.id,
                            );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PosPage(
                              isTable: false,
                            ),
                          ),
                        );
                      },
                      backgroundColor: const Color(0xFF059669),
                      foregroundColor: Colors.white,
                      elevation: 5,
                      extendedPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      icon: const Icon(
                        Icons.restaurant_menu_rounded,
                        size: 21,
                      ),
                      label: const Text(
                        'Prendre une commande',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: const _PlanLegend(),
                  ),
                ]
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _addPlan(PlanGroupNotifier notifier) async {
    final plan = await PlanFormDialog.show(
      context,
    );

    if (plan != null) {
      notifier.addPlan(plan);
    }
  }

  void _updatePlan(PlanGroupNotifier notifier, Plan group) async {
    final plan = await PlanFormDialog.show(
      context,
      initialData: group
    );

    if (plan != null) {
      notifier.addPlan(plan);
    }
  }

  /*void _showEditGroupDialog(BuildContext context, PlanGroupNotifier notifier, Plan group) {
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
*/
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
        color: Colors.white.withValues(alpha: .95),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
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

class _PlanScrollButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _PlanScrollButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 34,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .96),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 22,
            color: const Color(0xFF334155),
          ),
        ),
      ),
    );
  }
}