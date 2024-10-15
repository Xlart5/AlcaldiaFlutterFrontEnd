import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

Future<void> crearTrayecto(String tipodetransporte, List<LatLng> puntos) async {
  // Referencia a la colección 'trayectos'
  CollectionReference trayectos = FirebaseFirestore.instance.collection('trayectos');

  // Convertir la lista de LatLng a un formato adecuado para Firestore
  List<Map<String, double>> listaPuntosGps = puntos.map((punto) {
    return {
      'latitud': punto.latitude,
      'longitud': punto.longitude,
    };
  }).toList();

  // Datos que se van a almacenar
  Map<String, dynamic> data = {
    'tipodetransporte': tipodetransporte,
    'lista_puntosgps': listaPuntosGps,
    'fecha_inicio': DateTime.now(), // Fecha y hora actuales
    'fecha_fin': DateTime.now().add(Duration(hours: 1)) // Simulación de un trayecto de 1 hora
  };

  // Agregar el documento a la colección 'trayectos'
  try {
    await trayectos.add(data);
    print('Trayecto añadido correctamente.');
  } catch (e) {
    print('Error al añadir el trayecto: $e');
  }
}