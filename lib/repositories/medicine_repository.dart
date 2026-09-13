/// ═════════════════════════════════════════════
/// FILE: medicine_repository.dart
/// PURPOSE: Abstracción de repositorio para gestión de medicamentos e inventario
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con SupabaseService y lógica de alertas de stock en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/medicine_model.dart';
import '../services/supabase_service.dart';

// ╔════════════════════════╗
// ║ REPOSITORIES           ║
// ╚════════════════════════╝

/// Repositorio para operaciones de inventario de medicamentos
class MedicineRepository {
  final SupabaseService _supabaseService;

  MedicineRepository({SupabaseService? supabaseService})
      : _supabaseService = supabaseService ?? SupabaseService();

  /// Obtiene el catálogo completo de medicamentos
  Future<List<Medicine>> getMedicines() async {
    debugPrint('[STOCKMIND] [MEDICINE_REPOSITORY] Repository.getMedicines() → [calling service]');
    return await _supabaseService.getMedicines();
  }

  /// Registra un nuevo medicamento en el inventario
  Future<void> addMedicine(Medicine medicine) async {
    debugPrint('[STOCKMIND] [MEDICINE_REPOSITORY] Repository.addMedicine(${medicine.sku}) → [calling service]');
    await _supabaseService.insertMedicine(medicine);
  }

  /// Actualiza las existencias de un medicamento
  Future<void> updateStock(String id, int newStock) async {
    debugPrint('[STOCKMIND] [MEDICINE_REPOSITORY] Repository.updateStock($id, $newStock) → [calling service]');
    await _supabaseService.updateMedicineStock(id, newStock);
  }
}
