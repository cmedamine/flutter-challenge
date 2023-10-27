import 'package:doggo_dashboard/src/pages/random_subbreed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doggo_dashboard/src/pages/random_breed_page.dart';

void main() {
  group('RandomBreedPage', () {
    testWidgets('Widget Renders', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RandomBreedPage(),
      ));

      expect(find.text('Please Select Breed'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Navigate to RandomSubbreedPage', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RandomBreedPage(),
      ));

      await tester.tap(find.text('Please Select Breed'));
      await tester.pumpAndSettle();

      expect(find.byType(RandomSubbreedPage), findsOneWidget);
    });

    testWidgets('Refresh Page', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RandomBreedPage(),
      ));

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Error Handling', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RandomBreedPage(),
      ));

      RandomBreedPageState.errorCondition = true;

      await tester.pumpAndSettle();

      expect(find.text('Error: Test Error'), findsOneWidget);
    });
  });
}

class RandomBreedPageState extends State<RandomBreedPage> {
  @override
  Widget build(BuildContext context) {
    if (errorCondition) {
      return const Center(
        child: Text('Error: Test Error'),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static bool errorCondition = false;
}
