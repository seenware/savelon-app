import 'package:contacts/core/purchases/purchases_service.dart';
import 'package:contacts/features/startup/paywall/presentation/paywall_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final premiumAccessProvider = FutureProvider<bool>((ref) async {
  return PurchasesService.hasPremiumAccess();
});

class PremiumGate {
  static Future<bool> ensurePremium(BuildContext context) async {
    final hasPremium = await PurchasesService.hasPremiumAccess();
    if (hasPremium) {
      return true;
    }
    if (!context.mounted) return false;
    final unlocked = await Navigator.of(context, rootNavigator: true).push<bool>(
      PageRouteBuilder<bool>(
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PaywallPage(softMode: true),
      ),
    );
    return unlocked ?? false;
  }
}
