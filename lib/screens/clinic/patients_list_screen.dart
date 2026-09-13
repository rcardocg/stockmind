/// ═════════════════════════════════════════════
/// FILE: patients_list_screen.dart
/// PURPOSE: Pantalla de listado y búsqueda de pacientes en la clínica
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con PatientRepository.getPatients() y PatientCard en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / CLINIC       ║
// ╚════════════════════════╝

class PatientsListScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: PatientsListScreen
  /// PURPOSE: Directorio de pacientes registrados
  /// ROLE: CLINIC
  /// ─────────────────────────────────────
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  // ╔═══════════════════════════════════════╗
  // ║ VARIABLES DE ESTADO
  // ╚═══════════════════════════════════════╝
  bool isLoading = false;
  String errorMessage = '';

  // ╔═══════════════════════════════════════╗
  // ║ LIFECYCLE
  // ╚═══════════════════════════════════════╝
  @override
  void initState() {
    super.initState();
    // TODO: Cargar datos en fase 2
    _loadData();
  }

  // ╔═══════════════════════════════════════╗
  // ║ MÉTODOS DE NEGOCIO
  // ╚═══════════════════════════════════════╝
  Future<void> _loadData() async {
    setState(() => isLoading = true);
    try {
      // TODO: Llamar repository aquí
      AppLogger.log('TODO: _loadData() → llamar PatientRepository.getPatients()');
    } catch (e) {
      setState(() => errorMessage = 'Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  // ╔═══════════════════════════════════════╗
  // ║ UI BUILD
  // ╚═══════════════════════════════════════╝
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Directorio de Pacientes',
        role: UserRole.CLINIC,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : const Center(
                  child: Text(
                    '[Patients List Placeholder]\nTODO: Renderizar PatientCard con datos de Supabase en fase 2',
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
