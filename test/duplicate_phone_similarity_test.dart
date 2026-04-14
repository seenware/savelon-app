import 'package:contacts/features/main_app/contacts/domain/phone_similarity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhoneSimilarity', () {
    const similarity = PhoneSimilarity();

    test('matches identical numbers with punctuation differences', () {
      final result = similarity.compare(
        ['+1 (415) 555-1212'],
        ['1-415-555-1212'],
      );

      expect(result.score, greaterThanOrEqualTo(0.9));
      expect(result.signals, contains('phone_exact_digits'));
    });

    test('matches numbers with and without country code', () {
      final result = similarity.compare(
        ['+1 415 555 1212'],
        ['4155551212'],
      );

      expect(result.score, greaterThanOrEqualTo(0.78));
      expect(
        result.signals.any((signal) => signal == 'phone_same_nsn' || signal == 'phone_suffix_match'),
        isTrue,
      );
    });

    test('detects one-digit typo on long numbers', () {
      final result = similarity.compare(
        ['+14155551212'],
        ['+14155551213'],
      );

      expect(result.score, greaterThanOrEqualTo(0.6));
      expect(result.signals, contains('phone_near_digits'));
    });
  });
}
