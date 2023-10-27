import 'package:flutter/material.dart';

// Widget to display a random dog image fetched from a future function.
class RandomDogImageWidget extends StatelessWidget {
  final Future<String> Function() futureFunction; // Function to fetch a random dog image.

  const RandomDogImageWidget({super.key, required this.futureFunction});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: futureFunction(), // Invoke the future function to fetch the image.
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(), // Display a loading indicator.
          );
        } else if (data != null && data.isNotEmpty) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .7, // Set the image width to 70% of the screen width.
                child: Image.network(
                  data,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('No Random Dog'), // Display a message if no random dog image is available.
          );
        }
      },
    );
  }
}
