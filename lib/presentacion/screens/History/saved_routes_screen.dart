import 'package:alcaldia_front/widgets/navigationbar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/index_navbar_provider.dart';
import '../../providers/navigation_provider.dart';

import 'package:intl/intl.dart';

import '../routes/route_detail_screen.dart'; // Para formatear fechas

class SavedRoutesScreen extends ConsumerWidget {
  static const String link = '/savedRoutes';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedRoutes = ref.read(navigationStateProvider.notifier).savedRoutes;
    final _page = ref.watch(pageIndexProvider);
    final _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();

    return Scaffold(
      bottomNavigationBar:
          curvednavbar(bottomNavigationKey: _bottomNavigationKey, page: _page),
      appBar: AppBar(title: Text('Rutas guardadas')),
      body: savedRoutes.isEmpty
          ? Center(child: Text('No hay rutas guardadas'))
          : ListView.builder(
              itemCount: savedRoutes.length,
              itemBuilder: (context, index) {
                final route = savedRoutes[index];
                String formattedDate =
                    DateFormat('yyyy-MM-dd – kk:mm').format(route.date);
                return ListTile(
                  title: Text('Ruta del $formattedDate'),
                  subtitle: Text('Puntos: ${route.routePoints.length}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteDetailScreen(route: route),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
