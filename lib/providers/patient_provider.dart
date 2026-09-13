/// ═════════════════════════════════════════════
/// FILE: patient_provider.dart
/// PURPOSE: Notifier placeholder para el estado de gestión de pacientes
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con repositorio y persistencia en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/patient_model.dart';
import '../repositories/patient_repository.dart';

// ╔════════════════════════╗
// ║ PROVIDERS / STATE      ║
// ╚════════════════════════╝

/// Provider base de pacientes
class PatientProvider extends ChangeNotifier {
  final PatientRepository _patientRepository;

  List<Patient> _patients = [];
  bool _isLoading = false;
  String? _errorMessage;

  PatientProvider({PatientRepository? patientRepository})
      : _patientRepository = patientRepository ?? PatientRepository();

  List<Patient> get patients => _patients;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // TODO: Conectar a repositorio y base de datos en fase 2
  Future<void> fetchPatients(String clinicId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _patients = await _patientRepository.getPatients(clinicId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
