import 'package:contacts/core/purchases/purchases_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PurchasesService.classifyRefreshError', () {
    test('maps Android Play account errors to storeAccountUnavailable', () {
      final result = PurchasesService.classifyRefreshError(
        Exception('Google Play sign in required for billing'),
        isAndroid: true,
      );

      expect(result, SubscriptionRefreshResult.storeAccountUnavailable);
    });

    test(
      'maps Android billing unavailable errors to storeAccountUnavailable',
      () {
        final result = PurchasesService.classifyRefreshError(
          Exception('Billing unavailable on this device'),
          isAndroid: true,
        );

        expect(result, SubscriptionRefreshResult.storeAccountUnavailable);
      },
    );

    test('keeps non-Android store errors as generic error', () {
      final result = PurchasesService.classifyRefreshError(
        Exception('Google Play sign in required for billing'),
        isAndroid: false,
      );

      expect(result, SubscriptionRefreshResult.error);
    });

    test('keeps unknown errors as generic error', () {
      final result = PurchasesService.classifyRefreshError(
        Exception('something unexpected happened'),
        isAndroid: true,
      );

      expect(result, SubscriptionRefreshResult.error);
    });
  });
}
