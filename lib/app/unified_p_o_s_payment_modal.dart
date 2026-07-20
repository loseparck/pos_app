import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnifiedPOSPaymentModal extends StatefulWidget {
  const UnifiedPOSPaymentModal({Key? key}) : super(key: key);

  @override
  State<UnifiedPOSPaymentModal> createState() => _UnifiedPOSPaymentModalState();
}

class _UnifiedPOSPaymentModalState extends State<UnifiedPOSPaymentModal> {
  int _activeTab = 1; // Par défaut sur Split pour les tests
  String _paymentMethod = 'Espèces';
  String _amountInput = '';
  
  // --- ÉTAT DU MODE SPLIT ---
  int _totalParts = 4; 
  // Contient la liste des numéros de parts sélectionnées (ex: [2, 3])
  List<int> _selectedPartsToPay = [2]; 

  // --- ÉTAT DU MODE ARTICLES ---
  final List<Map<String, dynamic>> _articles = [
    {'name': 'Entrecôte frites', 'type': 'plat', 'price': 18.00, 'qty': 1, 'selectedQty': 1, 'status': 'Encaissé', 'checked': true},
    {'name': 'Salade César', 'type': 'entrée', 'price': 9.50, 'qty': 1, 'selectedQty': 1, 'status': 'Encaissé', 'checked': true},
    {'name': 'Côte de bœuf', 'type': 'plat', 'price': 13.00, 'qty': 5, 'selectedQty': 2, 'status': 'Partiel (1/5 payé)', 'checked': false}, 
    {'name': 'Tarte tatin', 'type': 'dessert', 'price': 8.50, 'qty': 1, 'selectedQty': 1, 'status': 'A encaisser', 'checked': true},
    {'name': 'Bouteille Bordeaux', 'type': 'boisson', 'price': 6.50, 'qty': 1, 'selectedQty': 1, 'status': 'A encaisser', 'checked': false},
  ];

  // Constantes de calcul de la note globale
  double get _totalOrder => 68.50;
  double get _alreadyPaid => 27.50;
  double get _remainderToPay => 15.33; // Reste global fixe issu de votre capture

  // --- LE MOTEUR INTERACTIF DE CALCUL DES PRIX ---
  double get _amountToPay {
    if (_activeTab == 0) {
      // Mode Total global
      return 23.00; 
    } else if (_activeTab == 1) {
      // Mode Split : Prix unitaire d'une part * Nombre de parts cochées
      if (_totalParts <= 1) return _remainderToPay;
      double pricePerPart = _remainderToPay / (_totalParts - 1); 
      return pricePerPart * _selectedPartsToPay.length;
    } else {
      // Mode Articles : Somme des (Prix * Quantité choisie) uniquement pour les éléments cochés non encaissés
      double calculatedTotal = 0;
      for (var art in _articles) {
        if (art['checked'] && art['status'] != 'Encaissé') {
          calculatedTotal += art['price'] * art['selectedQty'];
        }
      }
      return calculatedTotal;
    }
  }

  double get _changeToReturn {
    double input = double.tryParse(_amountInput) ?? 0.0;
    if (input > _amountToPay) return input - _amountToPay;
    return 0.0;
  }

  void _handleKeyPress(String value) {
    HapticFeedback.lightImpact();
    setState(() {
      if (value == '⌫') {
        if (_amountInput.isNotEmpty) _amountInput = _amountInput.substring(0, _amountInput.length - 1);
      } else if (value == '.') {
        if (!_amountInput.contains('.')) _amountInput += _amountInput.isEmpty ? '0.' : '.';
      } else {
        _amountInput += value;
      }
    });
  }

