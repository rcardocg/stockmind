/// Interfaz base para el servicio de autenticación.
/// Aquí puedes implementar la integración futura con Firebase, Supabase, API REST, etc.
abstract class AuthService {
  Future<bool> login({required String email, required String password});
  Future<bool> recoverPassword({required String email});
  Future<void> logout();
}

/// Implementación simulada (Mock) para desarrollo.
/// No valida credenciales reales pero simula el flujo de autenticación.
class MockAuthService implements AuthService {
  @override
  Future<bool> login({required String email, required String password}) async {
    // Simula una breve latencia de red si se desea
    await Future.delayed(const Duration(milliseconds: 400));
    return true; // Acceso concedido directamente
  }

  @override
  Future<bool> recoverPassword({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return true; // Simula envío de correo exitoso
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
