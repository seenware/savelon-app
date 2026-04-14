import 'package:contacts/features/main_app/contacts/domain/name_similarity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NameSimilarity', () {
    const similarity = NameSimilarity();

    test('detects prefix variants with same last name', () {
      final result = similarity.compare(
        leftFullName: 'Vlad Oleksenko',
        rightFullName: 'Vladyslav Oleksenko',
        leftNickname: '',
        rightNickname: '',
      );

      expect(result.score, greaterThanOrEqualTo(0.6));
      expect(result.signals, contains('name_same_last'));
    });

    test('uses deterministic first-name similarity and last-name overlap', () {
      final result = similarity.compare(
        leftFullName: 'Jon Doe',
        rightFullName: 'John Doe',
        leftNickname: '',
        rightNickname: '',
      );

      expect(result.score, greaterThanOrEqualTo(0.6));
      expect(result.signals, contains('name_same_last'));
      expect(
        result.signals,
        anyOf(contains('name_first_prefix'), contains('name_first_edit_distance')),
      );
    });

    test('handles cyrillic and latin transliteration', () {
      final result = similarity.compare(
        leftFullName: 'Влад Олексенко',
        rightFullName: 'Vlad Oleksenko',
        leftNickname: '',
        rightNickname: '',
      );

      expect(result.score, greaterThanOrEqualTo(0.6));
      expect(result.signals, contains('name_exact_full'));
    });
  });
}
