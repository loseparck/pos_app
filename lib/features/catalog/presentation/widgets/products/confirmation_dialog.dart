import 'package:flutter/material.dart';
import 'package:pos_app/features/catalog/domain/entities/dialog_action.dart';

class ConfirmationDialog extends StatelessWidget{

  const ConfirmationDialog({super.key, required this.actions, this.body, this.title = "Confirmation",});

  //final Future<void> Function() onConfirm;
  final String title;
  final String? body;

  final List<DialogAction> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              IconButton(
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: body != null ? Text(body!) : null,
          actions: actions.map((action) {
            final onPressed = action.onPressed == null
                ? null
                : () async {
                    await action.onPressed!();
                  };

            if (action.isOutlined) {
              return OutlinedButton(
                onPressed: onPressed,
                style: action.style,
                child: Text(action.label, style: action.textStyle),
              );
            }
            
            return ElevatedButton(
              onPressed: onPressed,
              style: action.style,
              child: Text(action.label, style: action.textStyle),
            );
          }).toList(),
          
         /* [
            TextButton(
              onPressed: () async {
                await onConfirm();
                if (!context.mounted) return;
                Navigator.of(context).pop();
              }, 
              child: const Text(
                "Supprimer",
                style: TextStyle(color: Colors.red)
                ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: const Text("Annuler"),
            ),
          ],*/
        );
  }
 
}