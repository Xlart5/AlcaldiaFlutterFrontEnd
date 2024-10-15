import 'package:alcaldia_front/firebase/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_auth/firebase_auth.dart';

// Provider global para el servicio de autenticación
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

// Estado para indicar si el usuario está autenticado o no
final isAuthenticatedProvider = StateProvider<bool>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.getCurrentUser() != null; // True si hay un usuario
});

// Estado para almacenar el mensaje de error
final authErrorProvider = StateProvider<String?>((ref) => null);

// Estado del usuario actual (puede ser nulo si no está autenticado)
final currentUserProvider = StateProvider<User?>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.getCurrentUser();
});
