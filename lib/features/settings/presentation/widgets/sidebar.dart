import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/settings/data/dashboard_provider.dart';


class PosSidebar extends ConsumerWidget {
  const PosSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(gestionSectionProvider);

    return Container(
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Color(0xFFE8E5EF)),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 18),
          const _Brand(),
          const SizedBox(height: 30),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              children: [
                const _SectionLabel('Commandes'),

                _item(
                  context,
                  ref,
                  GestionSection.dashboard,
                  Icons.space_dashboard_outlined,
                  'Dashboard',
                  selected,
                ),
                /*_item(
                  context,
                  ref,
                  GestionSection.historique,
                  Icons.history,
                  'Historique',
                  selected,
                ),
                _item(
                  context,
                  ref,
                  GestionSection.statistiques,
                  Icons.bar_chart_outlined,
                  'Statistiques',
                  selected,
                ),*/
                _item(
                  context,
                  ref,
                  GestionSection.reporting,
                  Icons.analytics_outlined,
                  'Reporting',
                  selected,
                ),
                _item(
                  context,
                  ref,
                  GestionSection.documents,
                  Icons.description_outlined,
                  'Documents',
                  selected,
                ),

                const _SectionLabel('Gestion'),

                _item(
                  context,
                  ref,
                  GestionSection.stock,
                  Icons.inventory_2_outlined,
                  'Stock',
                  selected,
                ),
                _item(
                  context,
                  ref,
                  GestionSection.produits,
                  Icons.shopping_bag_outlined,
                  'Produits',
                  selected,
                ),
                /*_item(
                  context,
                  ref,
                  GestionSection.options,
                  Icons.tune_outlined,
                  'Options',
                  selected,
                ),*/
                _item(
                  context,
                  ref,
                  GestionSection.reductions,
                  Icons.percent_outlined,
                  'Réductions',
                  selected,
                ),

                const _SectionLabel('Configuration'),

                _item(
                  context,
                  ref,
                  GestionSection.utilisateurs,
                  Icons.people_outline,
                  'Utilisateurs',
                  selected,
                ),
                _item(
                  context,
                  ref,
                  GestionSection.parametres,
                  Icons.settings_outlined,
                  'Paramètres',
                  selected,
                ),
              ],
            ),
          ),

          const _LogoutButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context,
    WidgetRef ref,
    GestionSection section,
    IconData icon,
    String label,
    GestionSection selected,
  ) {
    final active = selected == section;

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: active ? const Color(0xFF633DE0) : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: () {
            ref.read(gestionSectionProvider.notifier).state = section;
          },
          child: SizedBox(
            height: 35,
            child: Row(
              children: [
                const SizedBox(width: 9),
                Icon(
                  icon,
                  size: 16,
                  color: active ? Colors.white : const Color(0xFF6F6A78),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight:
                          active ? FontWeight.w600 : FontWeight.w400,
                      color:
                          active ? Colors.white : const Color(0xFF302D36),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF633DE0),
              borderRadius: BorderRadius.circular(9),
            ),
            alignment: Alignment.center,
            child: const Text(
              'P',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'POS',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              Text(
                'Manager',
                style: TextStyle(
                  color: Color(0xFF77727F),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF77727F),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8E5EF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout, size: 14, color: Color(0xFF77727F)),
          SizedBox(width: 6),
          Text(
            'Se déconnecter',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xFF77727F),
            ),
          ),
        ],
      ),
    );
  }
}
