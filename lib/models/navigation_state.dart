import 'package:latlong2/latlong.dart';

class NavigationState {
  final List<LatLng> routePoints;
  final bool isTracking;
  final DateTime lastPositionUpdate;

  NavigationState({
    this.routePoints = const [],
    this.isTracking = false,
    DateTime? lastPositionUpdate,
  }) : lastPositionUpdate = lastPositionUpdate ?? DateTime.now();

  NavigationState copyWith({
    List<LatLng>? routePoints,
    bool? isTracking,
    DateTime? lastPositionUpdate,
  }) {
    return NavigationState(
      routePoints: routePoints ?? this.routePoints,
      isTracking: isTracking ?? this.isTracking,
      lastPositionUpdate: lastPositionUpdate ?? this.lastPositionUpdate,
    );
  }
}