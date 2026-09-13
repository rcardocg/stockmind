/// ═════════════════════════════════════════════
/// FILE: main.dart
/// PURPOSE: Punto de entrada principal de la aplicación StockMind
/// STATUS: READY (Fase 1 - Clean Architecture Base)
/// NEXT PHASE: Conectar inicialización de Supabase, inyección de dependencias y GoRouter en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'navigation/app_router.dart';
import 'navigation/route_names.dart';

void main() {
  // ┌─────────────────────────────────────┐
  // │ STOCKMIND - ENTRY POINT             │
  // │ Status: Fase 1 - Estructura Base    │
  // │ Fase 2: Conectar Supabase + Auth    │
  // └─────────────────────────────────────┘

  runApp(const StockMindApp());
}

class StockMindApp extends StatelessWidget {
  const StockMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockMind',
      theme: AppTheme.lightTheme(),
      // TODO: Reemplazar con GoRouter en fase 2
      initialRoute: RouteNames.LOGIN,
      routes: AppRouter.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
