import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GestionSection {
  dashboard,
  //historique,
  //statistiques,
  reporting,
  documents,
  stock,
  produits,
  //options,
  reductions,
  utilisateurs,
  parametres,
}

final gestionSectionProvider =
    StateProvider<GestionSection>((ref) => GestionSection.dashboard);
