import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';


import '../../models/navigation_state.dart';

final navigationStateProvider = StateNotifierProvider<NavigationController, NavigationState>((ref) {
  return NavigationController();
});

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController() : super(NavigationState()) {
    _getCurrentLocation();
  }

  void toggleTracking() {
    if (state.isTracking) {
      stopTracking();
    } else {
      startTracking();
    }
  }

  void startTracking() {
    state = state.copyWith(isTracking: true);
    _getCurrentLocation();
  }

  void stopTracking() {
    state = state.copyWith(isTracking: false);
    // Detener la actualización de la ubicación aquí si es necesario
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, muestra un mensaje al usuario.
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        // Permisos denegados, muestra un mensaje al usuario.
        return;
      }
    }

    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      if (position != null) {
        state = state.copyWith(
          routePoints: [...state.routePoints, LatLng(position.latitude, position.longitude)],
        );
      }
    });
  }
}
