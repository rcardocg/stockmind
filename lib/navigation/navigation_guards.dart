/// ═════════════════════════════════════════════
/// FILE: navigation_guards.dart
/// PURPOSE: Guardias de navegación para protección de rutas según rol y sesión
/// STATUS: PLACEHOLDER
/// NEXT PHASE: En fase 2, validar permisos por role contra el estado de sesión real
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/enums.dart';

// ╔════════════════════════╗
// ║ NAVIGATION GUARDS      ║
// ╚════════════════════════╝

/// Controla el acceso a rutas protegidas según el rol del usuario
class AuthGuard {
  /// Valida si el rol actual puede acceder a la ruta especificada
  /// NOTE: Actualmente retorna true como placeholder para permitir navegación durante desarrollo.
  static bool canNavigate(String route, UserRole? userRole) {
    debugPrint('[STOCKMIND] [AUTH_GUARD] Validando acceso a $route con rol: ${userRole?.name ?? 'SIN_ROL'}');

    // TODO: En fase 2, validar permisos por role:
    // - ADMIN: Acceso completo
    // - WAREHOUSE: Acceso solo a rutas que inicien con /warehouse
    // - CLINIC: Acceso solo a rutas que inicien con /clinic

    return true; // Placeholder
  }
}
