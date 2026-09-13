import 'package:flutter_test/flutter_test.dart';
import 'package:stockmind/main.dart';

void main() {
  testWidgets('Login screen loads correctly', (WidgetTester tester) async {
    // Construir la aplicación
    await tester.pumpWidget(const StockMindApp());

    // Verificar que los textos principales de la pantalla de Login están presentes
    expect(find.text('StockMind'), findsWidgets);
    expect(find.text('Iniciar Sesión'), findsOneWidget);
    expect(find.text('¿Olvidaste tu contraseña?'), findsOneWidget);
  });
}
