// lib/features/startup/paywall/presentation/paywall_route.dart

import 'package:contacts/features/startup/paywall/presentation/paywall_page.dart';
import 'package:go_router/go_router.dart';

GoRoute paywallRoute(String path) => GoRoute(
      path: path,
      pageBuilder: (context, state) => NoTransitionPage(
        child: PaywallPage(
          softMode: state.uri.queryParameters['mode'] == 'soft',
          startupEntry: state.uri.queryParameters['entry'] == 'startup',
        ),
      ),
    );
