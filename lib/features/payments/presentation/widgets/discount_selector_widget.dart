import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/data/repositories/product_repository_provider.dart';
import 'package:pos_app/features/catalog/domain/entities/discount.dart';
import 'package:pos_app/features/payments/data/repositories/payment_repository_provider.dart';
import 'package:pos_app/features/payments/domain/entities/payment_session.dart';

class DiscountSelectorWidget extends ConsumerStatefulWidget {
  final Function()? updateTotalAmount;
  final PaymentMode mode;
  
  const DiscountSelectorWidget(
    {super.key, this.updateTotalAmount,required this.mode }
    );

  @override
  ConsumerState<DiscountSelectorWidget> createState() => _DiscountSelectorWidgetState();
}

class _DiscountSelectorWidgetState extends ConsumerState<DiscountSelectorWidget> {
  String _selectedOption = 'Aucune';
  String _customType = '%';
  final TextEditingController _customValueController = TextEditingController();
  bool _applyDiscountToAll = false;

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.updateTotalAmount?.call();
    });
    
  }

  void initSelectedDiscount(){
    if(ref.watch(paymentsProvider).discount != null){
      _selectedOption = ref.read(paymentsProvider).discount!.name;
    } else {
      _selectedOption = 'Aucune';
    }
  }

  void _triggerUpdate() {
    if (_selectedOption == 'Custom') {
      double val = double.tryParse(_customValueController.text) ?? 0.0;
      ref.read(paymentsProvider.notifier).setDiscount(Discount(name: 'Custom', value: val, discountType: _customType == '%' ? DiscountType.percentage : DiscountType.fixed));
    } else if(_selectedOption != 'Aucune') {
      ref.read(paymentsProvider.notifier).setDiscount(ref.read(productsProvider).discounts.firstWhere((d) => d.name == _selectedOption));
    } else {
      ref.read(paymentsProvider.notifier).setDiscount(null);
    }
    widget.updateTotalAmount?.call();
  }

  @override
  Widget build(BuildContext context) {
    initSelectedDiscount();
    bool isCustom = _selectedOption == 'Custom';
    bool hasDiscount = _selectedOption != 'Aucune';
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.percent_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              const Text(
                "Réduction / Remise", 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black)
              ),
              const Spacer(),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedOption,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                  items: [
                    const DropdownMenuItem<String>(
                      value: 'Aucune',
                      child: Text('Aucune'),
                    ),
                    ...ref.read(productsProvider).discounts.map((discount) {
                      return DropdownMenuItem<String>(
                        value: discount.name,
                        child: Text(discount.name),
                      );
                    }),
                    const DropdownMenuItem<String>(
                      value: 'Custom',
                      child: Text('Sur-mesure...'),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _selectedOption = val ?? 'Aucune';
                      if (!isCustom) _customValueController.clear();
                    });
                    _triggerUpdate();
                  },
                ),
              ),
            ],
          ),
          
          if (isCustom) ...[
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _customValueController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Valeur',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onChanged: (_) => _triggerUpdate(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ToggleButtons(
                  isSelected: [_customType == '%', _customType == '€'],
                  onPressed: (index) {
                    setState(() => _customType = index == 0 ? '%' : '€');
                    _triggerUpdate();
                  },
                  constraints: const BoxConstraints(minHeight: 40, minWidth: 46),
                  borderRadius: BorderRadius.circular(8),
                  children: const [Text('%'), Text('€')],
                ),
              ],
            )
          ],
          
          if (hasDiscount && widget.mode != PaymentMode.total) ...[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  
                  Expanded(
                    child: _buildScopeButton(
                      title: widget.mode == PaymentMode.item ? "Réduction Par Article Sélectionné": "Réduction Par Parts Sélectionnées",
                      isSelected: !_applyDiscountToAll,
                      onTap: () {
                        setState(() {ref.read(paymentsProvider.notifier).setDiscountLife(false);_applyDiscountToAll=false;});
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: _buildScopeButton(
                      title: widget.mode == PaymentMode.item ? "Réduction sur Tous les Articles" : "Réduction sur Toutes les Parts",
                      isSelected: _applyDiscountToAll,
                      onTap: () {
                        setState(() {ref.read(paymentsProvider.notifier).setDiscountLife(true);_applyDiscountToAll=true;});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildScopeButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey[600],
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}