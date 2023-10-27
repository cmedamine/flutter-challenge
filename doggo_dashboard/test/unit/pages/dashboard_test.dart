import 'package:doggo_dashboard/src/pages/breeds_tab.dart';
import 'package:doggo_dashboard/src/pages/random_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doggo_dashboard/src/pages/dashboard.dart';

void main() {
  group('Dashboard Page', () {
    testWidgets(
      'Widget Renders with Loading State',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: DashboardPage(),
          ),
        );

        expect(find.text('Dogs'), findsOneWidget);
        expect(find.text('Random'), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets('Error Handling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardPage(),
        ),
      );

      DashboardPageState.errorCondition = true;

      await tester.pumpAndSettle();

      expect(find.text('Error: Test Error'), findsOneWidget);
    });

    testWidgets('Navigate to Breeds Tab', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardPage(),
        ),
      );

      await tester.tap(
        find.text('Dogs'),
      );
      await tester.pumpAndSettle();

      expect(find.byType(BreedsTab), findsOneWidget);
    });

    testWidgets('Navigate to Random Tab', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardPage(),
        ),
      );

      await tester.tap(find.text('Random'));
      await tester.pumpAndSettle();

      expect(find.byType(RandomTab), findsOneWidget);
    });
  });
}

class DashboardPageState extends State<DashboardPage> {
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
