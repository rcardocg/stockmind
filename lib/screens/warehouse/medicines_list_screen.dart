/// ═════════════════════════════════════════════
/// FILE: medicines_list_screen.dart
/// PURPOSE: Pantalla de listado y filtrado de medicamentos en almacén
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con MedicineRepository.getMedicines() y MedicineCard en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../utils/app_logger.dart';
import '../../widgets/custom_app_bar.dart';

// ╔════════════════════════╗
// ║ SCREENS / WAREHOUSE    ║
// ╚════════════════════════╝

class MedicinesListScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: MedicinesListScreen
  /// PURPOSE: Listado y búsqueda de medicamentos
  /// ROLE: WAREHOUSE
  /// ─────────────────────────────────────
  const MedicinesListScreen({super.key});

  @override
  State<MedicinesListScreen> createState() => _MedicinesListScreenState();
}

class _MedicinesListScreenState extends State<MedicinesListScreen> {
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
      AppLogger.log('TODO: _loadData() → llamar MedicineRepository.getMedicines()');
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
        title: 'Lista de Medicamentos',
        role: UserRole.WAREHOUSE,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : const Center(
                  child: Text(
                    '[Medicines List Placeholder]\nTODO: Renderizar MedicineCard con datos de Supabase en fase 2',
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
