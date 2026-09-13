/// ═════════════════════════════════════════════
/// FILE: loading_placeholder.dart
/// PURPOSE: Indicador de carga reutilizable con mensaje configurable
/// STATUS: READY
/// NEXT PHASE: Integrar animaciones de shimmer o esqueletos en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';

// ╔════════════════════════╗
// ║ WIDGETS                ║
// ╚════════════════════════╝

/// Componente de carga visual reutilizable
class LoadingPlaceholder extends StatelessWidget {
  final String message;

  const LoadingPlaceholder({
    super.key,
    this.message = 'Cargando datos...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E3A8A)),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
