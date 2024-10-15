import 'package:alcaldia_front/firebase/map_services.dart';
import 'package:alcaldia_front/presentacion/providers/map_provider.dart';
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
    final _mapControler = ref.watch(mapcontroller);
    final _selectionmovility = ref.watch(selectionprovider);

    // Establece el centro inicial y el zoom
    LatLng initialCenter = routePoints.isNotEmpty
        ? routePoints.last
        : LatLng(-17.375287, -66.158731);
    double initialZoom = 13.0;

    return Scaffold(
      body: FlutterMap(
        mapController: _mapControler,
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
          !isTracking
              ? (showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      child: _seleccionTransporte(),
                    );
                  },
                ))
              : ref.read(navigationStateProvider.notifier).toggleTracking();
          if (isTracking && routePoints.isNotEmpty) {
            _mapControler.move(routePoints.last, initialZoom);
          }
          ;
         
        },
        child: Icon(isTracking ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}

class _seleccionTransporte extends ConsumerWidget {
  const _seleccionTransporte({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final _selectionmovility = ref.watch(selectionprovider);
    final carselect = "automovil";
    final runselect = "caminar";
    final bikeselect = "motocicleta";
    final routePoints = ref.watch(navigationStateProvider).routePoints;
    final isTracking = ref.watch(navigationStateProvider).isTracking;
    final _mapControler = ref.watch(mapcontroller);

    // Establece el centro inicial y el zoom
    LatLng initialCenter = routePoints.isNotEmpty
        ? routePoints.last
        : LatLng(-17.375287, -66.158731);
    double initialZoom = 13.0;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Selecciona el tipo de transporte"),
          Text(
            _selectionmovility,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(selectionprovider.notifier).update(
                        (state) => runselect,
                      );
                },
                icon: Icon(
                  Icons.run_circle_outlined,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(selectionprovider.notifier).update(
                        (state) => bikeselect,
                      );
                },
                icon: Icon(Icons.pedal_bike_outlined, size: 50),
              ),
              IconButton(
                onPressed: () {
                  ref.read(selectionprovider.notifier).update(
                        (state) => carselect,
                      );
                },
                icon: Icon(Icons.directions_car_outlined, size: 50),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          FloatingActionButton(
              onPressed: () {
                ref.read(navigationStateProvider.notifier).toggleTracking();
                if (isTracking && routePoints.isNotEmpty) {
                  _mapControler.move(routePoints.last, initialZoom);
                }

                Navigator.pop(context);
              },
              child: Icon(Icons.check))
        ],
      ),
    );
  }
}
