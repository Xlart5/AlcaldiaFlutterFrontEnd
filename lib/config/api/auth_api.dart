import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthApi {
  static const String baseUrl =
      'https://mepath.onrender.com/users'; // Asegúrate de que la URL sea correcta

  // Método para iniciar sesión
  Future<void> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/login'); // Endpoint de login
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    // Log de la respuesta
    log("response status: ${response.statusCode}");
    log("response body: ${response.body}");
  }

  Future<void> crearUsuario(String email, String password) async {
    const String baseUrl = 'https://mepath.onrender.com/users';
    var url = Uri.parse(baseUrl);

    log('Iniciando registro...');

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "userName": email,
        "password": password,
      }),
    );

    // Log de la respuesta
    log("response status: ${response.statusCode}");
    log("response body: ${response.body}");
  }
}
