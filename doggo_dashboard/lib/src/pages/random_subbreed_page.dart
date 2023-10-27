import 'package:doggo_dashboard/src/api/dog_api.dart';
import 'package:doggo_dashboard/src/widgets/random_dog_image_widget.dart';
import 'package:flutter/material.dart';

// Widget representing the page for random images of a sub-breed.
class RandomSubbreedPage extends StatefulWidget {
  static const route = '/random-subbreed-page'; // Route name for this page.

  const RandomSubbreedPage({super.key});

  @override
  State<RandomSubbreedPage> createState() => _RandomSubbreedPageState();
}

// State class for the RandomSubbreedPage widget.
class _RandomSubbreedPageState extends State<RandomSubbreedPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final breed = data['breed'];
    final subBreed = data['subBreed'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$breed $subBreed'), // Display the breed and sub-breed name in the app bar.
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
          
          const SizedBox(
            height: 50,
          ),
          RandomDogImageWidget(
            // Use the RandomDogImageWidget to display random dog images for the sub-breed.
            futureFunction: () => DogApi().selectRandomImageByBreedSubbreed(
              breed: breed,
              subBreed: subBreed,
            ),
          )
        ],
      ),
    );
  }
}
