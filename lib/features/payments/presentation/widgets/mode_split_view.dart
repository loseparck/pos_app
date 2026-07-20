import 'package:flutter/material.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository_provider.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';
import 'package:pos_app/features/payments/presentation/widgets/discount_selector_widget.dart';
import 'shared_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ModeSplitView extends ConsumerStatefulWidget {
  
  const ModeSplitView({
    super.key,
    required this.remainderToPay,
    required this.changeAmountToPay,
    required this.showDiscount,
  });

  final double remainderToPay;
  final Function() changeAmountToPay;
  final Function() showDiscount;

  @override
  ConsumerState<ModeSplitView> createState() => _ModeSplitViewState();
}

class _ModeSplitViewState extends ConsumerState<ModeSplitView> {

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.changeAmountToPay.call();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(paymentsProvider.notifier);
    final state = ref.watch(paymentsProvider);
    final totalParts = state.totalPartsCount;
    double pricePerPart = widget.remainderToPay / totalParts;
    final int paidPartsCount = notifier.countPaidParts();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiscountSelectorWidget(updateTotalAmount: widget.changeAmountToPay, mode: PaymentMode.split),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStatusCard("Déjà encaissé", "${(paidPartsCount * pricePerPart).toStringAsFixed(2)} DH", "$paidPartsCount part payée", Colors.green),
            const SizedBox(width: 12),
            _buildStatusCard("Reste de la table", "${((totalParts - paidPartsCount) * pricePerPart).toStringAsFixed(2)} DH", "${totalParts - paidPartsCount} parts restantes", Colors.red),
            _buildStatusCard("Remise active", "${widget.showDiscount()}", "Appliquée aux parts cochées", Colors.orange),
          ],
        ),
        const SizedBox(height: 16),
        Opacity(
          opacity: paidPartsCount >= 1 ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: paidPartsCount >= 1,
            child: Row(
              children: [
                const Text("Nombre de parts : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(width: 8),
                buildStepperButton(Icons.remove, () {notifier.changePartsCount(-1);widget.changeAmountToPay.call();}),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(6)),
                  child: Text("$totalParts", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ),
                buildStepperButton(Icons.add, () {notifier.changePartsCount(1);widget.changeAmountToPay.call();}),
                const SizedBox(width: 12),
                Text("= ${pricePerPart.toStringAsFixed(2)} € / part", style: TextStyle(color: Colors.grey[600], fontSize: 13, fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
        
        
        const SizedBox(height: 16),
        const Text("Sélectionnez les parts à inclure dans ce paiement :", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(totalParts, (index) {
            
            bool isAlreadyPaid = index < paidPartsCount;
            int partNum = index + 1;
            bool isSelected = index >= paidPartsCount && index < paidPartsCount + state.qteToPay;

            return InkWell(
              onTap: isAlreadyPaid ? null : (){
                setState(() {
                  int qte =1;
                  if(isSelected){
                    qte = -1;
                  }
                  notifier.changeQuantityToPay(qte);
                  widget.changeAmountToPay.call();
                });
               
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isAlreadyPaid ? const Color(0xFFEDF7ED) : (isSelected ? Colors.black : Colors.white),
                  border: Border.all(color: isAlreadyPaid ? Colors.transparent : (isSelected ? Colors.black : Colors.grey[300]!), width: 1.5),
                ),
                child: Center(
                  child: isAlreadyPaid
                      ? const Icon(Icons.check, size: 16, color: Color(0xFF4CAF50))
                      : Text("$partNum", style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget _buildStatusCard(String title, String mainValue, String subText, MaterialColor color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: color[800], fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(mainValue, style: TextStyle(color: color[900], fontSize: 18, fontWeight: FontWeight.bold)),
            Text(subText, style: TextStyle(color: color[700], fontSize: 11)),
          ],
        ),
      ),
    );
  }
}