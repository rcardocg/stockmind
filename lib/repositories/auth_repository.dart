/// ═════════════════════════════════════════════
/// FILE: auth_repository.dart
/// PURPOSE: Abstracción y repositorio de autenticación
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Inserta aquí lógica de negocio antes de llamar service
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

// ╔════════════════════════╗
// ║ REPOSITORIES           ║
// ╚════════════════════════╝

/// Repositorio encargado de orquestar la autenticación de usuarios
class AuthRepository {
  final AuthService _authService;

  AuthRepository({AuthService? authService})
      : _authService = authService ?? AuthServiceImpl();

  /// Inserta aquí lógica de negocio antes de llamar service
  Future<User?> login(String email, String password) async {
    debugPrint('[STOCKMIND] [AUTH_REPOSITORY] login() → [calling service: $email]');
    // TODO: Agregar validaciones de negocio antes de llamar al servicio
    return await _authService.login(email, password);
  }

  Future<User?> signup(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    debugPrint('[STOCKMIND] [AUTH_REPOSITORY] signup() → [calling service: $email]');
    return await _authService.signup(email, password, firstName, lastName);
  }

  Future<void> logout() async {
    debugPrint('[STOCKMIND] [AUTH_REPOSITORY] logout() → [calling service]');
    await _authService.logout();
  }

  Future<User?> getCurrentUser() async {
    debugPrint('[STOCKMIND] [AUTH_REPOSITORY] getCurrentUser() → [calling service]');
    return await _authService.getCurrentUser();
  }
}
