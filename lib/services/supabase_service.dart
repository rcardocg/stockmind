/// ═════════════════════════════════════════════
/// FILE: supabase_service.dart
/// PURPOSE: Cliente y operaciones placeholder para conexión con Supabase Database
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Este archivo será reemplazado en fase 2 con client real de Supabase
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/appointment_model.dart';
import '../models/medicine_model.dart';
import '../models/patient_model.dart';

// ╔════════════════════════╗
// ║ SERVICES               ║
// ╚════════════════════════╝

/// Servicio de base de datos placeholder
/// NOTE: No realiza llamadas de red ni contiene datos sintéticos reales.
class SupabaseService {
  // TODO: Instanciar SupabaseClient en fase 2

  // ─────────────────────────────────────────
  // MEDICINES
  // ─────────────────────────────────────────
  Future<List<Medicine>> getMedicines() async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] getMedicines() → Conectar a tabla medicines');
    return [];
  }

  Future<void> insertMedicine(Medicine medicine) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] insertMedicine(${medicine.sku}) → Conectar a tabla medicines');
  }

  Future<void> updateMedicineStock(String id, int newStock) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] updateMedicineStock($id, $newStock) → Conectar a tabla medicines');
  }

  // ─────────────────────────────────────────
  // PATIENTS
  // ─────────────────────────────────────────
  Future<List<Patient>> getPatients(String clinicId) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] getPatients($clinicId) → Conectar a tabla patients');
    return [];
  }

  Future<void> insertPatient(Patient patient) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] insertPatient(${patient.name}) → Conectar a tabla patients');
  }

  Future<void> updatePatient(Patient patient) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] updatePatient(${patient.id}) → Conectar a tabla patients');
  }

  // ─────────────────────────────────────────
  // APPOINTMENTS
  // ─────────────────────────────────────────
  Future<List<Appointment>> getAppointments(String clinicId) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] getAppointments($clinicId) → Conectar a tabla appointments');
    return [];
  }

  Future<void> insertAppointment(Appointment appointment) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] insertAppointment(${appointment.id}) → Conectar a tabla appointments');
  }

  Future<void> updateAppointmentStatus(String id, String status) async {
    // TODO: Conectar a Supabase en fase 2
    debugPrint('[STOCKMIND] [SUPABASE_SERVICE] updateAppointmentStatus($id, $status) → Conectar a tabla appointments');
  }
}
