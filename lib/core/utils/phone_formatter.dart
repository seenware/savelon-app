// lib/core/utils/phone_formatter.dart

import 'package:flutter/services.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneFormatter {
  PhoneFormatter._();

  /// Formats a raw phone string for display.
  /// Returns the country-accurate formatted string when parseable,
  /// otherwise returns the cleaned raw input unchanged.
  static String format(String raw) {
    final trimmed = raw.trim();

    if (trimmed.isEmpty) return raw;

    // Only attempt to parse and format explicit international numbers.
    // Avoid inferring a country code for local or short numeric inputs.
    if (!trimmed.startsWith('+')) return trimmed;

    try {
      final parsed = PhoneNumber.parse(trimmed);
      final nsn = parsed.formatNsn();
      return '+${parsed.countryCode} $nsn';
    } catch (_) {
      return trimmed;
    }
  }
}

/// Reformats the phone field on each keystroke using [phone_numbers_parser].
/// Falls back gracefully to cleaned raw digits while the number is incomplete.
class PhoneInputFormatter extends TextInputFormatter {
  int _mapSelectionOffset({
    required String rawText,
    required String formattedText,
    required int rawOffset,
  }) {
    final safeRawOffset = rawOffset.clamp(0, rawText.length);
    final prefix = rawText.substring(0, safeRawOffset);
    final digitsBefore = RegExp(r'\d').allMatches(prefix).length;
    final wantsPlus = prefix.contains('+') && formattedText.startsWith('+');

    if (digitsBefore == 0) {
      return wantsPlus ? 1 : 0;
    }

    var seenDigits = 0;
    for (var i = 0; i < formattedText.length; i++) {
      final ch = formattedText[i];
      if (RegExp(r'\d').hasMatch(ch)) {
        seenDigits++;
        if (seenDigits == digitsBefore) {
          return i + 1;
        }
      }
    }

    return formattedText.length;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) return newValue;

    // Only format international numbers — user must type + explicitly.
    // Prevents bare digits being parsed as both country code and national number.
    if (!text.startsWith('+')) return newValue;

    final isDeleting = newValue.text.length < oldValue.text.length;

    try {
      final parsed = PhoneNumber.parse(text);
      final nsn = parsed.formatNsn();
      final formatted = '+${parsed.countryCode} $nsn';

      // When deleting, don't re-expand — prevents backspace getting stuck at the country code prefix.
      if (isDeleting && formatted.length > text.length) {
        return newValue;
      }

      final mappedBase = _mapSelectionOffset(
        rawText: text,
        formattedText: formatted,
        rawOffset: newValue.selection.baseOffset,
      );
      final mappedExtent = _mapSelectionOffset(
        rawText: text,
        formattedText: formatted,
        rawOffset: newValue.selection.extentOffset,
      );

      if (mappedBase >= 0 &&
          mappedExtent >= 0 &&
          mappedBase <= formatted.length &&
          mappedExtent <= formatted.length) {
        return TextEditingValue(
          text: formatted,
          selection: TextSelection(
            baseOffset: mappedBase,
            extentOffset: mappedExtent,
          ),
        );
      }

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    } catch (_) {
      return newValue;
    }
  }
}
