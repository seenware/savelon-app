// lib/features/main_app/contacts/presentation/contact_form/providers/form_scroll_controller_provider.dart

import 'package:flutter/widgets.dart';

class FormScrollController extends InheritedWidget {
  final ScrollController controller;

  const FormScrollController({
    super.key,
    required this.controller,
    required super.child,
  });

  static ScrollController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FormScrollController>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(FormScrollController oldWidget) {
    return controller != oldWidget.controller;
  }
}
