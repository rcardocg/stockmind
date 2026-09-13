/// ═════════════════════════════════════════════
/// FILE: medicine_provider.dart
/// PURPOSE: Notifier placeholder para el estado de inventario de medicamentos
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Implementar manejo de estado reactivo y caché en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/medicine_model.dart';
import '../repositories/medicine_repository.dart';

// ╔════════════════════════╗
// ║ PROVIDERS / STATE      ║
// ╚════════════════════════╝

/// Provider base de inventario
class MedicineProvider extends ChangeNotifier {
  final MedicineRepository _medicineRepository;

  List<Medicine> _medicines = [];
  bool _isLoading = false;
  String? _errorMessage;

  MedicineProvider({MedicineRepository? medicineRepository})
      : _medicineRepository = medicineRepository ?? MedicineRepository();

  List<Medicine> get medicines => _medicines;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // TODO: Conectar a repositorio y base de datos en fase 2
  Future<void> fetchMedicines() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _medicines = await _medicineRepository.getMedicines();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
