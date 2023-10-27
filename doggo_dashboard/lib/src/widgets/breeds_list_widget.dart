import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:flutter/material.dart';

// Widget to display a list of dog breeds.
class BreedsListWidget extends StatelessWidget {
  final List<Breed> breeds; // List of dog breeds.
  final String page; // The page to navigate to when a breed is tapped.

  const BreedsListWidget({
    super.key,
    required this.breeds,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          final breadName = breeds[index].name; // Get the breed name.
          final total = breeds[index].subBreeds.length; // Get the number of sub-breeds.

          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                page,
                arguments: breeds[index], // Navigate to the specified page with breed data.
              );
            },
            child: Card(
              child: ListTile(
                title: Text(
                  breadName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                trailing: Visibility(
                  visible: total > 0,
                  child: Badge(
                    smallSize: 8,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          total.toString(), // Display the number of sub-breeds as a badge.
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
