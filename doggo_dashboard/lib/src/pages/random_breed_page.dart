import 'package:doggo_dashboard/src/api/dog_api.dart';
import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:doggo_dashboard/src/pages/random_subbreed_page.dart';
import 'package:doggo_dashboard/src/widgets/random_dog_image_widget.dart';
import 'package:flutter/material.dart';

// Widget representing the page for random images of a breed.
class RandomBreedPage extends StatefulWidget {
  static const route = '/random-subbreed'; // Route name for this page.

  const RandomBreedPage({super.key});

  @override
  State<RandomBreedPage> createState() => _RandomSubBreedPageState();
}

// State class for the RandomBreedPage widget.
class _RandomSubBreedPageState extends State<RandomBreedPage> {
  @override
  Widget build(BuildContext context) {
    final Breed data = ModalRoute.of(context)?.settings.arguments as Breed;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.name), // Display the breed name in the app bar.
        actions: [
          IconButton(
            onPressed: () {
              setState(() {}); // Refresh the page when the refresh button is pressed.
            },
            icon: const Icon(Icons.refresh), // Icon for refreshing the page.
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please select a Sub breeds:', // Title for the sub-breeds section.
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: data.subBreeds
                        .map(
                          (breed) => GestureDetector(
                            onTap: () {
                              // Navigate to the page for random sub-breeds when a sub-breed is tapped.
                              Navigator.of(context).pushNamed(
                                  RandomSubbreedPage.route,
                                  arguments: {
                                    'breed': data.name,
                                    'subBreed': breed,
                                  });
                            },
                            child: Chip(
                              label: Text(breed),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RandomDogImageWidget(
            // Use the RandomDogImageWidget to display random dog images for the breed.
            futureFunction: () => DogApi().selectRandomImageByBreed(data.name),
          )
        ],
      ),
    );
  }
}
