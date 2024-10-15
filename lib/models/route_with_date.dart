import 'package:latlong2/latlong.dart';

class RouteWithDate {
  final DateTime date;
  final List<LatLng> routePoints;

  RouteWithDate({
    required this.date,
    required this.routePoints,
  });
}


