// lib/features/startup/subscription/presentation/subscription_expired_route.dart

import 'package:contacts/features/startup/subscription/presentation/subscription_expired_page.dart';
import 'package:go_router/go_router.dart';

GoRoute subscriptionExpiredRoute(String path) => GoRoute(
      path: path,
      builder: (context, state) => const SubscriptionExpiredPage(),
    );
