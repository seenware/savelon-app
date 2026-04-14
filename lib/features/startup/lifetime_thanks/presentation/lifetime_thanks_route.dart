import 'package:contacts/features/startup/lifetime_thanks/presentation/lifetime_thanks_page.dart';
import 'package:go_router/go_router.dart';

GoRoute lifetimeThanksRoute(String path) => GoRoute(
      path: path,
      builder: (context, state) => const LifetimeThanksPage(),
    );
