import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';

class PaymentDialog extends ConsumerStatefulWidget {
  const PaymentDialog({super.key});

  @override
  ConsumerState<PaymentDialog> createState() =>
      _PaymentDialogState();
}

class _PaymentDialogState
    extends ConsumerState<PaymentDialog> {

  String paymentMethod = "Cash";
  String paymentType = "Single";

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text("Paiement"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// MODE
          DropdownButton<String>(
            value: paymentMethod,
            items: const [
              DropdownMenuItem(
                  value: "Cash",
                  child: Text("Espèces")),
              DropdownMenuItem(
                  value: "Card",
                  child: Text("Carte")),
              DropdownMenuItem(
                  value: "Mixed",
                  child: Text("Mixte")),
            ],
            onChanged: (v) {
              setState(() {
                paymentMethod = v!;
              });
            },
          ),

          /// TYPE
          DropdownButton<String>(
            value: paymentType,
            items: const [
              DropdownMenuItem(
                  value: "Single",
                  child: Text("Une personne")),
              DropdownMenuItem(
                  value: "Split",
                  child: Text("Partager")),
            ],
            onChanged: (v) {
              setState(() {
                paymentType = v!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            ref
                .read(ordersProvider.notifier)
                .payOrder();
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text("Valider"),
        ),
      ],
    );
  }
}