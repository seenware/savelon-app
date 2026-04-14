// lib/features/startup/login/presentation/login_route.dart

import 'package:contacts/features/startup/login/presentation/login_page.dart';
import 'package:go_router/go_router.dart';

GoRoute loginRoute(String path) => GoRoute(
  path: path,
  pageBuilder: (context, state) {
    return const NoTransitionPage(child: LoginPage());
  },
);
