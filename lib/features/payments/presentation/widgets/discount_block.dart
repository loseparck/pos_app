import 'package:flutter/material.dart';

class DiscountBlock extends StatefulWidget {
  const DiscountBlock({super.key});

  @override
  State<DiscountBlock> createState() => _DiscountBlockState();
}

class _DiscountBlockState extends State<DiscountBlock> {
  bool custom = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Réduction", style: TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 6),

        DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(value: "5%", child: Text("5%")),
            DropdownMenuItem(value: "10%", child: Text("10%")),
            DropdownMenuItem(value: "custom", child: Text("Custom")),
          ],
          onChanged: (value) {
            setState(() {
              custom = value == "custom";
            });
          },
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),

        if (custom) ...[
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Valeur",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: "%", child: Text("%")),
                    DropdownMenuItem(value: "€", child: Text("€")),
                  ],
                  onChanged: (_) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          )
        ]
      ],
    );
  }
}