  void _quickAmount(double value) {
    HapticFeedback.mediumImpact();
    setState(() { _amountInput = value.toStringAsFixed(2); });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color(0xFFF5F5F3),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.90,
        child: Column(
          children: [
            _buildTopBar(),
            _buildTabBar(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Workspace Gauche - Affichage Interactif (60%)
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _buildLeftWorkspace(),
                    ),
                  ),
                  // Workspace Droit - Clavier Intelligent (40%)
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: _buildRightKeypad(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- TOP BAR & TABS ---

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Table t1 · $_totalParts couverts", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Commande ouverte à 19:42 · ${_articles.length} articles · $_totalOrder €", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.cancel, color: Color(0xFFDCDCDA)),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _buildTabItem("Total", Icons.receipt_long_outlined, 0),
          _buildTabItem("Split", Icons.people_outline, 1),
          _buildTabItem("Articles", Icons.list_alt_outlined, 2, badge: "3 reste"),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, IconData icon, int index, {String? badge}) {
    bool isActive = _activeTab == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() { _activeTab = index; _amountInput = ''; }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: isActive ? Colors.black : Colors.transparent, width: 2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isActive ? Colors.black : Colors.grey[500], size: 18),
              const SizedBox(width: 8),
              Text(label, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.w500, color: isActive ? Colors.black : Colors.grey[600])),
              if (badge != null && index == 2) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: Colors.orange[800], borderRadius: BorderRadius.circular(10)),
                  child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  // --- WORKSPACE CONTEXTUEL GAUCHE ---

  Widget _buildLeftWorkspace() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_activeTab == 0) _buildTotalView(),
        if (_activeTab == 1) _buildSplitView(),
        if (_activeTab == 2) _buildArticlesView(),
        const Spacer(),
        _buildSaisieForm(),
        const SizedBox(height: 12),
        _buildModePaiementSection(),
        const SizedBox(height: 12),
        _buildValidationButton(),
      ],
    );
  }

  Widget _buildTotalView() {
    return Column(
      children: [
        _buildReductionRow(),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildInfoCard("Sous-total", "22.00 €"),
            _buildInfoCard("Réduction", "-2.00 €", textColor: Colors.red),
            _buildInfoCard("TVA", "0.00 €"),
            _buildInfoCard("À encaisser", "23.00 €", isHighlight: true),
          ],
        ),
      ],
    );
  }

  Widget _buildSplitView() {
    // Calcul de la valeur théorique d'une part individuelle
    double pricePerPart = _remainderToPay / (_totalParts - 1 > 0 ? _totalParts - 1 : 1);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: _buildStatusCard("Déjà encaissé", "7.67 €", "1 part payée", Colors.green)),
            const SizedBox(width: 12),
            Expanded(child: _buildStatusCard("Reste de la table", "${_remainderToPay.toStringAsFixed(2)} €", "${_totalParts - 1} parts restantes", Colors.red)),
          ],
        ),
        const SizedBox(height: 16),
        
        // Sélecteur de parts resserré
        Row(
          children: [
            const Text("Nombre de parts : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(width: 8),
            _buildStepperButton(Icons.remove, () {
              setState(() {
                if (_totalParts > 2) {
                  _totalParts--;
                  _selectedPartsToPay.clear(); // Reset pour éviter les index obsolètes
                  _selectedPartsToPay.add(2);
                }
              });
            }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(6)),
              child: Text("$_totalParts", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            _buildStepperButton(Icons.add, () => setState(() => _totalParts++)),
            const SizedBox(width: 12),
            Text("= ${pricePerPart.toStringAsFixed(2)} € / part", style: TextStyle(color: Colors.grey[600], fontSize: 13, fontStyle: FontStyle.italic)),
          ],
        ),
        const SizedBox(height: 16),
        
        const Text("Sélectionnez les parts à inclure dans ce paiement :", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),

        // Wrap protecteur anti-crash UI
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(_totalParts, (index) {
            bool isAlreadyPaid = index == 0; 
            int currentPartNumber = index + 1;
            bool isSelected = _selectedPartsToPay.contains(currentPartNumber);
            
            return InkWell(
              onTap: isAlreadyPaid ? null : () {
                setState(() {
                  if (isSelected) {
                    // Autorise la désélection uniquement s'il reste au moins une part active
                    if (_selectedPartsToPay.length > 1) {
                      _selectedPartsToPay.remove(currentPartNumber);
                    }
                  } else {
                    _selectedPartsToPay.add(currentPartNumber);
                  }
                  _amountInput = ''; // Clear la saisie manuelle lors du changement de sélection
                });
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isAlreadyPaid 
                      ? const Color(0xFFEDF7ED) 
                      : (isSelected ? Colors.black : Colors.white),
                  border: Border.all(
                    color: isAlreadyPaid ? Colors.transparent : (isSelected ? Colors.black : Colors.grey[300]!),
                    width: 1.5
                  ),
                ),
                child: Center(
                  child: isAlreadyPaid 
                    ? const Icon(Icons.check, size: 16, color: Color(0xFF4CAF50))
                    : Text(
                        "$currentPartNumber", 
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 13
                        ),
                      ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget _buildArticlesView() {
    return Column(
      children: [
        _buildReductionRow(),
        const SizedBox(height: 12),
        Container(
          height: 240, 
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (context, index) {
              final art = _articles[index];
              bool isEncaisse = art['status'] == 'Encaissé';
              bool hasMultipleQty = art['qty'] > 1;

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: art['checked'] ? (isEncaisse ? const Color(0xFFF4F9F4) : const Color(0xFFFFFDE7)) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: art['checked'] ? (isEncaisse ? Colors.green[200]! : Colors.orange[400]!) : Colors.grey[200]!),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: art['checked'],
                        activeColor: isEncaisse ? Colors.green : Colors.black,
                        onChanged: isEncaisse ? null : (val) {
                          setState(() {
                            art['checked'] = val;
                            _amountInput = ''; // Force la synchronisation de l'Appoint
                          });
                        },
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(art['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, decoration: isEncaisse ? TextDecoration.lineThrough : null, color: isEncaisse ? Colors.grey : Colors.black)),
                            Text("Prix unitaire : ${art['price'].toStringAsFixed(2)} €", style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                          ],
                        ),
                      ),
                      
                      // MINI-STEPPER DE FRACTIONNEMENT QUANTITÉ INTERACTIF
                      if (hasMultipleQty && !isEncaisse) ...[
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: [
                              _buildMiniStepperButton(Icons.remove, () {
                                if (art['selectedQty'] > 1) {
                                  setState(() {
                                    art['selectedQty']--;
                                    art['checked'] = true; // Auto-coché lors du changement
                                    _amountInput = '';
                                  });
                                }
                              }),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("${art['selectedQty']} / ${art['qty']}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                              _buildMiniStepperButton(Icons.add, () {
                                if (art['selectedQty'] < art['qty']) {
                                  setState(() {
                                    art['selectedQty']++;
                                    art['checked'] = true; 
                                    _amountInput = '';
                                  });
                                }
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                      ] else ...[
                        Text("× ${art['qty']}", style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                        const SizedBox(width: 16),
                      ],

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Calcul dynamique local du composant article
                          Text(
                            "${((isEncaisse ? art['qty'] : art['selectedQty']) * art['price']).toStringAsFixed(2)} €", 
                            style: TextStyle(fontWeight: FontWeight.bold, color: isEncaisse ? Colors.grey : Colors.black)
                          ),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isEncaisse ? const Color(0xFFEDF7ED) : const Color(0xFFECEFF1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(art['status'], style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: isEncaisse ? Colors.green[800] : Colors.grey[700])),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  // --- RENDU ET COMPOSANTS FORMULAIRES ---

  Widget _buildStatusCard(String title, String mainValue, String subText, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color[800], fontSize: 11, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(mainValue, style: TextStyle(color: color[900], fontSize: 18, fontWeight: FontWeight.bold)),
          Text(subText, style: TextStyle(color: color[700], fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildMiniStepperButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Icon(icon, size: 12, color: Colors.black87),
      ),
    );
  }

  Widget _buildReductionRow() {
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

  Widget _buildInfoCard(String title, String value, {Color? textColor, bool isHighlight = false}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey[100]!)),
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

  Widget _buildStepperButton(IconData icon, VoidCallback onTap) {
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

  Widget _buildSaisieForm() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black, width: 1.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Montant reçu via $_paymentMethod", style: TextStyle(color: Colors.grey[500], fontSize: 11, fontWeight: FontWeight.w600)),
                Text(_amountInput.isEmpty ? "0.00 €" : "$_amountInput €", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFF4F9F4), borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Rendu monnaie", style: TextStyle(color: Color(0xFF4CAF50), fontSize: 11, fontWeight: FontWeight.w600)),
                Text("+${_changeToReturn.toStringAsFixed(2)} €", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50))),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildModePaiementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("MODE DE PAIEMENT SÉLECTIONNÉ", style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Row(
          children: [
            _buildPaymentMethodButton("Espèces", Icons.payments_outlined),
            const SizedBox(width: 8),
            _buildPaymentMethodButton("Carte", Icons.credit_card_outlined),
            const SizedBox(width: 8),
            _buildPaymentMethodButton("Autre", Icons.more_horiz),
          ],
        )
      ],
    );
  }

  Widget _buildPaymentMethodButton(String method, IconData icon) {
    bool isSelected = _paymentMethod == method;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _paymentMethod = method),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1C1C1E) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected ? Colors.transparent : Colors.grey[300]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.grey[700], size: 16),
              const SizedBox(width: 6),
              Text(method, style: TextStyle(color: isSelected ? Colors.white : Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValidationButton() {
    String actionLabel = "Enregistrer le paiement";
    if (_activeTab == 1) {
      _selectedPartsToPay.sort();
      actionLabel = _selectedPartsToPay.length > 1 
        ? "Encaisser ${_selectedPartsToPay.length} parts" 
        : "Encaisser la part ${_selectedPartsToPay.first}";
    }
    if (_activeTab == 2) {
      int checkedCount = _articles.where((a) => a['checked'] && a['status'] != 'Encaissé').length;
      actionLabel = "Encaisser la sélection ($checkedCount)";
    }

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _amountToPay <= 0 ? null : () {
          // Action d'encaissement ici
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[300],
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text("$actionLabel · ${_amountToPay.toStringAsFixed(2)} €", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );
  }

  // --- CLAVIER DROIT ADAPTATIF ET SÉCURISÉ ---

  Widget _buildRightKeypad() {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.45, 
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildKeypadButton('1'), _buildKeypadButton('2'), _buildKeypadButton('3'),
              _buildKeypadButton('4'), _buildKeypadButton('5'), _buildKeypadButton('6'),
              _buildKeypadButton('7'), _buildKeypadButton('8'), _buildKeypadButton('9'),
              _buildKeypadButton('.'), _buildKeypadButton('0'), _buildKeypadButton('⌫'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildQuickCashButton(5),
            const SizedBox(width: 8),
            _buildQuickCashButton(10),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _buildQuickCashButton(20),
            const SizedBox(width: 8),
            Expanded(
              child: InkWell(
                onTap: () => _quickAmount(_amountToPay),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF7ED), 
                    borderRadius: BorderRadius.circular(10), 
                    border: Border.all(color: Colors.green[300]!)
                  ),
                  child: Center(
                    child: Text(
                      "Exact (${_amountToPay.toStringAsFixed(2)}€)", 
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900], fontSize: 13)
                    )
                  ),
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
        onTap: () => _handleKeyPress(label),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickCashButton(double val) {
    return Expanded(
      child: InkWell(
        onTap: () => _quickAmount(val),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[300]!)),
          child: Center(child: Text("$val €", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700], fontSize: 13))),
        ),
      ),
    );
  }
}