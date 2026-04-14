import 'text_normalization.dart';

class PhoneSimilarityResult {
  final double score;
  final List<String> signals;

  const PhoneSimilarityResult({required this.score, required this.signals});
}

class PhoneSimilarity {
  const PhoneSimilarity();

  PhoneSimilarityResult compare(Iterable<String> leftRaw, Iterable<String> rightRaw) {
    final left = leftRaw
        .map(TextNormalization.digitsOnly)
        .where((n) => n.length >= 2)
        .toSet();
    final right = rightRaw
        .map(TextNormalization.digitsOnly)
        .where((n) => n.length >= 2)
        .toSet();

    if (left.isEmpty || right.isEmpty) {
      return const PhoneSimilarityResult(score: 0, signals: []);
    }

    var best = 0.0;
    final signals = <String>{};

    for (final a in left) {
      for (final b in right) {
        if (a == b) {
          best = best < 1.0 ? 1.0 : best;
          signals.add('phone_exact_digits');
          continue;
        }

        if (a.length >= 7 && b.length >= 7 && _nationalDigits(a) == _nationalDigits(b)) {
          best = best < 0.9 ? 0.9 : best;
          signals.add('phone_same_nsn');
          continue;
        }

        if (_suffixMatch(a, b, minSuffix: 7)) {
          best = best < 0.78 ? 0.78 : best;
          signals.add('phone_suffix_match');
          continue;
        }

        if (_nearByEditDistance(a, b)) {
          best = best < 0.62 ? 0.62 : best;
          signals.add('phone_near_digits');
        }
      }
    }

    return PhoneSimilarityResult(score: best, signals: signals.toList());
  }

  String _nationalDigits(String value) {
    if (value.length <= 10) return value;
    return value.substring(value.length - 10);
    }

  bool _suffixMatch(String a, String b, {required int minSuffix}) {
    final shorter = a.length <= b.length ? a : b;
    final longer = a.length > b.length ? a : b;
    if (shorter.length < minSuffix) return false;
    return longer.endsWith(shorter);
  }

  bool _nearByEditDistance(String a, String b) {
    if (a.length < 7 || b.length < 7) return false;
    if ((a.length - b.length).abs() > 1) return false;
    final distance = _levenshtein(a, b);
    return distance <= 1;
  }

  int _levenshtein(String a, String b) {
    if (a == b) return 0;
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;

    final dp = List<int>.generate(b.length + 1, (index) => index);
    for (var i = 1; i <= a.length; i++) {
      var prev = dp[0];
      dp[0] = i;
      for (var j = 1; j <= b.length; j++) {
        final temp = dp[j];
        final cost = a[i - 1] == b[j - 1] ? 0 : 1;
        dp[j] = _min3(
          dp[j] + 1,
          dp[j - 1] + 1,
          prev + cost,
        );
        prev = temp;
      }
    }
    return dp[b.length];
  }

  int _min3(int x, int y, int z) => x < y ? (x < z ? x : z) : (y < z ? y : z);
}
