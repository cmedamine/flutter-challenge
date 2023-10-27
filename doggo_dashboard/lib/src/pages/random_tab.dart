import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:doggo_dashboard/src/pages/random_breed_page.dart';
import 'package:doggo_dashboard/src/widgets/breeds_list_widget.dart';
import 'package:flutter/material.dart';

// Widget representing the 'Random' tab in the dashboard.
class RandomTab extends StatefulWidget {
  final List<Breed> breeds;

  const RandomTab({super.key, required this.breeds});

  @override
  State<RandomTab> createState() => _RandomTabState();
}

// State class for the RandomTab widget.
class _RandomTabState extends State<RandomTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Please Select Breed', // Prompt the user to select a breed.
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        BreedsListWidget(
          breeds: widget.breeds, // List of all dog breeds.
          page: RandomBreedPage.route, // The route for the random breed page.
        ),
      ],
    );
  }
}
