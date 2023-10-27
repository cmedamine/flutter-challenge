import 'package:flutter_test/flutter_test.dart';
import 'package:doggo_dashboard/src/api/dog_api.dart';

void main() {
  group('DogApi', () {
    late DogApi dogApi;

    setUp(() {
      dogApi = DogApi();
    });

    test('Test fetchAllBreeds', () async {
      final breeds = await dogApi.fetchAllBreeds();
      expect(breeds, isNotNull); // Check if the result is not null.
    });

    test('Test selectBreed', () async {
      const breedName = 'labrador';
      final images = await dogApi.selectBreed(breedName);
      expect(images, isNotNull); // Check if the result is not null.
    });

    test('Test selectRandomImageByBreed', () async {
      const breedName = 'labrador';
      final randomImage = await dogApi.selectRandomImageByBreed(breedName);
      expect(randomImage, isNotNull); // Check if the result is not null.
      // Add more specific assertions based on the expected behavior.
    });

    test('Test selectRandomImageByBreedSubbreed', () async {
      const breedName = 'labrador';
      const subBreed = 'golden';
      final randomImage = await dogApi.selectRandomImageByBreedSubbreed(
        breed: breedName,
        subBreed: subBreed,
      );
      expect(randomImage, isNotNull); // Check if the result is not null.
    });
  });
}
