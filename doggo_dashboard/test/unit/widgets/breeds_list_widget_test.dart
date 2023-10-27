import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:doggo_dashboard/src/widgets/breeds_list_widget.dart';

void main() {
  testWidgets('BreedsListWidget Renders Correctly', (WidgetTester tester) async {
    // Create a list of mock Breed objects for testing.
    final mockBreeds = [
      Breed(name: 'Breed 1', subBreeds: ['SubBreed 1', 'SubBreed 2']),
      Breed(name: 'Breed 2', subBreeds: []),
    ];

    // Mock function for navigation.
    String? tappedBreed;
    void mockNavigate(String route, {Object? arguments}) {
      tappedBreed = (arguments as Breed).name;
    }

    // Build the widget under test.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BreedsListWidget(
            breeds: mockBreeds,
            page: '/sub-breed',
          ),
        ),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return const Scaffold(body: Center(child: Text('Mock Page')));
            },
          );
        },
        navigatorObservers: [MockNavigatorObserver(mockNavigate)],
      ),
    );

    // Use finder to locate elements in the widget.
    final breedName1Finder = find.text('Breed 1');
    final breedName2Finder = find.text('Breed 2');
    final subBreed1BadgeFinder = find.text('2');
    final subBreed2BadgeFinder = find.text('0');

    // Expectations for the widget rendering.
    expect(breedName1Finder, findsOneWidget);
    expect(breedName2Finder, findsOneWidget);
    expect(subBreed1BadgeFinder, findsOneWidget);
    expect(subBreed2BadgeFinder, findsOneWidget);

    // Tap on the first breed and check if it navigates.
    await tester.tap(breedName1Finder);
    await tester.pumpAndSettle();

    // Ensure the navigation occurred.
    expect(tappedBreed, 'Breed 1');
  });
}

class MockNavigatorObserver extends NavigatorObserver {
  final Function(String route, {Object? arguments}) onNavigate;

  MockNavigatorObserver(this.onNavigate);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final settings = route.settings;
    final name = settings.name;
    final arguments = settings.arguments;
    onNavigate(name!, arguments: arguments);
  }
}
