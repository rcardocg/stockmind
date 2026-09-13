/// ═════════════════════════════════════════════
/// FILE: admin_dashboard_screen.dart
/// PURPOSE: Panel de administración principal para el rol ADMIN
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar métricas globales del sistema y gestión de clínicas en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../navigation/route_names.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / ADMIN        ║
// ╚════════════════════════╝

class AdminDashboardScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: AdminDashboardScreen
  /// PURPOSE: Panel general de administración y control
  /// ROLE: ADMIN
  /// ─────────────────────────────────────
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
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
      AppLogger.log('TODO: _loadData() → Cargar métricas globales de administración');
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
        title: 'Panel Administrador',
        role: UserRole.ADMIN,
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
                            '[Admin Dashboard Placeholder]\nAcceso total para la gestión global de StockMind.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: const Icon(Icons.manage_accounts_rounded, color: Color(0xFF1E3A8A)),
                        title: const Text('Gestión de Usuarios'),
                        subtitle: const Text('Administrar cuentas y asignación de roles'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.USERS_MANAGEMENT),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.local_hospital_rounded, color: Color(0xFF1E3A8A)),
                        title: const Text('Gestión de Clínicas'),
                        subtitle: const Text('Sedes, configuración y sucursales'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.CLINICS_MANAGEMENT),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.warehouse_rounded, color: Color(0xFF1E3A8A)),
                        title: const Text('Vista Almacén (Acceso Admin)'),
                        subtitle: const Text('Supervisar módulo de inventario'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.WAREHOUSE_HOME),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.medical_services_rounded, color: Color(0xFF1E3A8A)),
                        title: const Text('Vista Clínica (Acceso Admin)'),
                        subtitle: const Text('Supervisar módulo clínico'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.CLINIC_HOME),
                      ),
                    ],
                  ),
                ),
    );
  }
}
