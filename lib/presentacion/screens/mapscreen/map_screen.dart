import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/navigation_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();

  // Mantén el resto del código anterior

  @override
  Widget build(BuildContext context) {
    final routePoints = ref.watch(navigationStateProvider).routePoints;
    final isTracking = ref.watch(navigationStateProvider).isTracking;

    // Establece el centro inicial y el zoom
    LatLng initialCenter = routePoints.isNotEmpty
        ? routePoints.last
        : LatLng(-17.375287, -66.158731);
    double initialZoom = 13.0;

    return Scaffold(
      appBar: AppBar(title: Text('Route Tracking')),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: initialCenter,
          initialZoom: initialZoom,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  routePoints.isNotEmpty ? routePoints.last.latitude : 50.5,
                  routePoints.isNotEmpty ? routePoints.last.longitude : 30.51,
                ),
                child: Container(
                  child: Icon(Icons.location_on, color: Colors.red, size: 30),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(navigationStateProvider.notifier).toggleTracking();
          if (isTracking && routePoints.isNotEmpty) {
            _mapController.move(routePoints.last, initialZoom);
          }
        },
        child: Icon(isTracking ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}
