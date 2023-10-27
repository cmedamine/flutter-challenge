import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doggo_dashboard/src/widgets/dog_images_grid.dart';

void main() {
  testWidgets('DogImagesGrid Renders Correctly', (WidgetTester tester) async {
    // Create a list of mock image URLs for testing.
    final mockImageUrls = [
      'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
      'https://images.dog.ceo/breeds/hound-afghan/n02088094_10263.jpg',
      'https://images.dog.ceo/breeds/hound-afghan/n02088094_10715.jpg',
    ];

    // Build the widget under test.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DogImagesGrid(imageUrls: mockImageUrls),
        ),
      ),
    );

    // Use finder to locate elements in the widget.
    final image1Finder = find.widgetWithText(Image, 'Image 1');
    final image2Finder = find.widgetWithText(Image, 'Image 2');
    final image3Finder = find.widgetWithText(Image, 'Image 3');

    // Expectations for the widget rendering.
    expect(image1Finder, findsOneWidget);
    expect(image2Finder, findsOneWidget);
    expect(image3Finder, findsOneWidget);
  });
}