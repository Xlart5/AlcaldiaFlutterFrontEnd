import 'package:http/http.dart' as http;

Future<void> checkServerConnection() async {
  final url = Uri.parse(
      'http://192.168.56.1:3000/users'); // Cambia por la ruta de tu servidor.

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Conectado al servidor con éxito: ${response.body}');
    } else {
      print('Error al conectarse al servidor: ${response.statusCode}');
    }
  } catch (error) {
    print('Error en la solicitud: $error');
  }
}
