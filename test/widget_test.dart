import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router_app/main.dart'; // adjust import if needed

void main() {
  testWidgets('HomeScreen buttons navigate correctly', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Verify HomeScreen is shown
    expect(find.text('Welcome to Home Screen'), findsOneWidget);

    // Tap About button
    final aboutButton = find.text('Go to About');
    expect(aboutButton, findsOneWidget);
    await tester.tap(aboutButton);
    await tester.pumpAndSettle();

    // Verify AboutScreen is shown
    expect(find.text('This is About Screen'), findsOneWidget);

    // Go back to HomeScreen
    final backButton = find.text('Back');
    expect(backButton, findsOneWidget);
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Home Screen'), findsOneWidget);

    // Tap Product 3 button
    final productButton = find.text('Product 3');
    expect(productButton, findsOneWidget);
    await tester.tap(productButton);
    await tester.pumpAndSettle();

    // Verify ProductScreen shows correct product ID
    expect(find.text('You are viewing product with ID: 3'), findsOneWidget);

    // Go back to HomeScreen
    final productBack = find.text('Back');
    await tester.tap(productBack);
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Home Screen'), findsOneWidget);

    // Tap Search button
    final searchButton = find.text("Search for 'shoes'");
    expect(searchButton, findsOneWidget);
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    // Verify SearchScreen shows query
    expect(find.text('Results for: shoes'), findsOneWidget);
  });
}