import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/catalog/presentation/pages/product_management_view.dart';
import 'package:pos_app/features/settings/data/dashboard_provider.dart';

import '../widgets/dashboard_card.dart';
import '../widgets/sidebar.dart';

class SettingPos extends ConsumerWidget {
  const SettingPos({super.key});

  String _title(GestionSection section) {
    switch (section) {
      /*case GestionSection.historique:
        return 'Historique';
      case GestionSection.statistiques:
        return 'Statistiques';*/
      case GestionSection.reporting:
        return 'Reporting';
      case GestionSection.documents:
        return 'Documents';
      case GestionSection.stock:
        return 'Stock';
      case GestionSection.produits:
        return 'Produits';
      /*case GestionSection.options:
        return 'Options';*/
      case GestionSection.reductions:
        return 'Réductions';
      case GestionSection.utilisateurs:
        return 'Utilisateurs';
      case GestionSection.parametres:
        return 'Paramètres';
      case GestionSection.dashboard:
        return 'Dashboard';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(gestionSectionProvider);
    
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const PosSidebar(),
            Expanded(
              child: Column(
                children: [
                  // Barre personnalisée (AppBar) en haut à droite du Sidebar
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.grey.shade200, // Optionnel : couleur de fond
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          _title(section),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            // Action pour fermer ou revenir en arrière
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1), // Ligne de séparation optionnelle
                  
                  // Contenu principal
                  const Expanded(
                    child: _GestionContent(),//ProductManagementView(),//_GestionContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 /* @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const PosSidebar(),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: const _GestionContent()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class _GestionContent extends ConsumerWidget {
  const _GestionContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(gestionSectionProvider);
    if (section == GestionSection.produits) {
      return const ProductManagementView();
    }
    if (section != GestionSection.dashboard) {
      return _ModulePlaceholder(
        title: _title(section),
        icon: _icon(section),
      );
    }

    return const _DashboardHome();
  }

  String _title(GestionSection section) {
    switch (section) {
      /*case GestionSection.historique:
        return 'Historique';
      case GestionSection.statistiques:
        return 'Statistiques';*/
      case GestionSection.reporting:
        return 'Reporting';
      case GestionSection.documents:
        return 'Documents';
      case GestionSection.stock:
        return 'Stock';
      case GestionSection.produits:
        return 'Produits';
      /*case GestionSection.options:
        return 'Options';*/
      case GestionSection.reductions:
        return 'Réductions';
      case GestionSection.utilisateurs:
        return 'Utilisateurs';
      case GestionSection.parametres:
        return 'Paramètres';
      case GestionSection.dashboard:
        return 'Dashboard';
    }
  }

  IconData _icon(GestionSection section) {
    switch (section) {
      /*case GestionSection.historique:
        return Icons.history;
      case GestionSection.statistiques:
        return Icons.bar_chart;*/
      case GestionSection.reporting:
        return Icons.analytics;
      case GestionSection.documents:
        return Icons.description;
      case GestionSection.stock:
        return Icons.inventory_2;
      case GestionSection.produits:
        return Icons.shopping_bag;
      /*case GestionSection.options:
        return Icons.tune;*/
      case GestionSection.reductions:
        return Icons.percent;
      case GestionSection.utilisateurs:
        return Icons.people;
      case GestionSection.parametres:
        return Icons.settings;
      case GestionSection.dashboard:
        return Icons.dashboard;
    }
  }
}

class _DashboardHome extends StatelessWidget {
  const _DashboardHome();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 5, 18, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Vue d’ensemble de votre activité',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF77727F),
            ),
          ),
          const SizedBox(height: 18),

          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 850 ? 4 : 2;

              return GridView.count(
                crossAxisCount: columns,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.05,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  DashboardMetric(
                    title: 'Ventes aujourd’hui',
                    value: '4 900,80 €',
                    badge: '+12,5 %',
                    icon: Icons.euro,
                  ),
                  DashboardMetric(
                    title: 'Commandes',
                    value: '68',
                    badge: '+8,2 %',
                    icon: Icons.shopping_cart_outlined,
                  ),
                  DashboardMetric(
                    title: 'Produits',
                    value: '120',
                    badge: 'Actifs',
                    icon: Icons.shopping_bag_outlined,
                  ),
                  DashboardMetric(
                    title: 'Stock faible',
                    value: '7',
                    badge: 'À vérifier',
                    icon: Icons.warning_amber_outlined,
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 14),

          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 850;

              if (!wide) {
                return const Column(
                  children: [
                    _SalesChartCard(),
                    SizedBox(height: 12),
                    _TopProductsCard(),
                    SizedBox(height: 12),
                    _RecentDocumentsCard(),
                  ],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: _SalesChartCard(),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 4,
                    child: _TopProductsCard(),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 12),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 850) {
                return const SizedBox(
                  width: 430,
                  child: _RecentDocumentsCard(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class _SalesChartCard extends StatelessWidget {
  const _SalesChartCard();

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Ventes',
      trailing: 'Cette semaine',
      child: SizedBox(
        height: 220,
        child: CustomPaint(
          painter: _SalesChartPainter(),
        ),
      ),
    );
  }
}

class _SalesChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = const Color(0xFFE7E2EC)
      ..strokeWidth = 1;

    final purple = Paint()
      ..color = const Color(0xFF633DE0)
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    final blue = Paint()
      ..color = const Color(0xFF9A8ADE)
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    for (int i = 1; i <= 4; i++) {
      final y = size.height - 25 - i * 35;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        axis,
      );
    }

    final bars = <double>[50, 82, 55, 100, 72, 110, 88, 116];

    for (int i = 0; i < bars.length; i++) {
      final x = 30 + i * 42.0;
      final base = size.height - 24;

      canvas.drawLine(
        Offset(x, base),
        Offset(x, base - bars[i]),
        purple,
      );

      canvas.drawLine(
        Offset(x + 11, base),
        Offset(x + 11, base - bars[i] * .62),
        blue,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TopProductsCard extends StatelessWidget {
  const _TopProductsCard();

  @override
  Widget build(BuildContext context) {
    const products = [
      ('Pizza Mexi - Coli Pizas', '24 499 / 2022', 'Actif'),
      ('CA-CCES 33CL', '34 667 902 224', 'Actif'),
      ('AG-FRT maison', 'S798902222466', 'Actif'),
      ('DS-FOND chocolat', '8997702446689', 'Actif'),
    ];

    return _Card(
      title: 'Top Selling Products',
      trailing: 'Voir tout',
      child: Column(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1ECFF),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(
                    Icons.fastfood_outlined,
                    size: 16,
                    color: Color(0xFF633DE0),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.$1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        product.$2,
                        style: const TextStyle(
                          fontSize: 8,
                          color: Color(0xFF85808C),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF8F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    product.$3,
                    style: const TextStyle(
                      fontSize: 7,
                      color: Color(0xFF28A962),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _RecentDocumentsCard extends StatelessWidget {
  const _RecentDocumentsCard();

  @override
  Widget build(BuildContext context) {
    const documents = [
      '3 dernières commandes',
      '13 nouveaux documents',
      '12 nouveaux documents',
    ];

    return _Card(
      title: 'Recent Documents',
      trailing: 'Voir tout',
      child: Column(
        children: documents.map((document) {
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.description_outlined,
              size: 17,
              color: Color(0xFF77727F),
            ),
            title: Text(
              document,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text(
              'Mis à jour récemment',
              style: TextStyle(fontSize: 8),
            ),
            trailing: const Icon(Icons.more_vert, size: 15),
          );
        }).toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String? trailing;
  final Widget child;

  const _Card({
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEAE6F1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              if (trailing != null)
                Text(
                  trailing!,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Color(0xFF77727F),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ModulePlaceholder extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ModulePlaceholder({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF0EBFF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF633DE0),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Cette section est prête à recevoir son interface.',
            style: TextStyle(
              color: Color(0xFF77727F),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}