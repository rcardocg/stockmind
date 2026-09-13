/// ═════════════════════════════════════════════
/// FILE: auth_service.dart
/// PURPOSE: Definición e implementación placeholder del servicio de autenticación
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar a Supabase Auth en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

// ╔════════════════════════╗
// ║ SERVICES               ║
// ╚════════════════════════╝

/// Contrato abstracto para el servicio de autenticación
abstract class AuthService {
  /// Inicia sesión con correo y contraseña. Retorna el usuario o null si falla.
  Future<User?> login(String email, String password);

  /// Registra un nuevo usuario en el sistema.
  Future<User?> signup(
    String email,
    String password,
    String firstName,
    String lastName,
  );

  /// Cierra la sesión activa actual.
  Future<void> logout();

  /// Obtiene la sesión o usuario actualmente autenticado.
  Future<User?> getCurrentUser();
}

/// Implementación Placeholder del servicio de autenticación
/// NOTE: Esta implementación no realiza conexiones de red reales.
class AuthServiceImpl implements AuthService {
  @override
  Future<User?> login(String email, String password) async {
    // TODO: Conectar a Supabase Auth en fase 2
    debugPrint('[STOCKMIND] [AUTH_SERVICE] TODO: Conectar a Supabase Auth (login para $email)');
    return null;
  }

  @override
  Future<User?> signup(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    // TODO: Conectar a Supabase Auth en fase 2
    debugPrint('[STOCKMIND] [AUTH_SERVICE] TODO: Conectar a Supabase Auth (signup para $email)');
    return null;
  }

  @override
  Future<void> logout() async {
    // TODO: Conectar a Supabase Auth en fase 2
    debugPrint('[STOCKMIND] [AUTH_SERVICE] TODO: Conectar a Supabase Auth (logout)');
  }

  @override
  Future<User?> getCurrentUser() async {
    // TODO: Conectar a Supabase Auth en fase 2
    debugPrint('[STOCKMIND] [AUTH_SERVICE] TODO: Conectar a Supabase Auth (getCurrentUser)');
    return null;
  }
}
