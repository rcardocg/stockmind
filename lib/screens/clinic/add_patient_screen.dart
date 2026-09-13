/// ═════════════════════════════════════════════
/// FILE: add_patient_screen.dart
/// PURPOSE: Pantalla para el registro de nuevos pacientes clínicos
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Formulario con campos clínicos y conexión a PatientRepository en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / CLINIC       ║
// ╚════════════════════════╝

class AddPatientScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: AddPatientScreen
  /// PURPOSE: Registrar un nuevo expediente de paciente
  /// ROLE: CLINIC
  /// ─────────────────────────────────────
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
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
      AppLogger.log('TODO: _loadData() → Cargar configuración clínica para alta de paciente');
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
        title: 'Registrar Paciente',
        role: UserRole.CLINIC,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : const Center(
                  child: Text(
                    '[Add Patient Placeholder]\nTODO: Implementar formulario (nombre, edad, teléfono, antecedentes) en fase 2',
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
