/// ═════════════════════════════════════════════
/// FILE: login_screen.dart
/// PURPOSE: Pantalla de inicio de sesión con selección de rol y redirección modular
/// STATUS: READY
/// NEXT PHASE: Conectar autenticación con Supabase Auth en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../models/enums.dart';
import '../../navigation/app_router.dart';
import '../../navigation/route_names.dart';
import '../../utils/app_logger.dart';

// ╔════════════════════════╗
// ║ SCREENS / AUTH         ║
// ╚════════════════════════╝

class LoginScreen extends StatefulWidget {
  /// ─────────────────────────────────────
  /// SCREEN: LoginScreen
  /// PURPOSE: Inicio de sesión y enrutamiento por rol
  /// ROLE: PÚBLICO (Pre-login)
  /// ─────────────────────────────────────
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ╔═══════════════════════════════════════╗
  // ║ VARIABLES DE ESTADO
  // ╚═══════════════════════════════════════╝
  bool isLoading = false;
  String errorMessage = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  UserRole _selectedRole = UserRole.ADMIN; // Rol simulado para redirección modular

  // ╔═══════════════════════════════════════╗
  // ║ LIFECYCLE
  // ╚═══════════════════════════════════════╝
  @override
  void initState() {
    super.initState();
    // TODO: Cargar datos en fase 2 (sesión previa en storage)
    _loadData();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ╔═══════════════════════════════════════╗
  // ║ MÉTODOS DE NEGOCIO
  // ╚═══════════════════════════════════════╝
  Future<void> _loadData() async {
    setState(() => isLoading = true);
    try {
      // TODO: Llamar repository aquí
      AppLogger.log('TODO: _loadData() → llamar AuthRepository.getCurrentUser()');
    } catch (e) {
      setState(() => errorMessage = 'Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _handleLogin() async {
    FocusScope.of(context).unfocus();
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      // NOTE: En Fase 1 no hay verificación con BD real.
      // Se simula la autenticación y se redirecciona según el rol seleccionado.
      AppLogger.log('TODO: _handleLogin() → llamar AuthRepository.login()');
      await Future.delayed(const Duration(milliseconds: 300));

      if (!mounted) return;

      // Redirección al Home según el rol
      final destinationRoute = AppRouter.getHomeRouteForRole(_selectedRole);
      Navigator.pushReplacementNamed(context, destinationRoute);
    } catch (e) {
      setState(() => errorMessage = 'Error al iniciar sesión: $e');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _handleForgotPassword() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Recuperar Contraseña'),
        content: const Text(
          'Se ha enviado una solicitud de restablecimiento.\n(Placeholder para Fase 2 con Supabase Auth)',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  // ╔═══════════════════════════════════════╗
  // ║ UI BUILD
  // ╚═══════════════════════════════════════╝
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      const Center(
                        child: Column(
                          children: [
                            Icon(Icons.inventory_2_rounded, size: 48, color: Color(0xFF1E3A8A)),
                            SizedBox(height: 12),
                            Text(
                              'StockMind',
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Gestión Modular de Almacén y Clínica',
                              style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      if (errorMessage.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            errorMessage,
                            style: TextStyle(color: Colors.red.shade800, fontSize: 13),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Campos de inicio de sesión
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Correo Electrónico',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() => _obscurePassword = !_obscurePassword);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Selector de rol simulado (para probar navegación por rol en Fase 1)
                      InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Ingresar con Rol (Simulación Fase 1)',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<UserRole>(
                            value: _selectedRole,
                            isExpanded: true,
                            items: UserRole.values.map((role) {
                              return DropdownMenuItem(
                                value: role,
                                child: Text('Rol: ${role.name}'),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) setState(() => _selectedRole = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _handleForgotPassword,
                          child: const Text('¿Olvidaste tu contraseña?'),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Botón Login
                      ElevatedButton(
                        onPressed: isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('Iniciar Sesión', style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(height: 12),

                      // Registro placeholder
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿No tienes cuenta?', style: TextStyle(fontSize: 13)),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, RouteNames.SIGNUP),
                            child: const Text('Regístrate', style: TextStyle(fontSize: 13)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
