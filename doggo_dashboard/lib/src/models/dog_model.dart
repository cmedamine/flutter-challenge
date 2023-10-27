// A class representing a dog breed.
class Breed {
  final String name;          // The name of the breed.
  final List<String> subBreeds;  // List of sub-breeds for this breed.

  // Constructor for the Breed class.
  Breed({required this.name, required this.subBreeds});

  // Factory method to create a Breed object from JSON data.
  factory Breed.fromJson(String name, List<String> subBreeds) {
    // This factory constructor creates a Breed object using the provided data.
    return Breed(name: name, subBreeds: subBreeds);
  }
}
