import 'dart:convert';
import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:http/http.dart' as http;

// A class for interacting with the Dog CEO API.
class DogApi {
  // Base URL for the Dog CEO API.
  static const String baseUrl = 'https://dog.ceo/';

  // Fetch a list of all dog breeds.
  Future<List<Breed>> fetchAllBreeds() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final breedsMap = data['message'] as Map<String, dynamic>;

      // Map the JSON data to a list of Breed objects.
      final breedsList = breedsMap.entries.map(
        (e) => Breed.fromJson(
          e.key,
          List<String>.from(e.value),
        ),
      ).toList();
      return breedsList;
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  // Select images for a specific dog breed by name.
  Future<List<String>?> selectBreed(String name) async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$name/images'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final imagesList = data['message'] as List<dynamic>;
        final List<String> imageUrls = List<String>.from(imagesList);
        return imageUrls;
      } else {
        throw Exception('Failed to load images for breed: $name');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch data. Check your network connection.');
    }
  }

  // Select a random image for a specific dog breed.
  Future<String> selectRandomImageByBreed(String breed) async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String image = data['message'] as String;
        return image;
      } else {
        throw Exception('Failed to load images for breed: $breed');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch data. Check your network connection.');
    }
  }

  // Select a random image for a specific dog breed and sub-breed.
  Future<String> selectRandomImageByBreedSubbreed({
    required String breed,
    required String subBreed,
  }) async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/$subBreed/images/random'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String image = data['message'] as String;
        return image;
      } else {
        throw Exception('Failed to load images for breed: $breed');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch data. Check your network connection.');
    }
  }
}
