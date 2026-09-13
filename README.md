# StockMind - Documentación Técnica

Sistema modular en Flutter para la gestión integral de inventario farmacéutico, almacén y atención clínica bajo principios de **Clean Architecture**.

---

## 📜 Reglas de Desarrollo para AI y Desarrolladores

> [!IMPORTANT]
> **Antes de realizar cualquier cambio en el código**, consulta el archivo de directrices obligatorias:
> 👉 **[rules.md](file:///home/rcardocg/Documentos/stockmind/rules.md)**
>
> **Puntos clave de `rules.md`:**
> - **Sin terminal:** Terminal y comandos de consola estrictamente deshabilitados para el asistente.
> - **Sin lógica de negocio inventada:** La IA solo define contratos, interfaces, modelos, placeholders y componentes visuales.
> - **Sin datos sintéticos:** Prohibido hardcodear mock data. Usar listas vacías (`[]`) y modelos vacíos/null con logs.
> - **Estilos unificados:** Todo el estilo, tema y colores residen **única y exclusivamente** en [`lib/config/theme.dart`](file:///home/rcardocg/Documentos/stockmind/lib/config/theme.dart).
> - **Sin dependencias externas no autorizadas:** No tocar `pubspec.yaml`.

---

## 🏛 Arquitectura

- **Clean Architecture** con estricta separación de responsabilidades:
  - **Models** → **Repositories** → **Services** → **UI (Screens & Widgets)**
- Cada capa es independiente, desacoplada y fácilmente testeable.
- Los repositorios abstraen las fuentes de datos para permitir el cambio o integración de servicios externos (como Supabase o APIs REST) sin afectar la lógica visual.
- Navegación modular con soporte preliminar de control de acceso basado en roles (**RBAC**).

---

## 🎨 Sistema Único de Temas y Estilos

Toda la definición estética y visual de la aplicación se encuentra centralizada en:
📁 **[`lib/config/theme.dart`](file:///home/rcardocg/Documentos/stockmind/lib/config/theme.dart)**

Incluye:
- **Paleta de Colores Oficial:** `primary` (azul corporativo), `secondary` (verde azulado clínico), `warning` (rojo stock crítico/error), `success` (verde operaciones exitosas), `pending` (ámbar citas pendientes).
- **Componentes Estilizados:** `InputDecorationTheme`, `CardTheme`, `AppBarTheme`, `ElevatedButtonTheme`, `OutlinedButtonTheme` y `TextButtonTheme`.
- **Regla:** Queda prohibido crear archivos duplicados de tema (como el anterior `core/theme/app_theme.dart`).

---

## 📁 Estructura de Carpetas

```text
lib/
├── config/                     # Configuración global y estilos centralizados
│   ├── app_config.dart         # Parámetros de entorno y ejecución
│   ├── constants.dart          # Constantes globales y placeholders de backend
│   └── theme.dart              # ARCHIVO ÚNICO de temas, colores y componentes UI
│
├── models/                     # Entidades de dominio y contratos de datos
│   ├── appointment_model.dart  # Citas médicas
│   ├── enums.dart              # Enumeradores (UserRole, MovementType, AppointmentStatus)
│   ├── medicine_model.dart     # Medicamentos e inventario
│   ├── patient_model.dart      # Expedientes de pacientes
│   └── user_model.dart         # Cuentas de usuario y asignación de rol
│
├── services/                   # Fuentes de datos y clientes externos (Placeholders)
│   ├── auth_service.dart       # Contrato e implementación simulada de autenticación
│   ├── storage_service.dart    # Persistencia local (SharedPreferences/SecureStorage)
│   └── supabase_service.dart   # Conexión a base de datos Supabase (sin datos sintéticos)
│
├── repositories/               # Abstracción e intermediarios entre servicios y UI
│   ├── appointment_repository.dart # Operaciones sobre citas médicas
│   ├── auth_repository.dart        # Lógica de negocio de autenticación
│   ├── medicine_repository.dart    # Operaciones de catálogo y stock
│   └── patient_repository.dart     # Gestión de pacientes
│
├── providers/                  # Manejadores de estado (Placeholders sin dependencias externas)
│   ├── auth_provider.dart      # Estado reactivo de sesión y usuario activo
│   ├── medicine_provider.dart  # Estado de medicamentos y catálogo
│   └── patient_provider.dart   # Estado de directorio de pacientes
│
├── screens/                    # Vistas y pantallas divididas por rol y funcionalidad
│   ├── admin/                  # Módulo Administrador (Dashboard, Usuarios, Sedes)
│   │   ├── admin_dashboard_screen.dart
│   │   ├── clinics_management_screen.dart
│   │   └── users_management_screen.dart
│   ├── auth/                   # Módulo de Autenticación (Login, Registro)
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── clinic/                 # Módulo Clínico (Home, Pacientes, Citas, Expediente)
│   │   ├── add_patient_screen.dart
│   │   ├── appointments_screen.dart
│   │   ├── clinic_home_screen.dart
│   │   ├── patient_detail_screen.dart
│   │   └── patients_list_screen.dart
│   └── warehouse/              # Módulo de Almacén (Home, Medicamentos, Movimientos)
│       ├── add_medicine_screen.dart
│       ├── medicines_list_screen.dart
│       ├── movements_screen.dart
│       └── warehouse_home_screen.dart
│
├── widgets/                    # Componentes visuales reutilizables
│   ├── appointment_card.dart   # Tarjeta con estados de citas (pendiente, completada, cancelada)
│   ├── bottom_nav_bar.dart     # Barra de navegación inferior
│   ├── custom_app_bar.dart     # Barra superior con título, rol y logout
│   ├── loading_placeholder.dart# Indicador visual de carga
│   ├── medicine_card.dart      # Tarjeta de medicamento con alerta de stock crítico
│   └── patient_card.dart       # Tarjeta de paciente
│
├── navigation/                 # Sistema de navegación y rutas
│   ├── app_router.dart         # Enrutador y resolución de vistas post-login según rol
│   ├── navigation_guards.dart  # Guardias de autorización de rutas
│   └── route_names.dart        # Constantes de rutas (/login, /warehouse/home, etc.)
│
├── utils/                      # Herramientas de utilidad transversal
│   ├── app_logger.dart         # Registro y formateo de logs [STOCKMIND] [LEVEL]
│   ├── extensions.dart         # Extensiones para String y DateTime
│   └── validators.dart         # Validaciones de email, password y SKU
│
└── main.dart                   # Punto de entrada de la aplicación
```

---

## 👥 Roles y Permisos

El sistema contempla 3 perfiles principales:

1. **ADMIN**:
   - Acceso total y supervisión global del sistema.
   - Administración de usuarios y asignación de roles.
   - Configuración y alta de sedes clínicas.
   - Vista y control sobre los módulos de almacén y clínica.

2. **WAREHOUSE**:
   - Gestión del catálogo farmacéutico e insumos médicos.
   - Registro de existencias mínimas y detección de stock crítico.
   - Control de movimientos de inventario: entradas, salidas y ajustes manuales.

3. **CLINIC**:
   - Directorio y gestión de expedientes de pacientes.
   - Programación, seguimiento y estados de citas médicas.
   - Historial clínico y notas de consulta.

---

## 📊 Status Actual (Fase 1)

### ✅ Completado:
- Estructura base modular y carpetas según Clean Architecture.
- Sistema de estilos y colores consolidado en un único archivo [`lib/config/theme.dart`](file:///home/rcardocg/Documentos/stockmind/lib/config/theme.dart).
- Eliminación de temas duplicados en `lib/core/theme/`.
- Creación de [`rules.md`](file:///home/rcardocg/Documentos/stockmind/rules.md) con directrices para IA.
- Modelos de dominio (`User`, `Medicine`, `Patient`, `Appointment`, `Enums`) con aserciones y validaciones.
- Placeholders de servicios (`AuthService`, `SupabaseService`, `StorageService`) sin dependencias de red ni datos sintéticos.
- Capa de repositorios (`AuthRepository`, `MedicineRepository`, `PatientRepository`, `AppointmentRepository`).
- Placeholders de manejadores de estado basados en `ChangeNotifier`.
- Pantallas base (14 pantallas) con ciclo de vida `initState`, manejo de estados (`isLoading`, `errorMessage`) y estructura UI.
- Widgets reutilizables (`CustomAppBar`, `MedicineCard`, `PatientCard`, `AppointmentCard`, `LoadingPlaceholder`).
- Sistema de rutas centralizado y guardia de navegación (`AuthGuard`).
- Documentación de cabecera estándar en cada archivo `.dart`.

### ❌ Pendiente (Fase 2):
- Conectar `AuthService` con cliente real de **Supabase Auth**.
- Conectar `SupabaseService` con las tablas de PostgreSQL en Supabase.
- Implementar solución de estado reactivo global (Riverpod o BLoC).
- Desarrollar las interfaces de usuario completas con formularios dinámicos y tablas/listas reactivas.
- Implementar validación estricta de permisos por rol en `AuthGuard`.
- Escribir pruebas unitarias y de integración.

---

## 🚀 Cómo Ejecutar

Cuando tengas acceso a la terminal y desees levantar el proyecto:

```bash
# Obtener dependencias
flutter pub get

# Ejecutar en el dispositivo/emulador/navegador seleccionado
flutter run
```

---

## 🧭 Próximos Pasos (Fase 2)

1. **Conexión a Supabase**:
   - Agregar dependencia `supabase_flutter` a `pubspec.yaml`.
   - Inicializar `Supabase.initialize(url: ..., anonKey: ...)` en `main.dart`.
   - Reemplazar los métodos placeholder de `lib/services/supabase_service.dart` y `lib/services/auth_service.dart`.
2. **Implementación de Estado Global**:
   - Seleccionar e integrar Riverpod o Flutter BLoC para inyectar repositorios y escuchar cambios de sesión en toda la app.
3. **Formularios e Interfaz Gráfica**:
   - Completar los formularios en `add_medicine_screen.dart`, `add_patient_screen.dart` y `movements_screen.dart`.
4. **Activación de Guardias de Navegación**:
   - Hacer que `AuthGuard.canNavigate` valide el rol del usuario autenticado antes de permitir transiciones entre módulos.
