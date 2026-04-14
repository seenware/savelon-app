// lib/core/utils/contact_search.dart

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';

/// Smart in-memory contact search.
///
/// Supports:
/// - Multi-word AND logic: every token must match somewhere
/// - Full-field coverage: names, company, job, note, emails, addresses, links
/// - Phone digit-only matching: activates for any purely-numeric token (no letters),
///   no minimum length — preserves the monotonicity contract (more digits = fewer results)
/// - Phone fuzzy digit matching: 1-digit-off in any window for queries ≥ 7 digits
/// - Initials: "js" finds "John Smith"
/// - Combined name: "johndoe" finds "John Doe"
/// - Fuzzy 1-edit-distance: "Smoth" finds "Smith" (tokens ≥ 4 chars, name fields only)
class ContactSearch {
  ContactSearch._();

  /// Returns true if [contact] matches ALL whitespace-separated tokens in [query].
  static bool matches(Contact contact, String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return true;

    final tokens = trimmed
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();

    return tokens.every((token) => _matchesToken(contact, token));
  }

  static bool _matchesToken(Contact contact, String token) {
    // 1. Substring match across all text fields
    final textFields = [
      contact.firstName,
      contact.middleName,
      contact.lastName,
      contact.nickname,
      contact.company,
      contact.department,
      contact.jobTitle,
      contact.note,
      ...contact.emails.map((e) => e.address),
      ...contact.addresses.map((a) => a.address),
      ...contact.links.map((l) => l.url),
    ];

    final textMatch = textFields.any((f) => f.toLowerCase().contains(token));
    if (textMatch) return true;

    // 1.5. Fuzzy token match across all text fields.
    // This intentionally skips purely numeric queries (phone search is handled
    // separately) to avoid false positives in notes/addresses.
    if (_tokenHasLetters(token) && token.length >= 4) {
      if (_textFieldsFuzzyMatch(textFields, token)) return true;
    }

    // 2. Combined first+last with no space — "johndoe" matches "John Doe"
    final combined = '${contact.firstName}${contact.lastName}'.toLowerCase();
    if (combined.contains(token)) return true;

    // 3. Phone digit matching.
    //    Only activates when the token is purely numeric (digits, +, -, spaces,
    //    parentheses — no letters). A purely numeric token has no other
    //    interpretation: nobody searches a contact named "4". This preserves
    //    strict matching for short inputs by avoiding any length-based
    //    short-circuiting.
    //
    //    For longer queries we intentionally increase the edit tolerance; this
    //    may slightly expand results for longer inputs versus strict matching.
    //    For queries ≥ 7 digits a sliding-window fuzzy check also catches a
    //    single wrong, missing, or extra digit.
    //
    //    Important: if the token includes '+', we still fall back to the digit
    //    fuzzy matcher; otherwise "+<digits>" would incorrectly disable the
    //    distance-1 behavior for long numbers.
    final queryDigits = token.replaceAll(RegExp(r'\D'), '');
    final tokenIsNumeric =
        queryDigits.isNotEmpty && RegExp(r'^[\d\s+\-()\[\]]+$').hasMatch(token);
    final tokenHasPlus = token.contains('+');
    if (tokenIsNumeric) {
      final phoneDigitMatch = contact.phones.any(
        (p) => _phoneDigitsMatch(
          p.number.replaceAll(RegExp(r'\D'), ''),
          queryDigits,
        ),
      );
      if (tokenHasPlus) {
        final phonePlusMatch = contact.phones.any(
          (p) => _phonePlusAwareMatch(p.number, token),
        );
        if (phonePlusMatch) return true;
      }

      if (phoneDigitMatch) return true;
    }

    // 4. Initials — "js" matches "John Smith", "jds" matches "John D. Smith"
    if (RegExp(r'^[a-z]{2,4}$').hasMatch(token)) {
      final initials = [
        contact.firstName,
        contact.middleName,
        contact.lastName,
      ].where((s) => s.isNotEmpty).map((s) => s[0].toLowerCase()).join();
      if (initials.contains(token)) return true;
    }

    // 5. Fuzzy 1-edit-distance for typos — "Smoth" matches "Smith"
    //    Only for tokens ≥ 4 chars; only applied to name fields to avoid noise.
    //    Edit tolerance is dynamic (depends on token length) to allow
    //    occasional longer-distance typos for longer queries.
    if (token.length >= 4) {
      final nameFields = [
        contact.firstName,
        contact.lastName,
        contact.middleName,
        contact.nickname,
        contact.company,
      ].where((s) => s.isNotEmpty);

      final allowedEdits = _allowedNameEditDistance(token.length);
      for (final field in nameFields) {
        for (final word in field.toLowerCase().split(RegExp(r'\s+'))) {
          if (word.length >= 3 &&
              _levenshtein(word, token, maxDistance: allowedEdits) <=
                  allowedEdits) {
            return true;
          }
        }
      }
    }

    return false;
  }

