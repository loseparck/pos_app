/*import 'package:flutter/material.dart';

class OptionDialog extends StatefulWidget {
  const OptionDialog({super.key});

  @override
  State<OptionDialog> createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
    final nameCotnroller = TextEditingController();
    final minCotnroller = TextEditingController(text: "0");
    final maxCotnroller = TextEditingController(text: "0");
    bool isMandatory = false;
    bool multipleSelect = false;

    @override
  void dispose() {
    nameCotnroller.dispose();
    minCotnroller.dispose();
    maxCotnroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Ajouter un Group d'options"),
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
        children: [
          _buildTextRow("Nom :", nameCotnroller),
          _buildCheckboxRow("Cette Option est Obligatoir ? ", isMandatory, (val) {
            setState(() => isMandatory = val ?? true);
          }),
          if(isMandatory)
            _buildTextRow("Nombre minimum d'options à choisir ?", minCotnroller),
          _buildTextRow("Nombre maximum d'options qu'on peut choisir ?", maxCotnroller),
          _buildCheckboxRow("Une Option peut etre selectionner plusieurs fois ? ", multipleSelect, (val) {
            setState(() => multipleSelect = val!);
          }),
        ],
      ),
      
      
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
          onPressed: () {
            //notifier.addGroup(controller.text.trim());
            Navigator.pop(context);
          }, 
          child: const Text("Valider"),
        ),
      ],
    );
  }

    Widget _buildCheckboxRow(String label, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
            flex: 3,
            child: SwitchListTile(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

// ===== Widget ligne texte =====
  Widget _buildTextRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/option_item.dart';

class OptionDialog extends StatefulWidget {
  const OptionDialog({super.key});

  @override
  State<OptionDialog> createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final minController = TextEditingController(text: "0");
  final maxController = TextEditingController(text: "1");

  bool isMandatory = false;
  bool multipleSelect = false;

  List<OptionItem> options = [];

  @override
  void dispose() {
    nameController.dispose();
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  // =======================
  // ➕ Ajouter / Modifier option
  // =======================
  void _openOptionDialog({OptionItem? item, int? index}) {
    final nameCtrl = TextEditingController(text: item?.name ?? "");
    final priceCtrl =
        TextEditingController(text: item?.price.toString() ?? "0");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(item == null ? "Ajouter une option" : "Modifier"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Prix (€)"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.trim().isEmpty) return;

              final newItem = OptionItem(
                name: nameCtrl.text.trim(),
                price: double.tryParse(priceCtrl.text) ?? 0, groupId: '',
                
              );

              setState(() {
                if (index != null) {
                  options[index] = newItem;
                } else {
                  options.add(newItem);
                }
              });

              Navigator.pop(context);
            },
            child: const Text("Valider"),
          ),
        ],
      ),
    );
  }

  // =======================
  // 🗑️ Supprimer
  // =======================
  void _deleteOption(int index) {
    setState(() => options.removeAt(index));
  }

  // =======================
  // 💾 Submit
  // =======================
  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final min = int.tryParse(minController.text) ?? 0;
    final max = int.tryParse(maxController.text) ?? 0;

    if (min > max) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Min doit être ≤ Max")),
      );
      return;
    }

    final data = {
      "name": nameController.text,
      "isMandatory": isMandatory,
      "min": min,
      "max": max,
      "multiple": multipleSelect,
      "options": options,
    };

    Navigator.pop(context, data);
  }

  // =======================
  // UI
  // =======================
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Expanded(
            child: Text("Groupe d'options"),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      content: //SizedBox(
       // width: 900,
         Form(
          key: _formKey,
          child:  SizedBox(
            width: 900, // plus large pour tablette
            height: 400,
            child: Row(
              children: [
                // =========================
                // 🧾 COLONNE GAUCHE (FORM)
                // =========================
                Expanded(
                  flex: 9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: "Nom du groupe",
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) =>
                              val == null || val.isEmpty ? "Champ requis" : null,
                        ),

                        const SizedBox(height: 15),

                        SwitchListTile(
                          title: const Text("Cette Option est Obligatoir ?"),
                          value: isMandatory,
                          onChanged: (val) =>
                              setState(() => isMandatory = val),
                        ),

                        if (isMandatory)
                          TextFormField(
                            controller: minController,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(labelText: "Nombre minimum d'options à choisir ?"),
                          ),
                              //),
                        const SizedBox(height: 10),
                            TextFormField(
                            controller: maxController,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(labelText: "Nombre maximum d'options qu'on peut choisir ?"),
                          ),

                        const SizedBox(height: 10),

                        SwitchListTile(
                          title: const Text("Une Option peut etre selectionner plusieurs fois ?"),
                          value: multipleSelect,
                          onChanged: (val) =>
                              setState(() => multipleSelect = val),
                        ),
                      ],
                    ),
                  ),
                ),

                const VerticalDivider(width: 30),

                // =========================
                // 📋 COLONNE DROITE (OPTIONS)
                // =========================
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      // ➕ Bouton en haut à droite
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _openOptionDialog(),
                            icon: const Icon(Icons.add),
                            label: const Text("Ajouter"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // 📋 Liste
                      Expanded(
                        child: options.isEmpty
                            ? const Center(child: Text("Aucune option"))
                            : ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (_, i) {
                                  final item = options[i];

                                  return Card(
                                    child: ListTile(
                                      title: Text(item.name),
                                      subtitle: Text(
                                          "${item.price.toStringAsFixed(2)} €"),
                                      onTap: () =>
                                          _openOptionDialog(item: item, index: i),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () => _deleteOption(i),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      //),
      actions: [
        ElevatedButton(
          onPressed: _submit,
          child: const Text("Valider"),
        )
      ],
    );
  }
}

