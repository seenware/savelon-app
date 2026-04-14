// lib/core/theme/app_breakpoints.dart

import 'package:flutter/material.dart';

/// App-wide responsive breakpoints
class AppBreakpoints {
  AppBreakpoints._();

  /// Wide-screen breakpoint (700px and above — tablets, desktop windows)
  static const double wide = 700;

  /// Returns true for wide screens (tablets in landscape, desktop windows)
  static bool isWide(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= wide;
  }

  /// Returns true for compact screens (phones, small windows)
  static bool isCompact(BuildContext context) {
    return MediaQuery.sizeOf(context).width < wide;
  }

  /// Get responsive value based on current breakpoint
  static T responsive<T>(
    BuildContext context, {
    required T compact,
    required T wide,
  }) {
    return isWide(context) ? wide : compact;
  }
}
