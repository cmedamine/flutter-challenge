import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Renders', (WidgetTester tester) async {
    final GlobalKey<SubBreedsPageState> subBreedsPageKey =
        GlobalKey<SubBreedsPageState>();

    await tester.pumpWidget(MaterialApp(
      home: SubBreedsPage(
        key: subBreedsPageKey,
      ),
    ));

    expect(find.text('Sub breeds'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('Loading State', (WidgetTester tester) async {
    final GlobalKey<SubBreedsPageState> subBreedsPageKey =
        GlobalKey<SubBreedsPageState>();

    await tester.pumpWidget(MaterialApp(
      home: SubBreedsPage(
        key: subBreedsPageKey,
      ),
    ));

    expect(find.text('Sub breeds'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Error Handling', (WidgetTester tester) async {
    final GlobalKey<SubBreedsPageState> subBreedsPageKey =
        GlobalKey<SubBreedsPageState>();

    await tester.pumpWidget(MaterialApp(
      home: SubBreedsPage(
        key: subBreedsPageKey,
      ),
    ));

    subBreedsPageKey.currentState?.setErrorCondition(true);
    await tester.pumpAndSettle();

    expect(find.text('Error: Test Error'), findsOneWidget);
  });
}

class SubBreedsPage extends StatefulWidget {
  const SubBreedsPage({Key? key}) : super(key: key);

  @override
  SubBreedsPageState createState() => SubBreedsPageState();
}

class SubBreedsPageState extends State<SubBreedsPage> {
  bool errorCondition = false;

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

  void setErrorCondition(bool value) {
    setState(() {
      errorCondition = value;
    });
  }
}
