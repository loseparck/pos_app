import 'package:flutter/material.dart';

class RightKeypadPanel extends StatelessWidget {
  final double amountToPay;
  final Function(String) onKeyPress;
  final Function(double) onQuickAmountPress;

  const RightKeypadPanel({
    Key? key,
    required this.amountToPay,
    required this.onKeyPress,
    required this.onQuickAmountPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.7,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...'123456789.0⌫'.split('').map((char) => _buildKeypadButton(char)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildQuickCashButton(20),
            const SizedBox(width: 8),
            _buildQuickCashButton(50),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _buildQuickCashButton(100),
             const SizedBox(width: 8),
            _buildQuickCashButton(200),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => onQuickAmountPress(-1),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(color: const Color(0xFFEDF7ED), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.green[300]!)),
                  child: Center(child: Text("Clean", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900], fontSize: 13))),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InkWell(
                onTap: () => onQuickAmountPress(amountToPay),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(color: const Color(0xFFEDF7ED), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.green[300]!)),
                  child: Center(child: Text("Exact (${amountToPay.toStringAsFixed(2)} DH)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900], fontSize: 13))),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildKeypadButton(String label) {
    return Material(
      color: const Color(0xFFF9F9F9),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => onKeyPress(label),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }

  Widget _buildQuickCashButton(double val) {
    return Expanded(
      child: InkWell(
        onTap: () => onQuickAmountPress(val),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[300]!)),
          child: Center(child: Text("${val.toStringAsFixed(0)} DH", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700], fontSize: 13))),
        ),
      ),
    );
  }
}