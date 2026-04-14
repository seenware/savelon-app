import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppReviewService {
  Future<void> maybePromptReviewOnce();
}

class InAppReviewService implements AppReviewService {
  static const String _reviewPromptHandledKey = 'review_prompt_handled_once';

  const InAppReviewService();

  @override
  Future<void> maybePromptReviewOnce() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyHandled = prefs.getBool(_reviewPromptHandledKey) ?? false;
    if (alreadyHandled) return;

    // Mark as handled before requesting, so we never repeat this flow.
    await prefs.setBool(_reviewPromptHandledKey, true);

    try {
      final inAppReview = InAppReview.instance;
      final isAvailable = await inAppReview.isAvailable();
      if (!isAvailable) return;
      await inAppReview.requestReview();
    } catch (_) {
      // Best effort only: ignore failures and keep "handled" persisted.
    }
  }
}

final appReviewServiceProvider = Provider<AppReviewService>(
  (ref) => const InAppReviewService(),
);
