import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:doggo_dashboard/src/pages/subbreeds_page.dart';
import 'package:doggo_dashboard/src/widgets/breeds_list_widget.dart';
import 'package:flutter/material.dart';

// Widget representing the 'Breeds' tab in the dashboard.
class BreedsTab extends StatefulWidget {
  final List<Breed> breeds;

  const BreedsTab({super.key, required this.breeds});

  @override
  State<BreedsTab> createState() => _BreedsTabState();
}

// State class for the BreedsTab widget.
class _BreedsTabState extends State<BreedsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'All Dog Breeds', // Title for the 'All Dog Breeds' section.
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Choose A Breed', // Subtitle for selecting a breed.
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        BreedsListWidget(
          breeds: widget.breeds, // List of all dog breeds.
          page: SubBreedsPage.route, // The route for the sub-breeds page.
        )
      ],
    );
  }
}
