import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../models/navigation_state.dart';
import '../../models/route_with_date.dart';

import 'package:latlong2/latlong.dart';

final navigationStateProvider =
    StateNotifierProvider<NavigationController, NavigationState>((ref) {
  return NavigationController();
});

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController() : super(NavigationState());

  final List<RouteWithDate> savedRoutes = []; // Lista para guardar rutas
  StreamSubscription<Position>? _positionStream;

  void toggleTracking() {
    if (state.isTracking) {
      stopTracking();
    } else {
      startTracking();
    }
  }

  void startTracking() async {
    state = state.copyWith(isTracking: true);

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, muestra un mensaje al usuario.
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permisos denegados, muestra un mensaje al usuario.
        return;
      }
    }

    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      if (position != null && state.isTracking) {
        state = state.copyWith(
          routePoints: [
            ...state.routePoints,
            LatLng(position.latitude, position.longitude)
          ],
          lastPositionUpdate: DateTime.now(),
        );

        // Lógica para pausa de más de 5 minutos
        if (DateTime.now()
                .difference(state.lastPositionUpdate)
                .inMinutes >=
            5) {
          // Aquí puedes agregar lógica para puntos de pausa
        }
      }
    });
  }

  void stopTracking() {
    state = state.copyWith(isTracking: false);
    _positionStream?.cancel();

    if (state.routePoints.isNotEmpty) {
      // Guarda la ruta en la lista de rutas
      savedRoutes.add(
        RouteWithDate(
          date: DateTime.now(),
          routePoints: List.from(state.routePoints),
        ),
      );
      state = state.copyWith(routePoints: []); // Resetea la ruta actual
    }
  }
}
