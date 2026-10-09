import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/color_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/custom_text_field.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/toggle_widget.dart';
import 'package:pos_app/features/catalog/presentation/widgets/options/option_dialog_widgets.dart';
import 'package:pos_app/features/plan/domain/entities/plan.dart';

class PlanFormDialog extends StatefulWidget {
  final Plan? initialData;

  const PlanFormDialog({
    super.key,
    this.initialData,
  });

  static Future<Plan?> show(
    BuildContext context, 
    {
    Plan? initialData,
  }) {
    return showDialog<Plan>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PlanFormDialog(
        initialData: initialData,
      ),
    );
  }

  @override
  State<PlanFormDialog> createState() =>
      _PlanFormDialogState();
}

class _PlanFormDialogState
    extends State<PlanFormDialog> {

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late bool _active;
  late bool _isDelivery;
  late Color? _selectedColor;
   String? errorMessage;
  String? errorWidget;
   
  @override
  void initState() {
    super.initState();

    final data = widget.initialData;

    _nameController = TextEditingController(
      text: data?.name ?? '',
    );

    _active = data?.isActive ?? true;
    _isDelivery = data?.isDelivery ?? false;

    _selectedColor =
        data?.color != null ? Color(data!.color!) : null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    if(!_formKey.currentState!.validate()){
      return;
    }

    errorMessage = null;
    
    final name = _nameController.text.trim();

    try{
      final result = Plan(
        id: widget.initialData?.id ?? '',
        name: name,
        color: _selectedColor?.toARGB32(),
        active: _active,
        delivery: _isDelivery,
      );

      Navigator.of(context).pop(result);
    }on ArgumentError catch(e){
      setState(() {
        errorMessage = e.message;
        errorWidget = e.name;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialData != null;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 24,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1120,
          maxHeight: 860,
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  30,
                  25,
                  24,
                  18,
                ),
                child: OptionDialogHeader(
                  icon: Icons.category_outlined,
                  title: isEdit
                      ? "Modifier le plan"
                      : 'Nouveau plan',
                  subtitle:
                      'Ajouter votre plan (Etage, terasse...)',
                  color: optionPurple,
                  onClose: () =>
                      Navigator.of(context).pop(),
                ),
              ),
              const Divider(
                height: 1,
                color: optionBorder,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28),
                  child:  Form(
                    key: _formKey,
                    child: _buildView(),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: optionBorder,
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: DialogFooter(
                  onCancel: () =>
                      Navigator.of(context).pop(),
                  onSubmit: _submit,
                  submitText: isEdit
                      ? 'Enregistrer'
                      : "Créer le plan",
                  submitColor: optionPurple,
                  errorText: errorMessage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceInventoryTab() {
    return Column(
        children: [
          SectionWidget(
            title: 'Informations générales',
            icon: Icons.info_outline,
            child: Column(
              children: [
                CustomTextField(
                  controller: _nameController,
                  label: 'Nom du plan',
                  hint: 'Salle principale, 1er Etage, Terasse...',
                  required: true,
                  icon: Icons.shopping_bag_outlined,
                ),

                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SectionWidget(
            title: "Paramètres du plan",
            icon: Icons.inventory_2_outlined,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ToggleWidget(
                        title: 'Actif',
                        subtitle:
                          'Affichable Lors de la prise de commande',
                        value: _active,
                        onChanged: (value) {
                          setState(() {
                            _active = value;
                          });
                        },
                      )
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ToggleWidget(
                        title: 'Pour Livraison',
                        subtitle:
                          'Ce plan est Dédié à La livraison',
                        value: _isDelivery,
                        onChanged: (value) {
                          setState(() {
                            _isDelivery = value;
                          });
                        },
                      )
                    ),
                  ]
                ),
              ],
            ),
          ),
        ],
      );
  }

  Widget _buildView(){
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 15
      ),
      child: Column(
        children: [
          _buildPriceInventoryTab(),
          ColorWidget(
            title: "Couleur d'affichage du Plan",
            onpressed:   (newColor) => setState(() => _selectedColor = newColor),
            selectedColor: _selectedColor,
          ),
        ],
      ),
    );
  }
}