/// ═════════════════════════════════════════════
/// FILE: bottom_nav_bar.dart
/// PURPOSE: Barra de navegación inferior reutilizable para módulos
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar índices con navegación por pestañas de cada módulo en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';

// ╔════════════════════════╗
// ║ WIDGETS                ║
// ╚════════════════════════╝

/// Barra inferior placeholder para módulos de Warehouse y Clinic
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF1E3A8A),
      unselectedItemColor: const Color(0xFF94A3B8),
      items: items,
    );
  }
}
