import 'package:flutter/material.dart';

// Widget to display a grid of dog images.
class DogImagesGrid extends StatelessWidget {
  final List<String> imageUrls; // List of image URLs.

  const DogImagesGrid({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Display images in a grid with two columns.
      ),
      itemBuilder: (context, index) {
        return Image.network(imageUrls[index]); // Display images from the provided URLs.
      },
      itemCount: imageUrls.length, // The number of images to display.
    );
  }
}
