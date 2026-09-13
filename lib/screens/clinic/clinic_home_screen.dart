/// ═════════════════════════════════════════════
/// FILE: clinic_home_screen.dart
/// PURPOSE: Pantalla principal para el rol CLINIC (Atención clínica, pacientes y citas)
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar dashboard de citas del día y pacientes en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../navigation/route_names.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / CLINIC       ║
// ╚════════════════════════╝

class ClinicHomeScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: ClinicHomeScreen
  /// PURPOSE: Panel principal de la clínica
  /// ROLE: CLINIC
  /// ─────────────────────────────────────
  const ClinicHomeScreen({super.key});

  @override
  State<ClinicHomeScreen> createState() => _ClinicHomeScreenState();
}

class _ClinicHomeScreenState extends State<ClinicHomeScreen> {
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
      AppLogger.log('TODO: _loadData() → Cargar resumen de clínica');
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
        title: 'Módulo Clínico',
        role: UserRole.CLINIC,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            '[Clinic Home Placeholder]\nPanel de atención a pacientes y citas médicas.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: const Icon(Icons.people_alt_rounded, color: Color(0xFF0D9488)),
                        title: const Text('Directorio de Pacientes'),
                        subtitle: const Text('Ver expedientes y datos de contacto'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.PATIENTS_LIST),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.person_add_alt_1_rounded, color: Color(0xFF0D9488)),
                        title: const Text('Registrar Nuevo Paciente'),
                        subtitle: const Text('Añadir datos y antecedentes médicos'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.ADD_PATIENT),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.calendar_month_rounded, color: Color(0xFF0D9488)),
                        title: const Text('Gestión de Citas'),
                        subtitle: const Text('Agenda y estado de consultas'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.APPOINTMENTS),
                      ),
                    ],
                  ),
                ),
    );
  }
}
