import 'package:flutter/material.dart';

Widget buildReductionRow() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[200]!)),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Aucune réduction", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
      ],
    ),
  );
}

Widget buildInfoCard(String title, String value, {Color? textColor, bool isHighlight = false}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(8), 
        border: Border.all(color: isHighlight ? Colors.black12 : Colors.grey[100]!)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[400], fontSize: 10)),
          const SizedBox(height: 2),
          Text(value, style: TextStyle(fontWeight: isHighlight ? FontWeight.bold : FontWeight.w600, fontSize: 13, color: textColor ?? Colors.black)),
        ],
      ),
    ),
  );
}

Widget buildStepperButton(IconData icon, VoidCallback onTap) {
  return IconButton(
    icon: Icon(icon, size: 14),
    onPressed: onTap,
    style: IconButton.styleFrom(
      backgroundColor: Colors.white,
      side: BorderSide(color: Colors.grey[300]!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      padding: const EdgeInsets.all(6),
    ),
  );
}