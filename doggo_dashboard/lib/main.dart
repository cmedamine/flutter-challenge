import 'package:doggo_dashboard/src/pages/dashboard.dart';
import 'package:doggo_dashboard/src/pages/random_breed_page.dart';
import 'package:doggo_dashboard/src/pages/random_subbreed_page.dart';
import 'package:doggo_dashboard/src/pages/subbreeds_page.dart';
import 'package:flutter/material.dart';

// The entry point of the Flutter application.
void main() {
  // Run the main application using MyApp as the root widget.
  runApp(const MyApp());
}

// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable the debug banner in the top-right corner of the app.
      debugShowCheckedModeBanner: false,
      // Set the title of the app.
      title: 'Doggo Dashboard',
      // Define the theme for the app.
      theme: ThemeData(
        // Customize the color scheme for the app, using deep purple as the base color.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark
        ),
        // Enable Material You (Material Design 3) styling for the app.
        useMaterial3: true,
      ),
      // Set the initial page (home) of the app to the DashboardPage.
      home: const DashboardPage(),
      // Define named routes for navigation within the app.
      routes: {
        SubBreedsPage.route: (context) => const SubBreedsPage(),
        RandomBreedPage.route: (context) => const RandomBreedPage(),
        RandomSubbreedPage.route: (context) => const RandomSubbreedPage()
      },
    );
  }
}
