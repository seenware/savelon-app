import 'entities/contact.dart';
import 'duplicate_thresholds.dart';
import 'name_similarity.dart';
import 'phone_similarity.dart';
import 'text_normalization.dart';

class DuplicateScoringPolicyResult {
  final double score;
  final List<String> signals;

  const DuplicateScoringPolicyResult({required this.score, required this.signals});
}

class ContactDuplicateEvidence {
  final Contact contact;
  final Set<String> phoneSet;
  final Set<String> emailSet;
  final Set<String> profileIdSet;
  final Set<String> notePhoneSet;
  final Set<String> noteEmailSet;
  final Set<String> noteProfileSet;
  final Set<String> addressSet;
  final Set<String> linkSet;
  final Set<String> nameTokens;
  final Set<String> profileNameTokens;
  final String companyNormalized;
  final String jobTitleNormalized;

  const ContactDuplicateEvidence({
    required this.contact,
    required this.phoneSet,
    required this.emailSet,
    required this.profileIdSet,
    required this.notePhoneSet,
    required this.noteEmailSet,
    required this.noteProfileSet,
    required this.addressSet,
    required this.linkSet,
    required this.nameTokens,
    required this.profileNameTokens,
    required this.companyNormalized,
    required this.jobTitleNormalized,
  });
}

class DuplicateScoringPolicy {
  final PhoneSimilarity phoneSimilarity;
  final NameSimilarity nameSimilarity;

  const DuplicateScoringPolicy({
    this.phoneSimilarity = const PhoneSimilarity(),
    this.nameSimilarity = const NameSimilarity(),
  });

  DuplicateScoringPolicyResult score(Contact left, Contact right) {
    final leftEvidence = buildEvidence(left);
    final rightEvidence = buildEvidence(right);
    return scoreWithEvidence(leftEvidence, rightEvidence);
  }

