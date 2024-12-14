import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/main.dart'; // Adjust the import based on your file structure

void main() {
  testWidgets('Weather App - City Selection and Weather Display',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WeatherApp());

    // Verify that the dropdown is present and has the correct initial state.
    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.text('Select a city'), findsOneWidget);

    // Tap the dropdown to select a city.
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle(); // Wait for the dropdown to open

    // Verify that the cities are present in the dropdown.
    expect(find.text('New York'), findsOneWidget);
    expect(find.text('Los Angeles'), findsOneWidget);
    expect(find.text('Chicago'), findsOneWidget);
    expect(find.text('Houston'), findsOneWidget);

    // Select a city (e.g., New York).
    await tester.tap(find
        .text('New York')
        .last); // Use .last to ensure we tap the correct one
    await tester.pumpAndSettle(); // Wait for the state to update

    // Verify that the weather information is displayed.
    expect(find.text('Weather in New York'), findsOneWidget);
    expect(find.text('Condition: Sunny'), findsOneWidget);
    expect(find.text('Temperature: 25°C'), findsOneWidget);
  });
}
