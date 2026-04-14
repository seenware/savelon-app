// lib/features/startup/subscription/presentation/subscription_soft_warning_route.dart

import 'package:contacts/features/startup/subscription/presentation/subscription_soft_warning_page.dart';
import 'package:go_router/go_router.dart';

GoRoute subscriptionSoftWarningRoute(String path) => GoRoute(
      path: path,
      builder: (context, state) => const SubscriptionSoftWarningPage(),
    );
