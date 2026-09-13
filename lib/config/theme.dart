/// ═════════════════════════════════════════════
/// FILE: theme.dart
/// PURPOSE: Archivo único y centralizado de temas, estilos, colores y componentes visuales de StockMind
/// STATUS: READY
/// NEXT PHASE: Añadir soporte para Dark Mode dinámico y temas personalizados por clínica en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';

// ╔════════════════════════╗
// ║ CONFIG / THEME         ║
// ╚════════════════════════╝

/// Configuración única de estilos de la aplicación StockMind.
/// Toda la definición visual (colores, inputs, botones, tarjetas) se encuentra centralizada aquí.
class AppTheme {
  AppTheme._();

  // ─────────────────────────────────────────
  // PALETA DE COLORES GLOBAL
  // ─────────────────────────────────────────
  /// Color primario corporativo (Azul profundo)
  static const Color primary = Color(0xFF1E3A8A);

  /// Color de acento / secundario (Verde azulado clínico)
  static const Color secondary = Color(0xFF0D9488);

  /// Color para alertas, advertencias y stock crítico (Rojo)
  static const Color warning = Color(0xFFDC2626);

  /// Color para operaciones exitosas y estados completados (Verde)
  static const Color success = Color(0xFF16A34A);

  /// Color para estados pendientes (Ámbar / Naranja)
  static const Color pending = Color(0xFFD97706);

  /// Fondo neutral claro para pantallas
  static const Color background = Color(0xFFF8FAFC);

  /// Superficie para tarjetas y modales
  static const Color surface = Colors.white;

  /// Texto principal de alto contraste
  static const Color textPrimary = Color(0xFF0F172A);

  /// Texto secundario / subtítulos
  static const Color textSecondary = Color(0xFF64748B);

  /// Bordes sutiles para tarjetas e inputs
  static const Color borderSubtle = Color(0xFFE2E8F0);

  // ─────────────────────────────────────────
  // TEMA PRINCIPAL (LIGHT THEME)
  // ─────────────────────────────────────────
  /// Genera la configuración completa de ThemeData para la aplicación
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        error: warning,
        surface: surface,
      ),

      // Estilo de AppBar
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: surface,
        foregroundColor: textPrimary,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
      ),

      // Estilo de Tarjetas (Cards)
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: borderSubtle),
        ),
      ),

      // Estilo de Campos de Texto (Input Decoration)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: warning),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: warning, width: 2),
        ),
        labelStyle: const TextStyle(color: textSecondary, fontSize: 14),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
      ),

      // Estilo de Botones Principales (Elevated Button)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Estilo de Botones Secundarios (Outlined Button)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: const BorderSide(color: primary),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Estilo de Botones de Texto (Text Button)
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
