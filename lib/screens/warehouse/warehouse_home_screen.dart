/// ═════════════════════════════════════════════
/// FILE: warehouse_home_screen.dart
/// PURPOSE: Pantalla principal para el rol WAREHOUSE (Almacén e Inventario)
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar widgets de resumen de inventario y movimientos en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../navigation/route_names.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / WAREHOUSE    ║
// ╚════════════════════════╝

class WarehouseHomeScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: WarehouseHomeScreen
  /// PURPOSE: Panel principal de gestión de inventario y almacén
  /// ROLE: WAREHOUSE
  /// ─────────────────────────────────────
  const WarehouseHomeScreen({super.key});

  @override
  State<WarehouseHomeScreen> createState() => _WarehouseHomeScreenState();
}

class _WarehouseHomeScreenState extends State<WarehouseHomeScreen> {
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
      AppLogger.log('TODO: _loadData() → llamar MedicineRepository');
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
        title: 'Módulo Almacén',
        role: UserRole.WAREHOUSE,
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
                            '[Warehouse Home Placeholder]\nPanel de control para inventario de medicamentos.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: const Icon(Icons.medication_rounded, color: Color(0xFF1E3A8A)),
                        title: const Text('Catálogo de Medicamentos'),
                        subtitle: const Text('Ver lista y stock actual'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.MEDICINES_LIST),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.add_circle_outline, color: Color(0xFF1E3A8A)),
                        title: const Text('Registrar Nuevo Medicamento'),
                        subtitle: const Text('Añadir producto al inventario'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.ADD_MEDICINE),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.swap_horiz_rounded, color: Color(0xFF1E3A8A)),
                        title: const Text('Movimientos de Stock'),
                        subtitle: const Text('Entradas, salidas y ajustes'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () => Navigator.pushNamed(context, RouteNames.MOVEMENTS),
                      ),
                    ],
                  ),
                ),
    );
  }
}
