import 'entities/contact.dart';

const String nonLetterSectionKey = '#';

enum ContactNameScript {
  latin,
  cyrillic,
  greek,
  other,
  nonLetter,
}

final List<ContactNameScript> _scriptOrder = <ContactNameScript>[
  ContactNameScript.latin,
  ContactNameScript.cyrillic,
  ContactNameScript.greek,
  ContactNameScript.other,
  ContactNameScript.nonLetter,
];

class ContactSectioning {
  static String sectionKeyForContact(Contact contact) {
    final key = contact.sortKey.trimLeft();
    if (key.isEmpty) return nonLetterSectionKey;

    final firstChar = String.fromCharCode(key.runes.first);
    if (_isDecimalDigit(firstChar) || _isSymbolLike(firstChar)) {
      return nonLetterSectionKey;
    }

    if (_isLatin(firstChar) || _isCyrillic(firstChar) || _isGreek(firstChar)) {
      return firstChar.toUpperCase();
    }

    if (_isOtherLetter(firstChar)) {
      return firstChar;
    }

    return nonLetterSectionKey;
  }

  static ContactNameScript scriptForSectionKey(String sectionKey) {
    if (sectionKey == nonLetterSectionKey || sectionKey.isEmpty) {
      return ContactNameScript.nonLetter;
    }

    final normalized = String.fromCharCode(sectionKey.runes.first);
    if (_isLatin(normalized)) return ContactNameScript.latin;
    if (_isCyrillic(normalized)) return ContactNameScript.cyrillic;
    if (_isGreek(normalized)) return ContactNameScript.greek;
    if (_isOtherLetter(normalized)) return ContactNameScript.other;
    return ContactNameScript.nonLetter;
  }

  static int compareSectionKeys(String a, String b) {
    final scriptA = scriptForSectionKey(a);
    final scriptB = scriptForSectionKey(b);

    final rankA = _scriptOrder.indexOf(scriptA);
    final rankB = _scriptOrder.indexOf(scriptB);
    if (rankA != rankB) return rankA.compareTo(rankB);

    if (scriptA == ContactNameScript.nonLetter) return 0;
    return a.compareTo(b);
  }
}

bool _isDecimalDigit(String ch) => RegExp(r'^\d$').hasMatch(ch);

bool _isSymbolLike(String ch) {
  if (ch.trim().isEmpty) return true;
  if (_isDecimalDigit(ch)) return false;
  if (_isLatin(ch) || _isCyrillic(ch) || _isGreek(ch) || _isOtherLetter(ch)) {
    return false;
  }
  return true;
}

bool _isLatin(String ch) {
  final cp = ch.runes.first;
  return _inRange(cp, 0x0041, 0x005A) ||
      _inRange(cp, 0x0061, 0x007A) ||
      _inRange(cp, 0x00C0, 0x00FF) ||
      _inRange(cp, 0x0100, 0x017F) ||
      _inRange(cp, 0x0180, 0x024F) ||
      _inRange(cp, 0x1E00, 0x1EFF);
}

bool _isCyrillic(String ch) {
  final cp = ch.runes.first;
  return _inRange(cp, 0x0400, 0x052F) ||
      _inRange(cp, 0x2DE0, 0x2DFF) ||
      _inRange(cp, 0xA640, 0xA69F) ||
      _inRange(cp, 0x1C80, 0x1C8F);
}

bool _isGreek(String ch) {
  final cp = ch.runes.first;
  return _inRange(cp, 0x0370, 0x03FF) || _inRange(cp, 0x1F00, 0x1FFF);
}

bool _isOtherLetter(String ch) {
  final cp = ch.runes.first;

  if (_inRange(cp, 0x3040, 0x30FF) || // Hiragana + Katakana
      _inRange(cp, 0x3400, 0x9FFF) || // CJK Unified Ideographs
      _inRange(cp, 0xAC00, 0xD7AF) || // Hangul syllables
      _inRange(cp, 0x1100, 0x11FF) || // Hangul Jamo
      _inRange(cp, 0x0590, 0x05FF) || // Hebrew
      _inRange(cp, 0x0600, 0x08FF) || // Arabic blocks
      _inRange(cp, 0x0900, 0x0D7F) || // Indic scripts (common blocks)
      _inRange(cp, 0x0E00, 0x0E7F) || // Thai
      _inRange(cp, 0x10A0, 0x10FF)) {
    // Georgian
    return true;
  }

  // Covers many bicameral scripts without enumerating every block.
  return ch.toUpperCase() != ch.toLowerCase();
}

bool _inRange(int cp, int start, int end) => cp >= start && cp <= end;
