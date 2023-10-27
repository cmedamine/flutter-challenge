import 'package:doggo_dashboard/src/api/dog_api.dart';
import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:flutter/material.dart';

// Widget representing the page for sub-breeds.
class SubBreedsPage extends StatelessWidget {
  static const route = '/sub-breed'; // Route name for this page.

  const SubBreedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Breed data = ModalRoute.of(context)?.settings.arguments as Breed;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.name), // Display the breed name in the app bar.
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
                    'Sub breeds', // Title for the sub-breeds section.
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: data.subBreeds
                        .map((breed) => Chip(label: Text(breed)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: DogApi().selectBreed(data.name), // Fetch images for the selected breed.
              builder: (context, snapshot) {
                final data = snapshot.data;

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(), // Display a loading indicator.
                  );
                } else if (data != null && data.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => ClipOval(
                        child: Image.network(
                          data[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      itemCount: data.length,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No Dogs'), // Display a message if there are no dogs.
                  );
                }
              })
        ],
      ),
    );
  }
}
