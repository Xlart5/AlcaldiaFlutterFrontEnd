import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../models/route_with_date.dart';

import 'package:intl/intl.dart';

class RouteDetailScreen extends StatelessWidget {
  final RouteWithDate route;

  RouteDetailScreen({required this.route});

  @override
  Widget build(BuildContext context) {
    final MapController _mapController = MapController();
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(route.date);

    return Scaffold(
      appBar: AppBar(title: Text('Ruta del $formattedDate')),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: route.routePoints.first,
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: route.routePoints,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: route.routePoints.first,
                width: 30,
                height: 30,
                child: Icon(Icons.flag, color: Colors.green, size: 30),
              ),
              Marker(
                point: route.routePoints.last,
                width: 30,
                height: 30,
                child: Icon(Icons.flag, color: Colors.red, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
