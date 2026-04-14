class TextNormalization {
  TextNormalization._();

  static String normalizeText(String value) {
    final lower = value.trim().toLowerCase();
    final folded = _stripDiacritics(lower);
    final phonetic = _normalizePhoneticSequences(folded);
    return phonetic
        .replaceAll(RegExp(r'[^\p{L}\p{N}\s]', unicode: true), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  static List<String> tokenize(String value) {
    final normalized = normalizeText(value);
    if (normalized.isEmpty) return const [];
    return normalized.split(' ').where((token) => token.isNotEmpty).toList();
  }

  static String digitsOnly(String value) => value.replaceAll(RegExp(r'\D'), '');

  static String _normalizePhoneticSequences(String value) {
    var out = value;
    const replacements = <MapEntry<String, String>>[
      MapEntry('shch', 'sh'),
      MapEntry('ph', 'f'),
      MapEntry('th', 's'),
      MapEntry('ck', 'k'),
      MapEntry('ya', 'ia'),
      MapEntry('eu', 'u'),
      MapEntry('zh', 'j'),
      MapEntry('sh', 's'),
      MapEntry('ch', 'k'),
      MapEntry('ts', 's'),
      MapEntry('z', 's'),
      MapEntry('c', 'k'),
    ];
    for (final entry in replacements) {
      out = out.replaceAll(entry.key, entry.value);
    }
    return out;
  }

  static String _stripDiacritics(String value) {
    const map = <String, String>{
      'á': 'a',
      'à': 'a',
      'ä': 'a',
      'â': 'a',
      'ã': 'a',
      'å': 'a',
      'ā': 'a',
      'ă': 'a',
      'ą': 'a',
      'æ': 'ae',
      'ç': 'c',
      'ć': 'c',
      'č': 'c',
      'ď': 'd',
      'ð': 'd',
      'é': 'e',
      'è': 'e',
      'ë': 'e',
      'ê': 'e',
      'ě': 'e',
      'ė': 'e',
      'ę': 'e',
      'í': 'i',
      'ì': 'i',
      'ï': 'i',
      'î': 'i',
      'ł': 'l',
      'œ': 'oe',
      'ñ': 'n',
      'ń': 'n',
      'ó': 'o',
      'ò': 'o',
      'ö': 'o',
      'ô': 'o',
      'õ': 'o',
      'ø': 'o',
      'ř': 'r',
      'ś': 's',
      'š': 's',
      'ß': 'ss',
      'ť': 't',
      'ú': 'u',
      'ù': 'u',
      'ü': 'u',
      'û': 'u',
      'þ': 'th',
      'ý': 'y',
      'ÿ': 'y',
      'ž': 'z',
      'ź': 'z',
      'ż': 'z',
      // Cyrillic transliteration (recall-first duplicate matching).
      'а': 'a',
      'б': 'b',
      'в': 'v',
      'г': 'g',
      'ґ': 'g',
      'д': 'd',
      'е': 'e',
      'є': 'ie',
      'ё': 'e',
      'ж': 'zh',
      'з': 'z',
      'и': 'i',
      'і': 'i',
      'ї': 'i',
      'й': 'i',
      'к': 'k',
      'л': 'l',
      'м': 'm',
      'н': 'n',
      'о': 'o',
      'п': 'p',
      'р': 'r',
      'с': 's',
      'т': 't',
      'у': 'u',
      'ф': 'f',
      'х': 'kh',
      'ц': 'ts',
      'ч': 'ch',
      'ш': 'sh',
      'щ': 'shch',
      'ы': 'y',
      'э': 'e',
      'ю': 'iu',
      'я': 'ia',
      'ь': '',
      'ъ': '',
      // Greek transliteration.
      'α': 'a',
      'ά': 'a',
      'β': 'v',
      'γ': 'g',
      'δ': 'd',
      'ε': 'e',
      'έ': 'e',
      'ζ': 'z',
      'η': 'i',
      'ή': 'i',
      'θ': 'th',
      'ι': 'i',
      'ί': 'i',
      'ϊ': 'i',
      'ΐ': 'i',
      'κ': 'k',
      'λ': 'l',
      'μ': 'm',
      'ν': 'n',
      'ξ': 'x',
      'ο': 'o',
      'ό': 'o',
      'π': 'p',
      'ρ': 'r',
      'σ': 's',
      'ς': 's',
      'τ': 't',
      'υ': 'y',
      'ύ': 'y',
      'ϋ': 'y',
      'ΰ': 'y',
      'φ': 'f',
      'χ': 'ch',
      'ψ': 'ps',
      'ω': 'o',
      'ώ': 'o',
    };
    final buffer = StringBuffer();
    for (final rune in value.runes) {
      final ch = String.fromCharCode(rune);
      buffer.write(map[ch] ?? ch);
    }
    return buffer.toString();
  }
}
