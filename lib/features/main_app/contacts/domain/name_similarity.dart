import 'text_normalization.dart';

class NameSimilarityResult {
  final double score;
  final List<String> signals;

  const NameSimilarityResult({required this.score, required this.signals});
}

class NameSimilarity {
  const NameSimilarity();

  NameSimilarityResult compare({
    required String leftFullName,
    required String rightFullName,
    required String leftNickname,
    required String rightNickname,
  }) {
    final left = TextNormalization.tokenize(leftFullName);
    final right = TextNormalization.tokenize(rightFullName);

    if (left.isEmpty || right.isEmpty) {
      return const NameSimilarityResult(score: 0, signals: []);
    }

    var score = 0.0;
    final signals = <String>{};

    final leftJoined = left.join(' ');
    final rightJoined = right.join(' ');
    if (leftJoined == rightJoined) {
      return const NameSimilarityResult(
        score: 1.0,
        signals: ['name_exact_full'],
      );
    }

    final leftLast = left.isNotEmpty ? left.last : '';
    final rightLast = right.isNotEmpty ? right.last : '';
    if (leftLast.isNotEmpty && leftLast == rightLast) {
      score += 0.35;
      signals.add('name_same_last');
    }

    final firstScore = _firstNameSimilarity(left.first, right.first);
    if (firstScore >= 0.9) {
      score += 0.4;
      signals.add('name_first_exact');
    } else if (firstScore >= 0.75) {
      score += 0.3;
      signals.add('name_first_prefix');
    } else if (firstScore >= 0.55) {
      score += 0.2;
      signals.add('name_first_edit_distance');
    }

    final overlap = left.toSet().intersection(right.toSet()).length;
    if (overlap > 0) {
      score += (overlap * 0.08).clamp(0.0, 0.2);
      signals.add('name_token_overlap');
    }

    final nickBoost = _nicknameSimilarity(leftNickname, rightNickname);
    if (nickBoost > 0) {
      score += nickBoost;
      signals.add('name_nickname_match');
    }

    return NameSimilarityResult(
      score: score.clamp(0.0, 1.0),
      signals: signals.toList(),
    );
  }

  double _firstNameSimilarity(String left, String right) {
    if (left == right) return 1;

    if (left.length >= 3 &&
        right.length >= 3 &&
        (left.startsWith(right) || right.startsWith(left))) {
      return 0.8;
    }

    final distance = _levenshtein(left, right);
    final maxLen = left.length > right.length ? left.length : right.length;
    if (maxLen == 0) return 0;
    return 1 - (distance / maxLen);
  }

  double _nicknameSimilarity(String leftNickname, String rightNickname) {
    final left = TextNormalization.normalizeText(leftNickname);
    final right = TextNormalization.normalizeText(rightNickname);
    if (left.isEmpty || right.isEmpty) return 0;
    if (left == right) return 0.15;
    return 0;
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
        dp[j] = _min3(dp[j] + 1, dp[j - 1] + 1, prev + cost);
        prev = temp;
      }
    }
    return dp[b.length];
  }

  int _min3(int x, int y, int z) => x < y ? (x < z ? x : z) : (y < z ? y : z);
}
