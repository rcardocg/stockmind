/// ═════════════════════════════════════════════
/// FILE: route_names.dart
/// PURPOSE: Constantes centralizadas de nombres de rutas de la aplicación
/// STATUS: READY
/// NEXT PHASE: Añadir subrutas y argumentos tipados en Fase 2
/// ═════════════════════════════════════════

// ╔════════════════════════╗
// ║ ROUTE NAMES            ║
// ╚════════════════════════╝

class RouteNames {
  RouteNames._();

  // Auth Routes
  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';

  // Warehouse Module Routes
  static const String WAREHOUSE_HOME = '/warehouse/home';
  static const String MEDICINES_LIST = '/warehouse/medicines';
  static const String ADD_MEDICINE = '/warehouse/add-medicine';
  static const String MOVEMENTS = '/warehouse/movements';

  // Clinic Module Routes
  static const String CLINIC_HOME = '/clinic/home';
  static const String PATIENTS_LIST = '/clinic/patients';
  static const String ADD_PATIENT = '/clinic/add-patient';
  static const String APPOINTMENTS = '/clinic/appointments';
  static const String PATIENT_DETAIL = '/clinic/patient-detail';

  // Admin Module Routes
  static const String ADMIN_DASHBOARD = '/admin/dashboard';
  static const String USERS_MANAGEMENT = '/admin/users';
  static const String CLINICS_MANAGEMENT = '/admin/clinics';
}
