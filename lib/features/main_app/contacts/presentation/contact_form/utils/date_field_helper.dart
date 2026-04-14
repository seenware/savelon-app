import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFieldHelper {
  static const String dateFormat = 'MMM d, y';

  /// Parses a date string to DateTime, returns current date if parsing fails
  static DateTime parseDateOrDefault(String dateString, String localeName) {
    if (dateString.isEmpty) {
      return DateTime.now();
    }

    try {
      return DateFormat(dateFormat, localeName).parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }

  /// Formats a DateTime to the standard date string format
  static String formatDate(DateTime date, String localeName) {
    return DateFormat(dateFormat, localeName).format(date);
  }

  /// Shows a date picker dialog and returns the selected date
  static Future<DateTime?> selectDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
    );
  }
}
