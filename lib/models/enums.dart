/// ═════════════════════════════════════════════
/// FILE: enums.dart
/// PURPOSE: Definición centralizada de enumeradores del dominio StockMind
/// STATUS: READY
/// NEXT PHASE: Ampliar valores según necesidades del backend en Fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ ENUMS                  ║
// ╚════════════════════════╝

/// Roles de usuario con distintos niveles de acceso en la aplicación
enum UserRole {
  /// Acceso total al sistema, gestión de usuarios y clínicas
  ADMIN,

  /// Gestión de inventario de medicamentos, entradas, salidas y ajustes
  WAREHOUSE,

  /// Gestión de pacientes, historiales clínicos y programación de citas
  CLINIC,
}

/// Tipos de movimientos registrados en el inventario de medicamentos
enum MovementType {
  /// Entrada o reposición de stock al almacén
  ENTRY,

  /// Salida o despacho de medicamentos para atención
  EXIT,

  /// Ajuste manual por inventario físico, caducidad o mermas
  ADJUSTMENT,
}

/// Estados posibles de una cita médica
enum AppointmentStatus {
  /// Cita programada en espera de atención
  PENDING,

  /// Cita concluida con éxito
  COMPLETED,

  /// Cita cancelada por el paciente o la clínica
  CANCELLED,
}
