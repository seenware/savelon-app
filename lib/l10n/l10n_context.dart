import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension AppLocalizationContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
