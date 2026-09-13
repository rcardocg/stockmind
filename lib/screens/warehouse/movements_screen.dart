/// ═════════════════════════════════════════════
/// FILE: movements_screen.dart
/// PURPOSE: Pantalla de registro e historial de movimientos de inventario (entradas, salidas, ajustes)
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar tabla medicine_movements con Supabase en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / WAREHOUSE    ║
// ╚════════════════════════╝

class MovementsScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: MovementsScreen
  /// PURPOSE: Historial y registro de entradas y salidas de stock
  /// ROLE: WAREHOUSE
  /// ─────────────────────────────────────
  const MovementsScreen({super.key});

  @override
  State<MovementsScreen> createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
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
      AppLogger.log('TODO: _loadData() → Cargar lista de movimientos');
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
        title: 'Movimientos de Stock',
        role: UserRole.WAREHOUSE,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : const Center(
                  child: Text(
                    '[Movements Placeholder]\nTODO: Implementar historial de entradas, salidas y ajustes de stock en fase 2',
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