  DuplicateScoringPolicyResult scoreWithEvidence(
    ContactDuplicateEvidence leftEvidence,
    ContactDuplicateEvidence rightEvidence,
  ) {
    final left = leftEvidence.contact;
    final right = rightEvidence.contact;
    var score = 0.0;
    final signals = <String>{};

    final phoneResult = phoneSimilarity.compare(
      left.phones.map((p) => p.number),
      right.phones.map((p) => p.number),
    );
    if (phoneResult.score > 0) {
      score += phoneResult.score * 0.7;
      signals.addAll(phoneResult.signals);
    }

    final emailScore = _setOverlapScore(leftEvidence.emailSet, rightEvidence.emailSet);
    if (emailScore > 0) {
      score += emailScore * 0.28;
      signals.add('email_overlap');
    }

    final nameResult = nameSimilarity.compare(
      leftFullName: left.fullName,
      rightFullName: right.fullName,
      leftNickname: left.nickname,
      rightNickname: right.nickname,
    );
    if (nameResult.score > 0) {
      score += nameResult.score * 0.32;
      signals.addAll(nameResult.signals);
    }

    final companyScore = leftEvidence.companyNormalized.isNotEmpty &&
            leftEvidence.companyNormalized == rightEvidence.companyNormalized
        ? 0.12
        : 0.0;
    if (companyScore > 0) {
      score += companyScore;
      signals.add('company_match');
    }

    final jobScore = leftEvidence.jobTitleNormalized.isNotEmpty &&
            leftEvidence.jobTitleNormalized == rightEvidence.jobTitleNormalized
        ? 0.08
        : 0.0;
    if (jobScore > 0) {
      score += jobScore;
      signals.add('job_title_match');
    }

    final addressScore = _setOverlapScore(
      leftEvidence.addressSet,
      rightEvidence.addressSet,
    );
    if (addressScore > 0) {
      score += addressScore * 0.12;
      signals.add('address_overlap');
    }

    final linkScore = _setOverlapScore(leftEvidence.linkSet, rightEvidence.linkSet);
    if (linkScore > 0) {
      score += linkScore * 0.08;
      signals.add('link_overlap');
    }

    if (phoneResult.score >= 1.0) {
      score = score < DuplicateThresholds.strongEdgeThreshold
          ? DuplicateThresholds.strongEdgeThreshold
          : score;
      signals.add('phone_strong_identifier');
    }
    if (emailScore > 0) {
      score = score < DuplicateThresholds.strongEdgeThreshold
          ? DuplicateThresholds.strongEdgeThreshold
          : score;
      signals.add('email_strong_identifier');
    }
    final expandedPhoneOverlap =
        leftEvidence.phoneSet.intersection(rightEvidence.phoneSet).isNotEmpty;
    final expandedEmailOverlap =
        leftEvidence.emailSet.intersection(rightEvidence.emailSet).isNotEmpty;
    final expandedProfileOverlap =
        leftEvidence.profileIdSet.intersection(rightEvidence.profileIdSet).isNotEmpty;
    if (expandedPhoneOverlap || expandedEmailOverlap) {
      score = score < DuplicateThresholds.strongEdgeThreshold
          ? DuplicateThresholds.strongEdgeThreshold
          : score;
      signals.add('expanded_identifier_overlap');
    }
    if (expandedProfileOverlap) {
      score = score < DuplicateThresholds.strongEdgeThreshold
          ? DuplicateThresholds.strongEdgeThreshold
          : score;
      signals.add('profile_identifier_overlap');
    }
    if (nameResult.signals.contains('name_exact_full')) {
      score = score < DuplicateThresholds.groupingThreshold
          ? DuplicateThresholds.groupingThreshold
          : score;
      signals.add('name_exact_duplicate_baseline');
    }
    final hasExactNameTokenSetMatch = _hasExactNameTokenSetMatch(
      left.fullName,
      right.fullName,
    );
    if (hasExactNameTokenSetMatch) {
      score = score < DuplicateThresholds.groupingThreshold
          ? DuplicateThresholds.groupingThreshold
          : score;
      signals.add('name_token_set_exact');
    }
    final hasNameProfileMatch = _hasExactNameProfileMatch(left, right);
    if (hasNameProfileMatch) {
      score = score < DuplicateThresholds.groupingThreshold
          ? DuplicateThresholds.groupingThreshold
          : score;
      signals.add('name_profile_match');
    }
    final notePhoneScore = _setOverlapScore(
      leftEvidence.notePhoneSet,
      rightEvidence.notePhoneSet,
    );
    if (notePhoneScore > 0) {
      score += notePhoneScore * 0.12;
      signals.add('note_phone_overlap');
    }
    final noteEmailScore = _setOverlapScore(
      leftEvidence.noteEmailSet,
      rightEvidence.noteEmailSet,
    );
    if (noteEmailScore > 0) {
      score += noteEmailScore * 0.1;
      signals.add('note_email_overlap');
    }
    final noteProfileScore = _setOverlapScore(
      leftEvidence.noteProfileSet,
      rightEvidence.noteProfileSet,
    );
    if (noteProfileScore > 0) {
      score += noteProfileScore * 0.08;
      signals.add('note_profile_overlap');
    }

    final penaltyFactor = _conflictPenaltyFactor(
      left: left,
      right: right,
      phoneSimilarityScore: phoneResult.score,
      emailSimilarityScore: emailScore,
      nameSimilarityScore: nameResult.score,
      hasExactNameTokenSetMatch: hasExactNameTokenSetMatch,
      hasNameProfileMatch: hasNameProfileMatch,
      hasExpandedStrongIdentifier: expandedPhoneOverlap || expandedEmailOverlap || expandedProfileOverlap,
      supportingSignalCount: _countSupportingSignals(signals),
    );
    if (penaltyFactor > 0) {
      score -= 0.12 * penaltyFactor;
      signals.add('strong_identifier_conflict_penalty');
    }

    return DuplicateScoringPolicyResult(
      score: score.clamp(0.0, 1.0),
      signals: signals.toList()..sort(),
    );
  }

