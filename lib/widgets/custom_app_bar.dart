/// ═════════════════════════════════════════════
/// FILE: custom_app_bar.dart
/// PURPOSE: Barra de navegación superior con información de usuario, rol y acción de logout
/// STATUS: READY
/// NEXT PHASE: Conectar con sesión activa real y notificaciones en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../models/enums.dart';
import '../navigation/route_names.dart';

// ╔════════════════════════╗
// ║ WIDGETS                ║
// ╚════════════════════════╝

/// AppBar personalizada para todas las vistas principales de la aplicación
/// Muestra el título, el badge con el rol activo y permite cerrar sesión.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final UserRole? role;
  final VoidCallback? onLogout;

  const CustomAppBar({
    super.key,
    required this.title,
    this.role,
    this.onLogout,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _handleLogout(BuildContext context) {
    if (onLogout != null) {
      onLogout!();
      return;
    }

    // Comportamiento de logout por defecto: volver al Login
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.LOGIN,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          if (role != null)
            Text(
              'ROL: ${role!.name}',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
                letterSpacing: 0.5,
              ),
            ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Cerrar Sesión',
          icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
          onPressed: () => _handleLogout(context),
        ),
      ],
    );
  }
}
