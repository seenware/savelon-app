// lib/features/startup/setup/presentation/setup_routes.dart

import 'package:contacts/features/startup/setup/presentation/password_page/password_page.dart';
import 'package:go_router/go_router.dart';

GoRoute setupRoute(String path) => GoRoute(
  path: path,
  redirect: (context, state) {
    final currentPath = state.uri.path;

    if (currentPath == path || currentPath == '$path/') {
      return '$path/2_create_password';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '2_create_password',
      builder: (context, state) {
        void onNext() {
          context.go('/main_app');
        }

        return PasswordPage(onNext: onNext);
      },
    ),
  ],
);
