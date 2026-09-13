/// ═════════════════════════════════════════════
/// FILE: app_logger.dart
/// PURPOSE: Utilidad centralizada para registro y diagnóstico de logs
/// STATUS: READY
/// NEXT PHASE: Conectar con servicio de telemetría o crash reporting (Sentry/Crashlytics) en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';

// ╔════════════════════════╗
// ║ UTILS / LOGGER         ║
// ╚════════════════════════╝

class AppLogger {
  AppLogger._();

  /// Registro de información general
  static void log(String message) {
    debugPrint('[STOCKMIND] [INFO] $message');
  }

  /// Registro de errores críticos
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('[STOCKMIND] [ERROR] $message');
    if (error != null) {
      debugPrint('[STOCKMIND] [ERROR_DETAIL] $error');
    }
    if (stackTrace != null) {
      debugPrint('[STOCKMIND] [STACKTRACE] $stackTrace');
    }
  }

  /// Registro de advertencias
  static void warning(String message) {
    debugPrint('[STOCKMIND] [WARNING] $message');
  }
}
