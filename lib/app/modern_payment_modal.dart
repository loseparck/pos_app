import 'package:flutter/material.dart';

class ModernPaymentModal extends StatefulWidget {
  const ModernPaymentModal({Key? key}) : super(key: key);

  @override
  State<ModernPaymentModal> createState() => _ModernPaymentModalState();
}

class _ModernPaymentModalState extends State<ModernPaymentModal> {
  int _selectedModeIndex = 1; // 0: Total, 1: Split, 2: Items
  int _partsCount = 1;
  String _selectedPaymentMethod = 'Espèce';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: const Color(0xFFF8F9FA), // Fond gris très clair et moderne
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // 1. En-tête avec Segmented Control Moderne
            _buildHeader(),
            const SizedBox(height: 24),
            
            // 2. Corps Principal (Split 60% / 40%)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // PANEL GAUCHE (60%) : Contexte & Actions
                  Expanded(
                    flex: 6,
                    child: _buildLeftPanel(),
                  ),
                  
                  const SizedBox(width: 24),
                  VerticalDivider(width: 1, color: Colors.grey[200]),
                  const SizedBox(width: 24),
                  
                  // PANEL DROIT (40%) : Saisie & Raccourcis
                  Expanded(
                    flex: 4,
                    child: _buildRightPanel(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- COMPOSANTS DE L'INTERFACE ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Paiement",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A)),
        ),
        // Remplacement de l'onglet massif par une pilule épurée
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildTabButton("Total", 0),
              _buildTabButton("Split", 1),
              _buildTabButton("Items", 2),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 28),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  Widget _buildTabButton(String title, int index) {
    final isSelected = _selectedModeIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedModeIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected 
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? const Color(0xFF007AFF) : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Résumé financier élégant
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total de la Commande", style: TextStyle(color: Colors.grey)),
                  Text("22.00 €", style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Réduction", style: TextStyle(color: Colors.grey)),
                  Text("-2.00 €", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Zone dynamique selon le mode (Ici exemple du "SPLIT")
        if (_selectedModeIndex == 1) ...[
          const Text("Nombre de parts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          // Stepper Géant et ergonomique
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent, size: 28),
                  onPressed: _partsCount > 1 ? () => setState(() => _partsCount--) : null,
                ),
                Text(
                  "$_partsCount ${_partsCount > 1 ? 'parts' : 'part'}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green, size: 28),
                  onPressed: () => setState(() => _partsCount++),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Montant par part : ${(20.00 / _partsCount).toStringAsFixed(2)} €",
            style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic),
          ),
        ],

        const Spacer(),
        
        // Sélecteur de mode de paiement (Espèce, Carte, Autre) unifié
        const Text("Mode de paiement", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _buildPaymentMethodCard("Espèce", Icons.payments)),
            const SizedBox(width: 12),
            Expanded(child: _buildPaymentMethodCard("Carte", Icons.credit_card)),
            const SizedBox(width: 12),
            Expanded(child: _buildPaymentMethodCard("Autre", Icons.devices_other)),
          ],
        ),
        const SizedBox(height: 24),

        // Grand Bouton d'action Principal (Call To Action permanent)
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF34C759), // Vert iOS moderne
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: Text(
              _selectedModeIndex == 1 ? "Payer une part" : "Valider le Paiement",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPaymentMethodCard(String method, IconData icon) {
    final isSelected = _selectedPaymentMethod == method;
    return InkWell(
      onTap: () => setState(() => _selectedPaymentMethod = method),
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007AFF) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black87, size: 28),
            const SizedBox(height: 8),
            Text(
              method,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightPanel() {
    return Column(
      children: [
        // Zone d'affichage du statut monétaire (Reste à payer)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("RESTE À PAYER", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange)),
              SizedBox(height: 4),
              Text("20.00 €", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange)),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Raccourcis billets rapides
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['10€', '20€', '50€', 'Exact'].map((val) {
            return InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(val, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Pavé Numérique Moderne (Style Carré aux bords doux)
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.3,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...'123456789.0'.split(''),
              const Icon(Icons.backspace_outlined, color: Colors.black87),
            ].map((char) {
              return Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Center(
                    child: char is String 
                      ? Text(char, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600))
                      : char as Widget,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}