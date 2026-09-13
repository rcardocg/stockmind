/// ═════════════════════════════════════════════
/// FILE: extensions.dart
/// PURPOSE: Extensiones de conveniencia para tipos de datos de Dart
/// STATUS: READY
/// NEXT PHASE: Agregar formateadores monetarios y de localización en Fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ UTILS / EXTENSIONS     ║
// ╚════════════════════════╝

/// Extensiones útiles sobre [String]
extension StringExtensions on String {
  /// Retorna true si la cadena cumple con el formato básico de email
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(trim());
  }

  /// Capitaliza la primera letra de la cadena
  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

/// Extensiones útiles sobre [DateTime]
extension DateTimeExtensions on DateTime {
  /// Retorna la fecha en formato legible DD/MM/YYYY
  String get formattedDate {
    final dayStr = day.toString().padLeft(2, '0');
    final monthStr = month.toString().padLeft(2, '0');
    return '$dayStr/$monthStr/$year';
  }

  /// Retorna la fecha y hora en formato DD/MM/YYYY HH:MM
  String get formattedDateTime {
    final dayStr = day.toString().padLeft(2, '0');
    final monthStr = month.toString().padLeft(2, '0');
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$dayStr/$monthStr/$year $hourStr:$minuteStr';
  }
}
