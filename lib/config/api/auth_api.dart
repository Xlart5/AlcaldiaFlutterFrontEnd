import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  static const String baseUrl =
      'http://192.168.56.1:3000/users'; // Asegúrate de que la URL sea correcta

  // Método para crear un nuevo usuario
  Future<Map<String, dynamic>> createUser(
      String userName, String password) async {
    final url = Uri.parse(baseUrl); // Endpoint para crear un usuario
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userName': userName,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body); // Retorna la respuesta si es exitosa
    } else {
      throw Exception('Error al crear el usuario');
    }
  }

  // Método para iniciar sesión
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login'); // Endpoint de login
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retorna la respuesta si es exitosa
    } else {
      throw Exception('Error en el inicio de sesión');
    }
  }

  // Método para registrarse
  Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse(baseUrl); // Endpoint de registro
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body); // Retorna la respuesta si es exitosa
    } else {
      throw Exception('Error en el registro');
    }
  }
}
