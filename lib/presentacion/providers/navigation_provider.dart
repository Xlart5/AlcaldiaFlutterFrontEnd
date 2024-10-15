import 'dart:async';
import 'package:alcaldia_front/firebase/map_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../models/navigation_state.dart';
import '../../models/route_with_date.dart';
import 'package:latlong2/latlong.dart';

final navigationStateProvider =
    StateNotifierProvider<NavigationController, NavigationState>((ref) {
  return NavigationController(ref); // Pasar el ref aquí
});

final selectionprovider = StateProvider((ref) => "");

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController(this._ref) : super(NavigationState());

  final Ref _ref; // Usar Ref para acceder a otros providers
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
        if (DateTime.now().difference(state.lastPositionUpdate).inMinutes >=
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
      // Obtén el valor actual del selection provider
      final selectedValue =
          _ref.read(selectionprovider); // Acceder al estado actual

      // Guarda la ruta en Firebase usando el valor actual
      crearTrayecto(selectedValue, state.routePoints);

      // Guarda la ruta localmente en la lista de rutas
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
