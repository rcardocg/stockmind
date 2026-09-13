/// ═════════════════════════════════════════════
/// FILE: signup_screen.dart
/// PURPOSE: Pantalla de registro de nuevos usuarios
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con Supabase Auth signup y registro en tabla public.users en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../utils/app_logger.dart';

// ╔════════════════════════╗
// ║ SCREENS / AUTH         ║
// ╚════════════════════════╝

class SignupScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: SignupScreen
  /// PURPOSE: Registro de nuevas cuentas en el sistema
  /// ROLE: PÚBLICO (Pre-login)
  /// ─────────────────────────────────────
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
      AppLogger.log('TODO: _loadData() → llamar AuthRepository');
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
      appBar: AppBar(title: const Text('Registro de Usuario')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : const Center(
                  child: Text(
                    '[Signup Placeholder]\nTODO: Implementar UI en fase 2 con Supabase Auth',
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
