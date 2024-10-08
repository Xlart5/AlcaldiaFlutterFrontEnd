import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> createUser(String userName, String password) async {
  final url = Uri.parse('http://localhost:3000/users');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userName': userName,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      print('Usuario creado exitosamente');
    } else {
      print('Error al crear usuario: ${response.body}');
    }
  } catch (error) {
    print('Error en la solicitud: $error');
  }
}