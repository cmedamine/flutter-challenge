import 'package:doggo_dashboard/src/models/dog_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Breed Model',
    () {
      test('Breed fromJson', () {
        const name = 'Labrador';
        final subBreeds = ['Golden', 'Black'];
        final breed = Breed.fromJson(name, subBreeds);

        expect(breed.name, name);
        expect(breed.subBreeds, subBreeds);
      });

      test('Breed toString', () {
        final breed =
            Breed(name: 'Poodle', subBreeds: ['Standard', 'Miniature']);
        final stringRepresentation = breed.toString();

        expect(stringRepresentation,
            'Breed(name: Poodle, subBreeds: [Standard, Miniature])');
      });

      test('Breed equality', () {
        final breed1 = Breed(name: 'Labrador', subBreeds: ['Golden', 'Black']);
        final breed2 = Breed(name: 'Labrador', subBreeds: ['Golden', 'Black']);
        final breed3 =
            Breed(name: 'Poodle', subBreeds: ['Standard', 'Miniature']);

        expect(breed1,
            equals(breed2)); // Test equality between two identical breeds.
        expect(breed1,
            isNot(equals(breed3))); // Test inequality between different breeds.
      });

      test('Breed hashCode', () {
        final breed1 = Breed(name: 'Labrador', subBreeds: ['Golden', 'Black']);
        final breed2 = Breed(name: 'Labrador', subBreeds: ['Golden', 'Black']);
        final breed3 =
            Breed(name: 'Poodle', subBreeds: ['Standard', 'Miniature']);

        expect(
            breed1.hashCode,
            equals(breed2
                .hashCode)); // Hash code should be the same for identical breeds.
        expect(
            breed1.hashCode,
            isNot(equals(breed3
                .hashCode))); // Hash code should be different for different breeds.
      });
    },
  );
}
