import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/core/widgets/counter_field.dart';
import 'package:pos_app/core/widgets/overlay_side_bar.dart';
import 'package:pos_app/core/widgets/rotation_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/color_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_dialog_widgets.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/presentation/widgets/table_shape_selector.dart';

class TableEditorPanel extends ConsumerStatefulWidget {
  const TableEditorPanel({super.key});

  @override
  ConsumerState<TableEditorPanel> createState() => _TableEditorPanelState();
}

class _TableEditorPanelState extends ConsumerState<TableEditorPanel>{
  Color? selectedColor;
  final _nameFormKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final groupState = ref.read(planProvider);
    final data = groupState.selectedTable;
    _nameController = TextEditingController(
      text: data?.name ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupState = ref.watch(planProvider);
    final notifier = ref.read(planProvider.notifier);
    final table = groupState.selectedTable;

    if (table == null) {
      return const Center(child: Text("Aucune table sélectionnée"));
    }

    _nameController.text = table.name;
    
    return OverlaySideBar(
      onClosePressed: () => ref.read(planProvider.notifier).cancelEditTable(),
      gestureOnTap: () => ref.read(planProvider.notifier).cancelEditTable(),
      headerTitle: "Configuration Table",
      headerSubTitle: "Paramettrez cette table",
      headerIcon: Icons.table_restaurant_rounded,
      showFooter: false,
      item: Expanded(
        child: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _nameFormKey,
                      child: 
                        CustomTextField(
                          controller: _nameController,
                          label: 'Nom / Numéro *',
                          hint: 'table 1, table Bar',
                          required: true,
                          icon: Icons.label_outlined,
                          onChanged: (value) {
                            notifier.changeTableName(value);
                          },
                        
                      ),
                    ),

                    const SizedBox(height: 8),

                    SettingsCard(
                      //isError: errorWidget == "minSelection" || errorWidget == "minmax",
                      title: 'Places',
                      subtitle:
                          'Nombre de places sur cette table',
                      icon: Icons.chair_alt,
                      accentColor: optionPurple,
                      trailing: CounterField(
                        value: table.seats,
                        min: 1,
                        max: 50,
                        onChanged:(value) { notifier.updateSeatPlaces(value);},
                      ),
                    ),
                        
                    const SizedBox(height: 8),

                    TableShapeSelector(
                      selectedShape: table.shape,
                      onChanged: (shape) {
                        notifier.toggleShape(shape);
                      },
                    ),

                    const SizedBox(height: 8),

                    SettingsCard(
                      //isError: errorWidget == "minSelection" || errorWidget == "minmax",
                      title: 'Largeur',
                      subtitle:
                          'Définissez une largeur pour cette table',
                      icon: Icons.width_wide,
                      accentColor: optionPurple,
                      trailing: CounterField(
                        value: table.width,
                        min: 50,
                        max: 500,
                        onChanged:(value) { notifier.scaleHorizentally(value);},
                        stepValue: 10,
                      ),
                    ),

                    const SizedBox(height: 8),

                    SettingsCard(
                      //isError: errorWidget == "minSelection" || errorWidget == "minmax",
                      title: 'Hauteur',
                      subtitle:
                          'Définissez une hauteur pour cette table',
                      icon: Icons.height,
                      accentColor: optionPurple,
                      trailing: CounterField(
                        value: table.height,
                        min: 50,
                        max: 500,
                        onChanged:(value) { notifier.scaleVertically(value);},
                        stepValue: 10,
                      ),
                    ),

                    const SizedBox(height: 8),

                    SettingsCard(
                      //isError: errorWidget == "minSelection" || errorWidget == "minmax",
                      title: 'Rotation',
                      subtitle:
                          "Définissez l'orientation de cette table",
                      icon: Icons.autorenew,
                      accentColor: optionPurple,
                      trailing: RotationField(
                        value: table.rotation,
                        min: -10,
                        max: 50,
                        onChanged:(value) { notifier.rotateTable(value);},

                      ),
                    ),

                    const SizedBox(height: 8),

                    ColorWidget(
                      title: "Couleur de l'option",
                      onpressed:   (newColor) => notifier.changeTableColor(newColor?.toARGB32().toString()),
                      selectedColor: table.color != null ? Color(int.parse(table.color!)) : null,
                      colorCount: 11,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () {
                      notifier.removeTable();
                    },
                    child: const Text(
                      "Supprimer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () {
                      notifier.cancelEditTable();
                    },
                    child: const Text(
                      "Annuler",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () {
                      if (_nameFormKey.currentState?.validate() ?? false) {
                        notifier.validateTable();
                      }
                    },
                    child: const Text(
                      "Valider",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ));
    /*return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Text(
            "Configuration Table",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _nameFormKey,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nom / Numéro *',
                      ),
                      onChanged: (value) {
                        notifier.changeTableName(value);
                      },
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
                          notifier.scaleVertically(10);
                        },
                      ),
                    ],
                  ),

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

                  const SizedBox(height: 20),

                  /// COULEURS
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildColorPalette(),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// ACTIONS
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    notifier.removeTable();
                  },
                  child: const Text(
                    "Supprimer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    notifier.cancelEditTable();
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    if (_nameFormKey.currentState?.validate() ?? false) {
                      notifier.validateTable();
                    }
                  },
                  child: const Text(
                    "Valider",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    */
    /*return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text("Configuration Table",
              style: TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),

          Form(
            key: _nameFormKey,
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nom / Numéro *'),
              onChanged: (value){
                notifier.changeTableName(value);
              },
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

          _buildColorPalette(),

          const Spacer(),

          /// DELETE
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                notifier.removeTable();
              },
              child:  Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => notifier.removeTable(),//notifier.addTable("Table", 4),
                    child: Text(
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          "Supprimer"
                          ),
                    
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () => notifier.cancelEditTable(),//notifier.addTable("Table", 4),
                    child: Text(
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          "Annuler"
                          ),
                    
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.green.shade300,
                    ),
                    onPressed: () {
                      if(_nameFormKey.currentState?.validate() ?? false){
                         notifier.validateTable();
                      }
                    },
                    child: Text(
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          "Valider"
                          ),
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  */
  }
}