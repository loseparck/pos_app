import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/item.dart';

class OptionItemDialog extends StatefulWidget {
  final Item option;
  final String groupeId;
  //final void Function(Map<String, List<OptionItem>>) onSelected;

  const OptionItemDialog({
    super.key,
    required this.option,
    required this.groupeId,
  });

  @override
  State<OptionItemDialog> createState() =>
      _OptionItemDialogState();
}

class _OptionItemDialogState
    extends State<OptionItemDialog> {

  
  @override
  Widget build(BuildContext context) {
    final nameCotnroller = TextEditingController(text: widget.option.name);
    final priceCotnroller = TextEditingController(text: "${widget.option.price}");
    final vatCotnroller = TextEditingController(text: "${widget.option.vat}");

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Modifier une Option"),
          IconButton(
            style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),

      content: SingleChildScrollView(
        child:  
      Column(
        children: [
          _buildTextRow("Nom :", nameCotnroller),
          _buildTextRow("Prix :", priceCotnroller),
          _buildTextRow("TVA :", vatCotnroller),
        ],
      )),
      
      
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

  /*bool _canValidate() {
    return true;
  }*/
}