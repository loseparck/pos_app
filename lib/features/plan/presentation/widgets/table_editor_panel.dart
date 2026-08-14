import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';

class TableEditorPanel extends ConsumerStatefulWidget {
  const TableEditorPanel({super.key});

  @override
  ConsumerState<TableEditorPanel> createState() => _TableEditorPanelState();
}

class _TableEditorPanelState extends ConsumerState<TableEditorPanel>{
  int? selectedColor;
  final _nameFormKey = GlobalKey<FormState>();
  TextEditingController? nameController;
  
  Widget _buildColorPalette() {
    final notifier = ref.read(planProvider.notifier);
    final colors = [
      0xFF81C784,
      0xFFFFD54F,
      0xFFBA68C8,
      0xFF4DB6AC,
      0xFFA1887F,
      0xFF90A4AE,
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: colors.map((colorValue) {
        final selected = selectedColor == colorValue;

        return InkWell(
          onTap: () {
            notifier.changeTableColor('$colorValue');
            setState(() {
              selectedColor = colorValue;
            });
            
          },
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Color(colorValue),
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? Colors.blue : Colors.grey.shade400,
                width: selected ? 4 : 1,
              ),
            ),
            child: selected
                ? const Icon(Icons.check, color: Colors.black)
                : null,
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    nameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupState = ref.watch(planProvider);
    final notifier = ref.read(planProvider.notifier);
    final table = groupState.selectedTable;
    
    if (table == null) {
      return const Center(child: Text("Aucune table sélectionnée"));
    }
    
    nameController ??= TextEditingController(text: table.name);
return Container(
  color: Colors.grey.shade100,
  padding: const EdgeInsets.all(12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
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