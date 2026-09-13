/// ═════════════════════════════════════════════
/// FILE: auth_provider.dart
/// PURPOSE: Notifier placeholder para el manejo de estado global de autenticación
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Implementar con Riverpod / BLoC / ChangeNotifier en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/foundation.dart';
import '../models/enums.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

// ╔════════════════════════╗
// ║ PROVIDERS / STATE      ║
// ╚════════════════════════╝

/// Provider base de autenticación
/// NOTE: Placeholder sin dependencias externas (utiliza ChangeNotifier base de Flutter).
class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  AuthProvider({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository();

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserRole? get currentRole => _currentUser?.role;

  // TODO: Conectar a Supabase Auth y persistencia de sesión en fase 2
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _authRepository.login(email, password);
      _currentUser = user;
      return user != null;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    await _authRepository.logout();
    _currentUser = null;
    _isLoading = false;
    notifyListeners();
  }
}
