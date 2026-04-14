// lib/features/main_app/settings/presentation/pages/language_settings_page.dart

import 'dart:math' show max;

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/locale/locale_provider.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/settings/presentation/language_locale_labels.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Matches [AppBar] defaults when theme does not override them.
double _appBarLeadingWidth(ThemeData theme) =>
    theme.appBarTheme.leadingWidth ?? 56;

/// [AppScaffold] applies [SafeArea] minimum horizontal padding to [body] only,
/// not to [Scaffold.appBar]. Nudge toolbar content toward the screen edge by
/// the same amount so the back control matches [ExportContactsPage]'s [AppBar].
Offset _toolbarTowardScreenEdgeNudge(BuildContext context) {
  final view = MediaQuery.viewPaddingOf(context);
  final minH = context.spacing.screenPaddingH;
  final rtl = Directionality.of(context) == TextDirection.rtl;
  final delta = rtl
      ? max(0.0, minH - view.right)
      : max(0.0, minH - view.left);
  return Offset(rtl ? delta : -delta, 0);
}

class LanguageSettingsPage extends ConsumerWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final supported = AppLocalizations.supportedLocales;
    final current = ref.watch(localeNotifierProvider);

    final int selectedRadio;
    if (current == null) {
      selectedRadio = -1;
    } else {
      final idx = supported.indexWhere(
        (s) =>
            s.languageCode == current.languageCode &&
            s.countryCode == current.countryCode &&
            s.scriptCode == current.scriptCode,
      );
      selectedRadio = idx < 0 ? -1 : idx;
    }

    Future<void> onChoice(int value) async {
      if (value < 0) {
        await ref.read(localeNotifierProvider.notifier).useSystemLocale();
      } else {
        await ref
            .read(localeNotifierProvider.notifier)
            .setLocale(supported[value]);
      }
      if (context.mounted) context.pop();
    }

    final leadingW = _appBarLeadingWidth(theme);
    final toolbarNudge = _toolbarTowardScreenEdgeNudge(context);

    return AppScaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ListView(
            padding: EdgeInsets.only(
              bottom:
                  MediaQuery.of(context).viewPadding.bottom +
                  context.spacing.screenPaddingV,
            ),
            children: [
              Transform.translate(
                offset: toolbarNudge,
                child: SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PositionedDirectional(
                        start: leadingW,
                        top: 0,
                        bottom: 0,
                        end: leadingW,
                        child: Center(
                          child: Text(
                            l10n.language,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.spacing.screenPaddingV),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spacing.screenPaddingH,
                ),
                child: RadioGroup<int>(
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    if (value != null) onChoice(value);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RadioListTile<int>(
                        title: Text(l10n.languageSystemDefault),
                        value: -1,
                      ),
                      for (var i = 0; i < supported.length; i++)
                        RadioListTile<int>(
                          title: Text(labelForLocale(supported[i])),
                          value: i,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: toolbarNudge,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: leadingW,
                height: kToolbarHeight,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
