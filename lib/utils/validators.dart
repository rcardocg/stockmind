/// ═════════════════════════════════════════════
/// FILE: validators.dart
/// PURPOSE: Funciones para validación de formularios y campos del sistema
/// STATUS: READY
/// NEXT PHASE: Agregar validaciones de contraseñas complejas y regex clínico en Fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ UTILS / VALIDATORS     ║
// ╚════════════════════════╝

class Validators {
  Validators._();

  /// Valida el formato de una dirección de correo electrónico
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El correo electrónico es requerido';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Ingresa un correo electrónico válido';
    }
    return null;
  }

  /// Valida la longitud y presencia de la contraseña
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  /// Valida el código de inventario (SKU)
  static String? validateSku(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El código SKU es requerido';
    }
    if (value.trim().length < 3) {
      return 'El SKU debe contener al menos 3 caracteres alfanuméricos';
    }
    return null;
  }
}