  static bool _tokenHasLetters(String token) =>
      RegExp(r'[\p{L}]', unicode: true).hasMatch(token);

  static bool _textFieldsFuzzyMatch(List<String> fields, String token) {
    final allowedEdits = _allowedNameEditDistance(token.length);
    if (allowedEdits <= 0) return false;

    for (final field in fields) {
      final lower = field.toLowerCase();
      // Split into "words" while ignoring punctuation/symbols.
      final words = lower
          .split(RegExp(r'[^\p{L}\p{N}]+', unicode: true))
          .where((w) => w.isNotEmpty);
      for (final word in words) {
        if (word.length < 3) continue;
        // Quick length filter before computing Levenshtein.
        if ((word.length - token.length).abs() > allowedEdits) continue;
        if (_levenshtein(word, token, maxDistance: allowedEdits) <=
            allowedEdits) {
          return true;
        }
      }
    }

    return false;
  }

  /// Exact substring match first; then (for long enough queries) slides a
  /// window around [queryDigits] and accepts a query-length-dependent
  /// edit distance (catches wrong/missing/extra digits).
  static bool _phoneDigitsMatch(String phoneDigits, String queryDigits) {
    if (phoneDigits.contains(queryDigits)) return true;

    final allowedEdits = _allowedPhoneEditDistance(queryDigits.length);
    if (allowedEdits <= 0) return false;

    // Slide windows around the query length to catch insertions/deletions.
    // For k edits, a best-match window won't differ in length by more than k.
    final baseLen = queryDigits.length;
    final minWindow = (baseLen - allowedEdits).clamp(1, phoneDigits.length);
    final maxWindow = (baseLen + allowedEdits).clamp(1, phoneDigits.length);
    for (var windowSize = minWindow; windowSize <= maxWindow; windowSize++) {
      if (windowSize > phoneDigits.length) continue;
      for (var i = 0; i <= phoneDigits.length - windowSize; i++) {
        final window = phoneDigits.substring(i, i + windowSize);
        if (_levenshtein(window, queryDigits, maxDistance: allowedEdits) <=
            allowedEdits) {
          return true;
        }
      }
    }

    return false;
  }

  /// Phone matching tolerance policy.
  ///
  /// Goals:
  /// - Very short queries should be exact (0 edits).
  /// - Once the query is long enough, tolerate up to 1 edit (typo).
  /// - For longer queries, tolerate up to 2+ edits to handle more
  ///   formatting/transcription mistakes.
  ///
  /// This is intentionally conservative (cap at 3) to avoid false positives.
  static int _allowedPhoneEditDistance(int queryLength) {
    if (queryLength < 7) return 0;

    // 7-9 digits => 1 edit
    // 10-12 digits => 2 edits
    // 13-15 digits => 3 edits
    final edits = ((queryLength - 7) / 3).floor() + 1;
    return edits.clamp(1, 3);
  }

  /// Name typo tolerance policy.
  ///
  /// We keep it conservative to avoid false positives when searching short
  /// names, but we allow larger edit distances for longer query tokens.
  static int _allowedNameEditDistance(int tokenLength) {
    if (tokenLength < 7) return 1;
    if (tokenLength < 10) return 2;
    return 2; // cap at 2 to keep search noise low
  }

  /// Standard Levenshtein distance with an early-exit optimisation:
  /// returns >[maxDistance] immediately when the length difference exceeds it.
  static int _levenshtein(String a, String b, {int maxDistance = 1}) {
    if (a == b) return 0;
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;
    if ((a.length - b.length).abs() > maxDistance) return maxDistance + 1;

    final dp = List.generate(
      a.length + 1,
      (i) => List.generate(b.length + 1, (j) {
        if (i == 0) return j;
        if (j == 0) return i;
        return 0;
      }),
    );

    for (var i = 1; i <= a.length; i++) {
      var rowMin = 1 << 30;
      for (var j = 1; j <= b.length; j++) {
        dp[i][j] = a[i - 1] == b[j - 1]
            ? dp[i - 1][j - 1]
            : 1 + _min3(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]);
        if (dp[i][j] < rowMin) rowMin = dp[i][j];
      }
      // If the best possible value in this row already exceeds the threshold,
      // no later rows can bring it back under the threshold.
      if (rowMin > maxDistance) return maxDistance + 1;
    }

    return dp[a.length][b.length];
  }

  static int _min3(int a, int b, int c) =>
      a < b ? (a < c ? a : c) : (b < c ? b : c);

  static bool _phonePlusAwareMatch(String phoneRaw, String tokenRaw) {
    final phoneNormalized = phoneRaw.replaceAll(RegExp(r'[\s\-\(\)\[\]]'), '');
    final tokenNormalized = tokenRaw.replaceAll(RegExp(r'[\s\-\(\)\[\]]'), '');
    return phoneNormalized.toLowerCase().contains(
      tokenNormalized.toLowerCase(),
    );
  }
}
