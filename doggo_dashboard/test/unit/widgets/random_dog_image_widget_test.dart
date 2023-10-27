import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doggo_dashboard/src/widgets/random_dog_image_widget.dart';

void main() {
  testWidgets('RandomDogImageWidget Renders Correctly', (WidgetTester tester) async {
    // Mock the future function that fetches a random dog image.
    Future<String> mockFutureFunction() async {
      return 'https://images.dog.ceo/breeds/hound-afghan/n02088094_10715.jpg';
    }

    // Build the widget under test.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RandomDogImageWidget(futureFunction: mockFutureFunction),
        ),
      ),
    );

    // Use finders to locate elements in the widget.
    final loadingIndicatorFinder = find.byType(CircularProgressIndicator);
    final imageFinder = find.byType(Image);
    final noRandomDogTextFinder = find.text('No Random Dog');

    // Expectations for the widget rendering.
    expect(loadingIndicatorFinder, findsOneWidget);
    expect(imageFinder, findsNothing);
    expect(noRandomDogTextFinder, findsNothing);

    // Wait for the future to complete.
    await tester.pumpAndSettle();

    // Re-check the widget after the future has completed.
    expect(loadingIndicatorFinder, findsNothing);
    expect(imageFinder, findsOneWidget);
    expect(noRandomDogTextFinder, findsNothing);
  });
}
