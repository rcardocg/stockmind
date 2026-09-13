/// ═════════════════════════════════════════════
/// FILE: patient_repository.dart
/// PURPOSE: Abstracción de repositorio para gestión de pacientes clínicos
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con base de datos de pacientes en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/patient_model.dart';
import '../services/supabase_service.dart';

// ╔════════════════════════╗
// ║ REPOSITORIES           ║
// ╚════════════════════════╝

/// Repositorio para la gestión clínica de pacientes
class PatientRepository {
  final SupabaseService _supabaseService;

  PatientRepository({SupabaseService? supabaseService})
      : _supabaseService = supabaseService ?? SupabaseService();

  Future<List<Patient>> getPatients(String clinicId) async {
    debugPrint('[STOCKMIND] [PATIENT_REPOSITORY] Repository.getPatients($clinicId) → [calling service]');
    return await _supabaseService.getPatients(clinicId);
  }

  Future<void> addPatient(Patient patient) async {
    debugPrint('[STOCKMIND] [PATIENT_REPOSITORY] Repository.addPatient(${patient.name}) → [calling service]');
    await _supabaseService.insertPatient(patient);
  }

  Future<void> updatePatient(Patient patient) async {
    debugPrint('[STOCKMIND] [PATIENT_REPOSITORY] Repository.updatePatient(${patient.id}) → [calling service]');
    await _supabaseService.updatePatient(patient);
  }
}
