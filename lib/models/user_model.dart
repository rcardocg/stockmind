/// ═════════════════════════════════════════════
/// FILE: user_model.dart
/// PURPOSE: Modelo de datos para la entidad Usuario con soporte de roles
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar serialización toJson/fromJson con Supabase en Fase 2
/// ═════════════════════════════════════════════

import 'enums.dart';

// ╔════════════════════════╗
// ║ MODELS                 ║
// ╚════════════════════════╝

/// Entidad de Usuario del sistema StockMind
class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final UserRole role;
  final String? clinicId;
  final bool isActive;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.clinicId,
    this.isActive = true,
  }) {
    assert(id.isNotEmpty, 'El id no puede estar vacío');
    assert(email.isNotEmpty && email.contains('@'), 'Correo electrónico inválido');
    assert(firstName.isNotEmpty, 'El nombre no puede estar vacío');
    assert(lastName.isNotEmpty, 'El apellido no puede estar vacío');
  }

  String get fullName => '$firstName $lastName'.trim();

  // NOTE: toJson/fromJson serán conectados a Supabase en fase 2
  // TODO: Conectar a Supabase en fase 2
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      role: UserRole.values.firstWhere(
        (e) => e.name == (json['role'] as String?),
        orElse: () => UserRole.CLINIC,
      ),
      clinicId: json['clinic_id'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    // NOTE: Implementar mapeo completo a Supabase auth/public.users en fase 2
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'role': role.name,
      'clinic_id': clinicId,
      'is_active': isActive,
    };
  }
}
