/// ═════════════════════════════════════════════
/// FILE: app_config.dart
/// PURPOSE: Parámetros de entorno y configuración global de ejecución
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Inyectar desde variables de entorno o archivo de flavors en Fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ CONFIG                 ║
// ╚════════════════════════╝

/// Contenedor de configuración global de la aplicación
class AppConfig {
  final bool isProduction;
  final String logLevel;
  final String apiBaseUrl;

  const AppConfig({
    this.isProduction = false,
    this.logLevel = 'DEBUG',
    this.apiBaseUrl = 'https://api.placeholder.stockmind.io',
  });

  // TODO: Configurar inyección de dependencias y flavours (dev, staging, prod) en fase 2
}
