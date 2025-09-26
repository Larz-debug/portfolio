import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio app loads HomePage', (WidgetTester tester) async {
    // Build the app using the right class from main.dart
    await tester.pumpWidget(const PortfolioApp());

    // Verify something unique on the homepage
    expect(find.text('Larz'), findsOneWidget); 
    // 👆 Replace 'Larz' with any text you actually display in HomePage
  });
}

