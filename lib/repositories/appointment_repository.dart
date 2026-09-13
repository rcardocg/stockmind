/// ═════════════════════════════════════════════
/// FILE: appointment_repository.dart
/// PURPOSE: Abstracción de repositorio para administración de citas médicas
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con tabla appointments y notificaciones en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/appointment_model.dart';
import '../services/supabase_service.dart';

// ╔════════════════════════╗
// ║ REPOSITORIES           ║
// ╚════════════════════════╝

/// Repositorio para la gestión de citas de pacientes
class AppointmentRepository {
  final SupabaseService _supabaseService;

  AppointmentRepository({SupabaseService? supabaseService})
      : _supabaseService = supabaseService ?? SupabaseService();

  Future<List<Appointment>> getAppointments(String clinicId) async {
    debugPrint('[STOCKMIND] [APPOINTMENT_REPOSITORY] Repository.getAppointments($clinicId) → [calling service]');
    return await _supabaseService.getAppointments(clinicId);
  }

  Future<void> addAppointment(Appointment appointment) async {
    debugPrint('[STOCKMIND] [APPOINTMENT_REPOSITORY] Repository.addAppointment(${appointment.id}) → [calling service]');
    await _supabaseService.insertAppointment(appointment);
  }

  Future<void> updateStatus(String id, String status) async {
    debugPrint('[STOCKMIND] [APPOINTMENT_REPOSITORY] Repository.updateStatus($id, $status) → [calling service]');
    await _supabaseService.updateAppointmentStatus(id, status);
  }
}
