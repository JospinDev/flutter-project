import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/game.dart';

void main() {
  group('Game logic', () {
    test('Word.fromSeed handles negative seeds', () {
      expect(Word.fromSeed(0).toString(), equals('aback'));
      expect(Word.fromSeed(-1).toString(), equals('abbot'));
    });

    test('completed games reject new guesses and invalid words are rejected', () {
      final game = Game(seed: 0);

      expect(() => game.guess('zzzzz'), throwsArgumentError);
      expect(() => game.guess('aback'), returnsNormally);
      expect(() => game.guess('abase'), throwsStateError);
    });
  });
}
