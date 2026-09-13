/// ═════════════════════════════════════════════
/// FILE: clinics_management_screen.dart
/// PURPOSE: Pantalla para administración de sedes y clínicas del sistema
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar tabla clinics con Supabase en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / ADMIN        ║
// ╚════════════════════════╝

class ClinicsManagementScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: ClinicsManagementScreen
  /// PURPOSE: Administración de sedes clínicas
  /// ROLE: ADMIN
  /// ─────────────────────────────────────
  const ClinicsManagementScreen({super.key});

  @override
  State<ClinicsManagementScreen> createState() => _ClinicsManagementScreenState();
}

class _ClinicsManagementScreenState extends State<ClinicsManagementScreen> {
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
      AppLogger.log('TODO: _loadData() → Cargar lista de clínicas');
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
        title: 'Gestión de Clínicas',
        role: UserRole.ADMIN,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : const Center(
                  child: Text(
                    '[Clinics Management Placeholder]\nTODO: Registrar y administrar sedes y sucursales en fase 2',
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
