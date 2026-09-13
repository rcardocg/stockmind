/// ═════════════════════════════════════════════
/// FILE: constants.dart
/// PURPOSE: Constantes globales del sistema StockMind
/// STATUS: READY
/// NEXT PHASE: Cargar variables dinámicas desde .env en Fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ CONFIG / CONSTANTS     ║
// ╚════════════════════════╝

class AppConstants {
  AppConstants._();

  static const String APP_NAME = 'StockMind';
  static const String APP_VERSION = '1.0.0 (Fase 1 - Clean Arch)';
  static const int SOCKET_TIMEOUT = 30000; // milisegundos

  // Roles de usuario como constantes de referencia
  static const String ROLE_ADMIN = 'ADMIN';
  static const String ROLE_WAREHOUSE = 'WAREHOUSE';
  static const String ROLE_CLINIC = 'CLINIC';

  // URLs de endpoints (PLACEHOLDERS para Fase 2)
  // TODO: Conectar a Supabase en fase 2
  static const String SUPABASE_URL_PLACEHOLDER = 'https://placeholder.supabase.co';
  static const String SUPABASE_ANON_KEY_PLACEHOLDER = 'placeholder_anon_key';
}
