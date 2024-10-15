import 'package:alcaldia_front/models/route_with_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../routes/route_detail_screen.dart'; // Para mostrar el detalle de la ruta

class SavedRoutesScreen extends ConsumerWidget {
  static const String link = '/savedRoutes';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // Asegúrate de envolver tu StreamBuilder en un Scaffold
      appBar: AppBar(
        title:
            Text('Rutas Guardadas'), // Puedes personalizar el título del AppBar
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('trayectos').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final routes = snapshot.data!.docs;

          if (routes.isEmpty) {
            return Center(child: Text('No hay rutas guardadas'));
          }

          return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              var routeData = routes[index].data() as Map<String, dynamic>;
              var puntos = routeData['lista_puntosgps'] as List<dynamic>;

              // Convertir los puntos a LatLng
              List<LatLng> routePoints = puntos.map((punto) {
                return LatLng(punto['latitud'], punto['longitud']);
              }).toList();

              String formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
                  .format(routeData['fecha_inicio'].toDate());

              return ListTile(
                title: Text('Ruta del $formattedDate'),
                subtitle: Text('Puntos: ${routePoints.length}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RouteDetailScreen(
                        route: RouteWithDate(
                          date: routeData['fecha_inicio'].toDate(),
                          routePoints: routePoints,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
