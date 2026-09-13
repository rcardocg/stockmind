/// ═════════════════════════════════════════════
/// FILE: app_router.dart
/// PURPOSE: Configuración central del enrutador de la aplicación y navegación por rol
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Migrar a GoRouter o rutas dinámicas protegidas por role en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../models/enums.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/clinics_management_screen.dart';
import '../screens/admin/users_management_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/clinic/add_patient_screen.dart';
import '../screens/clinic/appointments_screen.dart';
import '../screens/clinic/clinic_home_screen.dart';
import '../screens/clinic/patient_detail_screen.dart';
import '../screens/clinic/patients_list_screen.dart';
import '../screens/warehouse/add_medicine_screen.dart';
import '../screens/warehouse/medicines_list_screen.dart';
import '../screens/warehouse/movements_screen.dart';
import '../screens/warehouse/warehouse_home_screen.dart';
import 'route_names.dart';

// ╔════════════════════════╗
// ║ ROUTER CONFIG          ║
// ╚════════════════════════╝

class AppRouter {
  AppRouter._();

  /// Retorna la ruta inicial post-login según el rol del usuario
  static String getHomeRouteForRole(UserRole role) {
    switch (role) {
      case UserRole.ADMIN:
        return RouteNames.ADMIN_DASHBOARD;
      case UserRole.WAREHOUSE:
        return RouteNames.WAREHOUSE_HOME;
      case UserRole.CLINIC:
        return RouteNames.CLINIC_HOME;
    }
  }

  /// Mapa de rutas de la aplicación
  // NOTE: Rutas dinámicas por role se agregarán en fase 2
  static Map<String, WidgetBuilder> get routes => {
        // Auth
        RouteNames.LOGIN: (context) => const LoginScreen(),
        RouteNames.SIGNUP: (context) => const SignupScreen(),

        // Warehouse
        RouteNames.WAREHOUSE_HOME: (context) => const WarehouseHomeScreen(),
        RouteNames.MEDICINES_LIST: (context) => const MedicinesListScreen(),
        RouteNames.ADD_MEDICINE: (context) => const AddMedicineScreen(),
        RouteNames.MOVEMENTS: (context) => const MovementsScreen(),

        // Clinic
        RouteNames.CLINIC_HOME: (context) => const ClinicHomeScreen(),
        RouteNames.PATIENTS_LIST: (context) => const PatientsListScreen(),
        RouteNames.ADD_PATIENT: (context) => const AddPatientScreen(),
        RouteNames.APPOINTMENTS: (context) => const AppointmentsScreen(),
        RouteNames.PATIENT_DETAIL: (context) => const PatientDetailScreen(),

        // Admin
        RouteNames.ADMIN_DASHBOARD: (context) => const AdminDashboardScreen(),
        RouteNames.USERS_MANAGEMENT: (context) => const UsersManagementScreen(),
        RouteNames.CLINICS_MANAGEMENT: (context) => const ClinicsManagementScreen(),
      };
}
