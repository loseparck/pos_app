import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';
import 'package:pos_app/features/catalog/domain/entities/option.dart';

class OptionDialog extends ConsumerStatefulWidget {
  const OptionDialog({super.key, this.optionId});
  final String? optionId;

  @override
  ConsumerState<OptionDialog> createState() => _OptionDialogState();
}

class _OptionDialogState extends ConsumerState<OptionDialog> {
  final _formKey = GlobalKey<FormState>();
  
  Option option = Option(name: '', items: [], minToSelect: 0, maxToSelect: 1);

  late final TextEditingController nameController;
  late final TextEditingController minController;
  late final TextEditingController maxController;

  bool isMandatory = false;
  bool multipleSelect = false;
  bool isActive = true;

  List<Item> options = [];
  
  @override
  void initState() {
    super.initState();
    if(widget.optionId == null){
      nameController = TextEditingController();
      minController = TextEditingController(text: "0");
      maxController = TextEditingController(text: "1");
    } else {
      option = ref.read(productsProvider.notifier).getOption(widget.optionId ?? '');
      nameController = TextEditingController(text: option.name);
      minController = TextEditingController(text: '${option.minToSelect}');
      maxController = TextEditingController(text: '${option.maxToSelect}');
      isMandatory = option.isMandatory;
      multipleSelect = option.multipleSelect;
      isActive = option.isActive;
    }
  }

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
  void _openOptionDialog({Item? item, int? index}) {
    final nameCtrl = TextEditingController(text: item?.name ?? "");
    final priceCtrl =
        TextEditingController(text: item?.price.toString() ?? "0");
    final vatCtrl =
        TextEditingController(text: item?.vat.toString() ?? "0");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(item == null ? "Ajouter une option" : "Modifier"),
        content: SingleChildScrollView(
          child: Column(
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
            const SizedBox(height: 10),
            TextField(
              controller: vatCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "TVA (€)"),
            ),
          ],
        )
        ),
        
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.trim().isEmpty) return;

              final newItem = Item(
                name: nameCtrl.text.trim(),
                price: double.tryParse(priceCtrl.text) ?? 0,
                option: option,
                vat: double.tryParse(vatCtrl.text) ?? 0,
                isActive: true,
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
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    final min = int.tryParse(minController.text) ?? 0;
    final max = int.tryParse(maxController.text) ?? 0;

    if (min > max) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Min doit être ≤ Max")),
      );
      return;
    }

    if (isMandatory && min <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Min doit être > 0")),
      );
      return;
    }

    final data = Option(
      name: nameController.text,
      isMandatory: isMandatory,
      minToSelect: min,
      maxToSelect: max,
      multipleSelect: multipleSelect,
      items: options,
    );

    final bool isOk;
    if(widget.optionId == null){
      isOk = await ref.read(productsProvider.notifier).addOption(data);
    } else{
      ref.read(productsProvider.notifier).updateOption(data.copyWith(id: widget.optionId));
      isOk = true;
    }
    
    
    if(!isOk){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erreur lors de l'ajout du groupe d'options")),
      );
      return;
    }

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
                            validator: (val) =>
                              isMandatory && int.parse(val ?? '0') <= 0 ? "Minimum doit etre > 1" : null,
                          ),
                        const SizedBox(height: 10),
                            TextFormField(
                            controller: maxController,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(labelText: "Nombre maximum d'options qu'on peut choisir ?"),
                            validator: (val) {
                              int max = int.tryParse(val ?? '0') ?? 0;
                              int min = int.tryParse(minController.text) ?? 0;

                              return max <= 0 ? "Maximum doit etre > 0" : (isMandatory && max < min) ? "Maximum doit etre > minimum" : null;
                              }
                          ),

                        const SizedBox(height: 10),

                        SwitchListTile(
                          title: const Text("Une Option peut etre selectionner plusieurs fois ?"),
                          value: multipleSelect,
                          onChanged: (val) =>
                              setState(() => multipleSelect = val),
                        ),
                        SwitchListTile(
                          title: const Text("Cette Option est Active ?"),
                          value: isActive,
                          onChanged: (val) =>
                              setState(() => isActive = val),
                        ),
                      ],
                    ),
                  ),
                ),
                if(widget.optionId == null)
                const VerticalDivider(width: 30),

                // =========================
                // 📋 COLONNE DROITE (OPTIONS)
                // =========================
                if(widget.optionId == null)
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
      actions: [
        ElevatedButton(
          onPressed: _submit,
          child: const Text("Valider"),
        )
      ],
    );
  }
}