  bool isPotentialDuplicate(double score) =>
      score >= DuplicateThresholds.potentialDuplicateThreshold;

  ContactDuplicateEvidence buildEvidence(Contact contact) {
    final notePhones = _phonesFromText(contact.note);
    final noteEmails = _emailsFromText(contact.note);
    final noteUrls = _urlsFromText(contact.note);
    final phoneSet = {
      ...contact.phones
          .map((p) => TextNormalization.digitsOnly(p.number))
          .where((p) => p.length >= 2),
      ...notePhones,
    };
    final emailSet = {
      ...contact.emails
          .map((e) => _canonicalEmail(e.address))
          .where((e) => e.isNotEmpty),
      ...noteEmails,
      ...contact.links
          .map((l) => _canonicalEmail(l.url))
          .where((e) => e.isNotEmpty),
    };
    final profileSet = {
      ...contact.links
          .map((l) => _profileIdFromUrl(l.url))
          .where((p) => p.isNotEmpty),
      ...noteUrls.map(_profileIdFromUrl).where((p) => p.isNotEmpty),
    };
    return ContactDuplicateEvidence(
      contact: contact,
      phoneSet: phoneSet,
      emailSet: emailSet,
      profileIdSet: profileSet,
      notePhoneSet: notePhones,
      noteEmailSet: noteEmails,
      noteProfileSet: noteUrls.map(_profileIdFromUrl).where((p) => p.isNotEmpty).toSet(),
      addressSet: contact.addresses
          .map((a) => TextNormalization.normalizeText(a.address))
          .where((value) => value.isNotEmpty)
          .toSet(),
      linkSet: contact.links
          .map((l) => TextNormalization.normalizeText(l.url))
          .where((value) => value.isNotEmpty)
          .toSet(),
      nameTokens: TextNormalization.tokenize(contact.fullName).toSet(),
      profileNameTokens: _profileNameTokens(contact),
      companyNormalized: TextNormalization.normalizeText(contact.company),
      jobTitleNormalized: TextNormalization.normalizeText(contact.jobTitle),
    );
  }

  double _setOverlapScore(Set<String> left, Set<String> right) {
    if (left.isEmpty || right.isEmpty) return 0;
    final overlap = left.intersection(right).length;
    if (overlap == 0) return 0;
    final minSize = left.length < right.length ? left.length : right.length;
    return overlap / minSize;
  }

  double _conflictPenaltyFactor({
    required Contact left,
    required Contact right,
    required double phoneSimilarityScore,
    required double emailSimilarityScore,
    required double nameSimilarityScore,
    required bool hasExactNameTokenSetMatch,
    required bool hasNameProfileMatch,
    required bool hasExpandedStrongIdentifier,
    required int supportingSignalCount,
  }) {
    if (phoneSimilarityScore >= 0.78 || emailSimilarityScore > 0) {
      return 0;
    }
    if (hasExactNameTokenSetMatch || hasNameProfileMatch || hasExpandedStrongIdentifier) {
      return 0;
    }
    if (nameSimilarityScore >= 0.52) return 0;

    final weakNameSimilarity = _hasWeakNameSimilarity(left.fullName, right.fullName);
    if (!weakNameSimilarity) return 0;
    if (supportingSignalCount >= 3) return 0.35;
    if (supportingSignalCount >= 1) return 0.6;
    return 1.0;
  }

