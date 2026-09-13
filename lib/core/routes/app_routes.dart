import 'package:flutter/material.dart';
import 'package:stockmind/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:stockmind/features/auth/presentation/screens/login_screen.dart';
import 'package:stockmind/features/dashboard/presentation/screens/dashboard_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> get routes => {
        login: (context) => const LoginScreen(),
        forgotPassword: (context) => const ForgotPasswordScreen(),
        dashboard: (context) => const DashboardScreen(),
      };
}
