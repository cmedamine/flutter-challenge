import 'package:doggo_dashboard/src/api/dog_api.dart';
import 'package:doggo_dashboard/src/pages/breeds_tab.dart';
import 'package:doggo_dashboard/src/pages/random_tab.dart';
import 'package:flutter/material.dart';

// Widget representing the dashboard page.
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

// State class for the DashboardPage widget.
class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: 'Dogs' and 'Random'.
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Dogs', // First tab label.
                icon: Icon(Icons.pets), // Icon for the 'Dogs' tab.
              ),
              Tab(
                text: 'Random', // Second tab label.
                icon: Icon(Icons.auto_fix_high_outlined), // Icon for the 'Random' tab.
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: DogApi().fetchAllBreeds(), // Fetch a list of all dog breeds.
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(), // Display a loading indicator.
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'), // Display an error message if fetching fails.
              );
            } else if (snapshot.hasData) {
              final breeds = snapshot.data!; // Extract the list of breeds from the snapshot.

              return TabBarView(
                children: [
                  BreedsTab(breeds: breeds), // Display the 'Breeds' tab.
                  RandomTab(breeds: breeds), // Display the 'Random' tab.
                ],
              );
            } else {
              return const Center(
                child: Text('No Breeds'), // Display a message if there are no breeds.
              );
            }
          },
        ),
      ),
    );
  }
}
