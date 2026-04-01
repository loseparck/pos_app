import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/domain/entities/order.dart';
import 'package:pos_app/features/orders/domain/entities/order_item.dart';
import 'package:pos_app/features/orders/domain/entities/payment.dart';
import 'package:pos_app/features/orders/domain/entities/payment_item.dart';
import 'package:pos_app/features/orders/domain/entities/payment_items.dart';
import 'package:pos_app/features/orders/domain/entities/payment_mode.dart';
import 'package:pos_app/features/orders/domain/entities/payment_split.dart';
import 'package:pos_app/features/orders/domain/entities/payment_total.dart';
import 'package:pos_app/features/orders/presentation/widgets/payment_dialog_item.dart';
import 'package:pos_app/features/payments/presentation/state/payment_provider.dart';
import 'package:pos_app/features/plan/data/repositories/plan_group_provider.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';

class PaymentDialog extends ConsumerStatefulWidget {
  const PaymentDialog({super.key});

  @override
  ConsumerState<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends ConsumerState<PaymentDialog> {
  final Map<String, TextEditingController> values = {};
  Order? order;
  static const String totalChangeInput ="given_amount";
  static const String partCountInput ="split_count";
  static const String splitChangeInput ="given_amount_split";
  static const String itemsChangeInput ="given_amount_items";
  List<OrderItem> items = [];
  PaymentSplit paymentSplit = PaymentSplit(paymentDetails: []); //Ok 
  PaymentItems paymentItems = PaymentItems(itemsPaid: []); //Ok
  PaymentTotal paymentTotal = PaymentTotal(); //Ok
  Set<String> selectedIds = {};
  List<String> paidItems = [];

  @override
  void initState() {
    super.initState();
    order = ref.read(ordersProvider)!.selectedOrder;
    values[totalChangeInput] = TextEditingController(text: "${order!.total}");
    values[partCountInput] = TextEditingController(text: "1");
    values[splitChangeInput] = TextEditingController(text: "${order!.total}");
    values[itemsChangeInput] = TextEditingController(text: "0");
    fillItemsList();
  }

  void fillItemsList(){
    for(OrderItem item in order!.items){
      for (int i = 0; i < item.quantity; i++) {
        items.add(item.copyWith(id: "${item.id}-$i", quantity: 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1100, // ✅ seulement largeur
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT (compact)
          children: [
            /// 🧾 HEADER (TITRE)
            Container(
              //width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text("Paiement", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            ),
            /// BUTTON (top)
            Flexible(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// TABS
                  Row(
                    children: [
                      _tabButton("Total", 0, paymentSplit.paymentDetails.length != 0 || paymentItems.itemsPaid.length != 0),
                      _tabButton("Split", 1, paymentItems.itemsPaid.length != 0),
                      _tabButton("Items", 2, paymentSplit.paymentDetails.length != 0 ),
                    ],
                  ),

                  
                ],
              ),
            ),

            const Divider(),
            
            /// 🔽 CONTENU PRINCIPAL
            Row(
              mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
              children: [
                /// CONTENU SCROLL SI BESOIN
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: _buildContent(),
                  ),
                ),
                
                const VerticalDivider(),
                /// CLAVIER (droite)
                SizedBox(
                  width: 220,
                  child: _buildKeypad(),
                ),
                const VerticalDivider(width: 5),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.green.shade400,
                      ),
                      onPressed: !isSaveEnabled() ? null : (){savePayment();Navigator.pop(context);},
                      child: Row(
                        children: [
                          const Icon(Icons.price_check_rounded),
                          Text(
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            " Enregistrer le Paiement"),
                        ],
                      )
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index, bool isEnabled) {
    var selectedTab = ref.watch(paymentProvider(order!.total)).selectedTab;
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: !isEnabled ? () => ref.read(paymentProvider(order!.total).notifier).selectTab(index) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    var selectedTab = ref.watch(paymentProvider(order!.total)).selectedTab;
    switch (selectedTab) {
      case 0:
        return _buildTabTotal();
      case 1:
        return _buildTabSplit();
      case 2:
        return _buildTabItems();
      default:
        return const SizedBox();
    }
  }

  // =========================
  // TAB 1 - TOTAL
  // =========================
  Widget _buildTabTotal() {
    return Column(
      children: [
        _discountBlock(),

        const SizedBox(height: 10),

        _paymentSummary(showSplit: false, showRemaining: false),
      ],
    );
  }

  // =========================
  // TAB 2 - SPLIT
  // =========================
  Widget _buildTabSplit() {
    return Column(
      children: [
        _discountBlock(),

        const SizedBox(height: 10),

        _paymentSummary(showSplit: true),
      ],
    );
  }
  final lController = ScrollController();
  // =========================
  // TAB 3 - ITEMS
  // =========================
  Widget _buildTabItems() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LISTE PRODUITS
        Expanded(
          child: Container(
            height: 250,
            color: Colors.grey.shade100,
            child: ListView.builder(
              controller: lController,
            itemCount: items.length,
            itemBuilder: (ctext, index) {

              final item = items[index];
              final isSelected = selectedIds.contains(item.id);
              final isPaid = paidItems.contains(item.id);
              return PaymentDialogItem(
                productName: item.name,
                productPrice: item.unitPrice,
                supplements: item.options,
                backgroundColor: isPaid ? Colors.green : isSelected ? Colors.orange : Colors.white,
                onAdd: isPaid ?  () {} : () {
                  setState(() {
                    if (isSelected) {
                      selectedIds.remove(item.id);
                    } else {
                      selectedIds.add(item.id);
                    }
                  });
                },
                onRemove: () {
                  
                },

              );
            },
          ),
          ),
        ),

        const SizedBox(width: 10),

        /// PARTIE DROITE
        Expanded(
          child: Column(
            children: [
              _discountBlock(),
              const SizedBox(height: 10),
              _paymentSummary(showRemaining: true),
            ],
          ),
        ),
      ],
    );
  }

  // =========================
  // DISCOUNT BLOCK
  // =========================
  bool customDiscount = false;

  Widget _discountBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Réduction",
            style: TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 6),

        DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(value: "5%", child: Text("5%")),
            DropdownMenuItem(value: "10%", child: Text("10%")),
            DropdownMenuItem(value: "custom", child: Text("Custom")),
          ],
          onChanged: (value) {
            setState(() {
              customDiscount = value == "custom";
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),

        if (customDiscount) ...[
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

  // =========================
  // SUMMARY BLOCK
  // =========================
  Widget _paymentSummary({
    bool showSplit = false,
    bool showRemaining = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _line("Total de la Commande", order!.total.toStringAsFixed(2))),
            const SizedBox(width: 20,),
            Expanded(child: _line("Réduction", "-2€")),
          ],
        ),

        Row(
          children: [
            Expanded(child: _line("Total après Réduction", "23€"),),
            const VerticalDivider(thickness: 20,),
            Expanded(child: _line("TVA", order!.totalVAT.toStringAsFixed(2))),
          ],
        ),
        const Divider(),



        if (showSplit)
          _paymentSplitSummary(),
        if (showRemaining)
          _paymentItemSummary(),
        if (!showSplit && !showRemaining)
          _paymentTotalSummary(),
          
  
        const SizedBox(height: 10),

        /// MODE PAIEMENT
        Row(
          children: [
            Expanded(child: _paymentModeButton("Espèce", PaymentMode.cash)),
            const SizedBox(width: 8),
            Expanded(child: _paymentModeButton("Carte", PaymentMode.card)),
            const SizedBox(width: 8),
            Expanded(child: _paymentModeButton("Autre", PaymentMode.other)),
          ],
        )
      ],
    );
  }

  PaymentMode mode = PaymentMode.cash;

  Widget _paymentSplitSummary() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child:  _inputLine("Nombre de parts", partCountInput)),
            const SizedBox(width: 20,),
            Expanded(child:  _partLine(partCountInput,  order!.total)),
          ],
        ),

        const Divider(),

        Row(
          children: [
            Expanded(child: _inputLine("Montant donné", splitChangeInput)),
            const SizedBox(width: 20,),
            Expanded(child: _monnaieLine(splitChangeInput, order!.total / paymentSplit.numberOfParts)),
          ],
        ),

        Row(
          children: [
            Expanded(child: _line("Nombre de Parts payé", "${paymentSplit.paymentDetails.length}")),
            const SizedBox(width: 20,),
            Expanded(child: _line("Nombre de Parts Restantes", "${paymentSplit.numberOfParts - paymentSplit.paymentDetails.length}")),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.green.shade400,
                  ),
                  onPressed: paymentSplit.numberOfParts > paymentSplit.paymentDetails.length ? (){
                    addPart();
                  } : null,
                  child: Row(
                    children: [
                      const Icon(Icons.group_add_outlined),
                      Text(
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        " Payer une part"),
                    ],
                  )
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _paymentTotalSummary() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _inputLine("Montant donné", totalChangeInput)),
            const SizedBox(width: 20,),
            Expanded(child: _monnaieLine(totalChangeInput, order!.total)),
          ],
        ),
      ],
    );
  }

  Widget _paymentItemSummary() {
    final double total = items.fold(0.0, (sum, s) => sum + (selectedIds.contains(s.id) ? s.total : 0));
    //values[itemsChangeInput]?.text = "$total";
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _inputLine("Montant donné", itemsChangeInput)),
            const SizedBox(width: 20,),
            Expanded(child: _monnaieLine(itemsChangeInput, total)),
          ],
        ),
        
        _line("Total Selection", "$total"),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.green.shade400,
                  ),
                  onPressed: selectedIds.isNotEmpty ? (){
                    setState(() {
                      addItem();
                    });
                    
                  } : null,
                  child: Row(
                    children: [
                      const Icon(Icons.add_shopping_cart),
                      Text(
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        " Payer la selection"),
                    ],
                  )
                ),
            ],
          ),
        ),

      ],
    );
  }

  Widget _line(String label, String value, {Color? backgroundColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
          style: TextStyle(fontWeight: FontWeight.bold),),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: backgroundColor ?? Colors.transparent)),
        ],
      ),
    );
  }

  Widget _monnaieLine(String fieldKey, double total) {
    final controller = _getController(fieldKey);
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final text = value.text;
        final given = double.tryParse(text) ?? 0;
        final monnaie = given - total;
        final color = monnaie < 0 ? Colors.red : null;
        return _line("Monnaie", monnaie.toStringAsFixed(2), backgroundColor: color);
      },
    );
  }

  Widget _partLine(String fieldKey, double total) {
    final controller = _getController(fieldKey);

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        paymentSplit = paymentSplit.copyWith(numberOfParts: int.tryParse(value.text) ?? 1);

        final text = value.text;
        final parts = double.tryParse(text) ?? 1;
        final monnaie = total / parts;

        return _line("Montant pour cette Part", monnaie.toStringAsFixed(2));
      },
    );
  }

  TextEditingController _getController(String key) {
    return values.putIfAbsent(key, () => TextEditingController());
  }

  Widget _inputLine(String label, String fieldKey) {
    var value = values[fieldKey];
    if(value == null){
      values[fieldKey] = TextEditingController();
      value = values[fieldKey];
    }
    var activeField = ref.watch(paymentProvider(order!.total)).activeField;
    final isActive = activeField == fieldKey;

    return GestureDetector(
      onTap: () {
         ref.read(paymentProvider(order!.total).notifier).setActiveField(fieldKey);
        /*setState(() {
          activeField = fieldKey;
        });*/
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: TextField(
          readOnly: checkFoReadOnlyField(fieldKey),
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isActive ? Colors.blue : Colors.grey,
                width: 2,
              ),
            ),
          ),
          controller: value,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          onTap: () {
            ref.read(paymentProvider(order!.total).notifier).setActiveField(fieldKey);
            /*setState(() {
              activeField = fieldKey;
            });*/
          },
        ),
      ),
    );
  }

  Widget _paymentModeButton(String label, PaymentMode mode) {
    
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) =>
          this.mode == mode ? Colors.black : Colors.white
        ),
      ),
      onPressed: () {
        setState(() {
          this.mode = mode;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          
          color: this.mode == mode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    final keys = [
      "1","2","3",
      "4","5","6",
      "7","8","9",
      ".","0","⌫",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (_, index) {
        final key = keys[index];
        var activeField = ref.watch(paymentProvider(order!.total)).activeField;
        return ElevatedButton(
          onPressed: () {
            if (activeField.isEmpty) return;
            if(!checkFoReadOnlyField(activeField)){
              setState(() {
                final current = values[activeField] ?? TextEditingController();
                if (key == "⌫") {
                  if (current.text.isNotEmpty) {
                    values[activeField]!.text =
                        current.text.substring(0, current.text.length - 1);
                  }
                } else {
                  values[activeField]!.text = current.text + key;
                }
              });
            }
          },
          child: Text(key),
        );
      },
    );
  }
  
  void savePayment() {
    var selectedTab = ref.watch(paymentProvider(order!.total)).selectedTab;
    final Payment payment;
    if(selectedTab == 0){
      payment = Payment(details: paymentTotal.copyWith(paymentMode:mode));
    } else if(selectedTab == 1){
      payment = Payment(details: paymentSplit, type: PaymentType.split);
    } else{
      payment = Payment(details: paymentItems, type: PaymentType.order);
    }
    order = order?.copyWith(payment: payment);
    ref.read(ordersProvider.notifier).payOrder(payment);
    ref.read(planGroupProvider.notifier).changeTableState(TableStatus.empty);
  }

  void addPart(){
    if(paymentSplit.numberOfParts > paymentSplit.paymentDetails.length){
      paymentSplit.paymentDetails.add(PaymentTotal(
        givenAmount: double.tryParse(values[splitChangeInput]?.text ?? "0"),
        paymentMode: mode
        ));
      values[splitChangeInput]?.text = '0';
    }
  }

  void addItem(){
    if(selectedIds.isNotEmpty){
      final PaymentItem paymentItem = PaymentItem(
        orderIds: selectedIds.map((item) => item.substring(0, item.indexOf('-'))).toList(), 
        paymentDetail: PaymentTotal(
          givenAmount: double.tryParse(values[itemsChangeInput]?.text ?? "0"),
          paymentMode: mode
          ),
      );
      paidItems.addAll(selectedIds);
      selectedIds.clear();
      paymentItems.itemsPaid.add(paymentItem);
    }
  }

  bool isSaveEnabled(){
    var selectedTab = ref.watch(paymentProvider(order!.total)).selectedTab;
    if(selectedTab == 0){
      return true;
    } else if(selectedTab == 1){
      return paymentSplit.numberOfParts == paymentSplit.paymentDetails.length;
    } else{
      return items.length == paidItems.length;
    }
  }

  bool checkFoReadOnlyField(String fieldKey){
    var selectedTab = ref.watch(paymentProvider(order!.total)).selectedTab;
    if(selectedTab == 1){
      if(fieldKey == partCountInput){
        return paymentSplit.paymentDetails.isNotEmpty;
      }
      return paymentSplit.numberOfParts == paymentSplit.paymentDetails.length;
    } else{
      return false;
    }
  }
}