# ═════════════════════════════════════════════════════════════════════
# REGLAS GENERALES Y DIRECTRICES DE DESARROLLO - STOCKMIND
# ═════════════════════════════════════════════════════════════════════

Este documento establece las reglas obligatorias de contexto, restricciones y arquitectura para cualquier intervención de un AI Assistant en el proyecto **StockMind**. Debe leerse y respetarse antes de realizar cualquier cambio en el código.

---

## 1. ROL DEL ASISTENTE Y PROHIBICIÓN DE LÓGICA DE NEGOCIO

> [!IMPORTANT]
> **LA IA NO PUEDE IMPLEMENTAR LÓGICA DE NEGOCIO PROPIA.**
> - El asistente **NO** debe inventar reglas de negocio, algoritmos de cálculo de inventario, políticas de descuento, fórmulas de stock crítico arbitrarias ni flujos clínicos no especificados.
> - El rol del asistente es **estructural y arquitectónico**: definir interfaces abstractas, contratos de datos, modelos, repositorios intermediarios, widgets reutilizables y pantallas con placeholders visuales.
> - La lógica de negocio real, validaciones complejas de dominio y conexiones a bases de datos serán especificadas e implementadas en fases posteriores por el usuario o bajo sus instrucciones exactas.

---

## 2. RESTRICCIONES CRÍTICAS (LO QUE NO SE PUEDE TOCAR NI HACER)

❌ **ESTRICATAMENTE PROHIBIDO:**
1. **Comandos de terminal:**
   - **NUNCA** ejecutar comandos en la terminal (`flutter pub get`, `flutter run`, comandos bash, git, etc.).
2. **Datos sintéticos o hardcodeados:**
   - **NO** inventar datos de prueba falsos o mock data dentro del código.
   - Usar siempre estructuras vacías (`[]`), valores por defecto o `null` con logs explicativos.
3. **Modificación de dependencias:**
   - **NO** modificar `pubspec.yaml`, `pubspec.lock` ni agregar paquetes externos sin permiso explícito.
   - Usar únicamente lo incluido en el SDK base de Flutter (`flutter/material.dart`, `flutter/cupertino.dart`, `ChangeNotifier`).
4. **Conexiones a servicios externos o bases de datos:**
   - **NO** realizar llamadas a APIs externas ni inicializar clientes reales de Supabase/Firebase. Todos los servicios deben ser **placeholders**.
5. **Ejecución de pruebas o builds:**
   - **NO** disparar comandos de testeo automatizado por consola.

---

## 3. PERMISOS Y ALCANCE (LO QUE SÍ SE PUEDE HACER)

✅ **PERMITIDO:**
- Crear y editar archivos `.dart` dentro de `lib/` respetando la arquitectura Clean Architecture.
- Crear clases abstractas, contratos, repositorios y modelos con serializadores placeholder (`toJson`/`fromJson`).
- Crear componentes visuales reutilizables y pantallas con manejo de estados estándar (`isLoading`, `errorMessage`, `_loadData()`).
- Documentar con comentarios claros (`// TODO:`, `// NOTE:`) qué se conectará en fases posteriores.
- Mantener y actualizar la documentación (`README.md` y `rules.md`).

---

## 4. REGLA DE ESTILOS Y TEMAS (FUENTE ÚNICA DE LA VERDAD)

> [!TIP]
> **TODO EL ESTILO DEBE ESTAR EN UN SOLO ARCHIVO.**
> - El archivo único autorizado para temas, colores, estilos de input, botones y tarjetas es:
>   👉 [`lib/config/theme.dart`](file:///home/rcardocg/Documentos/stockmind/lib/config/theme.dart)
> - **Queda prohibido** crear archivos secundarios o duplicados de temas (como `core/theme/app_theme.dart`).
> - Cualquier nuevo color, tipografía o estilo de widget global debe definirse exclusivamente dentro de `AppTheme` en `lib/config/theme.dart`.

---

## 5. ARQUITECTURA MODULAR (CLEAN ARCHITECTURE)

La estructura del código debe mantenerse estrictamente modular bajo las siguientes carpetas:

```text
lib/
├── config/          # Estilos únicos (theme.dart), constantes (constants.dart) y AppConfig
├── models/          # Entidades inmutables, aserciones y enums de dominio
├── services/        # Contratos de servicio y placeholders de clientes de datos
├── repositories/    # Capa intermedia que abstrae los servicios de la UI
├── providers/       # Manejo de estado desacoplado (ChangeNotifier / Riverpod en Fase 2)
├── screens/         # Vistas divididas por módulo:
│   ├── auth/        # Login y Signup
│   ├── warehouse/   # Almacén, catálogo de medicamentos y movimientos
│   ├── clinic/      # Pacientes, citas y expedientes clínicos
│   └── admin/       # Dashboard administrativo, usuarios y clínicas
├── widgets/         # Componentes visuales transversales y reutilizables
├── navigation/      # Nombres de rutas (route_names.dart), router (app_router.dart) y guardias (navigation_guards.dart)
├── utils/           # Logger formateado ([STOCKMIND] [LEVEL]), validadores y extensiones
└── main.dart        # Entry point limpio con MaterialApp
```

---

## 6. ESTÁNDAR DE DOCUMENTACIÓN OBLIGATORIO EN ARCHIVOS

Cada archivo `.dart` debe iniciar con la cabecera estándar de documentación:

```dart
/// ═════════════════════════════════════════════
/// FILE: [nombre_archivo.dart]
/// PURPOSE: [Descripción breve de la responsabilidad del archivo]
/// STATUS: [PLACEHOLDER / READY]
/// NEXT PHASE: [Qué se debe conectar o implementar en Fase 2]
/// ═════════════════════════════════════════════
```

Y utilizar separadores visuales para organizar el contenido interno:
```dart
// ╔════════════════════════╗
// ║ [SECCIÓN]              ║
// ╚════════════════════════╝
```

---

## 7. TRAZABILIDAD DE LOGS

Para cualquier operación o placeholder de servicio, utilizar la utilidad [`AppLogger`](file:///home/rcardocg/Documentos/stockmind/lib/utils/app_logger.dart):
- Formato estándar: `[STOCKMIND] [LEVEL] Mensaje descriptivo`
- Niveles disponibles: `AppLogger.log()`, `AppLogger.warning()`, `AppLogger.error()`.