  int _levenshtein(String a, String b) {
    if (a == b) return 0;
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;
    final dp = List<int>.generate(b.length + 1, (i) => i);
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

  bool _hasExactNameTokenSetMatch(String leftName, String rightName) {
    final left = TextNormalization.tokenize(leftName).toSet();
    final right = TextNormalization.tokenize(rightName).toSet();
    if (left.isEmpty || right.isEmpty) return false;
    if (left.length < 2 || right.length < 2) return false;
    return left.length == right.length && left.difference(right).isEmpty;
  }

  bool _hasExactNameProfileMatch(Contact left, Contact right) {
    final leftProfile = _profileNameTokens(left);
    final rightProfile = _profileNameTokens(right);
    if (leftProfile.isEmpty || rightProfile.isEmpty) return false;
    if (leftProfile.length < 2 || rightProfile.length < 2) return false;
    return leftProfile.length == rightProfile.length &&
        leftProfile.difference(rightProfile).isEmpty;
  }

  Set<String> _profileNameTokens(Contact contact) {
    return {
      ...TextNormalization.tokenize(contact.prefix),
      ...TextNormalization.tokenize(contact.fullName),
      ...TextNormalization.tokenize(contact.middleName),
      ...TextNormalization.tokenize(contact.suffix),
      ...TextNormalization.tokenize(contact.nickname),
    };
  }

  String _canonicalEmail(String raw) {
    final trimmed = raw.trim().toLowerCase();
    if (trimmed.isEmpty) return '';
    final atIndex = trimmed.indexOf('@');
    if (atIndex <= 0 || atIndex == trimmed.length - 1) return '';

    var local = trimmed.substring(0, atIndex);
    var domain = trimmed.substring(atIndex + 1);
    if (domain == 'googlemail.com') domain = 'gmail.com';

    final plusIndex = local.indexOf('+');
    if (plusIndex >= 0) {
      local = local.substring(0, plusIndex);
    }
    if (domain == 'gmail.com') {
      local = local.replaceAll('.', '');
    }
    if (local.isEmpty || domain.isEmpty) return '';
    return '$local@$domain';
  }

  Set<String> _phonesFromText(String value) {
    final matches = RegExp(r'(?<!\d)\+?\d[\d\-\s().]{1,}\d').allMatches(value);
    return matches
        .map((m) => TextNormalization.digitsOnly(m.group(0) ?? ''))
        .where((d) => d.length >= 2)
        .toSet();
  }

  Set<String> _emailsFromText(String value) {
    final matches = RegExp(r'\b[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}\b')
        .allMatches(value);
    return matches
        .map((m) => _canonicalEmail(m.group(0) ?? ''))
        .where((e) => e.isNotEmpty)
        .toSet();
  }

  Set<String> _urlsFromText(String value) {
    final matches =
        RegExp(r'\b((https?:\/\/)?[A-Za-z0-9.-]+\.[A-Za-z]{2,}(\/[^\s]*)?)\b')
            .allMatches(value);
    return matches
        .map((m) => m.group(1) ?? '')
        .where((u) => u.isNotEmpty)
        .toSet();
  }

  String _profileIdFromUrl(String raw) {
    var value = raw.trim().toLowerCase();
    if (value.isEmpty) return '';
    if (!value.startsWith('http://') && !value.startsWith('https://')) {
      value = 'https://$value';
    }
    final uri = Uri.tryParse(value);
    if (uri == null || uri.host.isEmpty) return '';
    final host = uri.host.startsWith('www.') ? uri.host.substring(4) : uri.host;
    final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) return '';
    final key = '$host/${segments.first}';
    final last = segments.last;
    if (last.length < 2) return '';
    return '$key:$last';
  }

  bool _hasWeakNameSimilarity(String leftFullName, String rightFullName) {
    final leftName = TextNormalization.normalizeText(leftFullName);
    final rightName = TextNormalization.normalizeText(rightFullName);
    return leftName.isNotEmpty &&
        rightName.isNotEmpty &&
        !leftName.contains(rightName) &&
        !rightName.contains(leftName) &&
        _levenshtein(leftName, rightName) > 5;
  }

  int _countSupportingSignals(Set<String> signals) {
    const supportingPrefixes = {
      'name_first_',
      'name_token_overlap',
      'note_',
      'company_match',
      'job_title_match',
      'address_overlap',
      'link_overlap',
      'phone_near_digits',
      'phone_suffix_match',
    };
    return signals
        .where(
          (signal) => supportingPrefixes.any(
            (prefix) => signal.startsWith(prefix) || signal == prefix,
          ),
        )
        .length;
  }
}
