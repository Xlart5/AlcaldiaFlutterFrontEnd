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
          if (routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blue,
                ),
              ],
            ),
          if (routePoints.isNotEmpty)
            MarkerLayer(
              markers: [
                Marker(
                  point: routePoints.last,
                  width: 30,
                  height: 30,
                  child: Icon(Icons.location_on, color: Colors.red, size: 30),
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
