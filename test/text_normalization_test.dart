import 'package:contacts/features/main_app/contacts/domain/text_normalization.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextNormalization', () {
    test('normalizes many-to-many transliteration for phaser cluster', () {
      final forms = ['фазер', 'father', 'faser', 'fazer', 'phaser']
          .map(TextNormalization.normalizeText)
          .toSet();
      expect(forms.length, 1);
    });

    test('normalizes k/c/ck variants', () {
      final forms = ['к', 'k', 'c', 'ck']
          .map(TextNormalization.normalizeText)
          .toSet();
      expect(forms.length, 1);
    });

    test('normalizes ya and ia variants', () {
      final forms = ['я', 'ya', 'ia']
          .map(TextNormalization.normalizeText)
          .toSet();
      expect(forms.length, 1);
    });

    test('normalizes u umlaut and eu variants', () {
      final forms = ['ü', 'u', 'eu']
          .map(TextNormalization.normalizeText)
          .toSet();
      expect(forms.length, 1);
    });

    test('supports greek transliteration', () {
      final left = TextNormalization.normalizeText('Αλέξανδρος');
      final right = TextNormalization.normalizeText('alexandros');
      expect(left, right);
    });
  });
}
