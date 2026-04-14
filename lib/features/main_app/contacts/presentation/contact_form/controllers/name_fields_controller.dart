// lib/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart

import 'package:flutter/material.dart';

enum NameFieldType { prefix, middleName, suffix, nickname }

class NameFieldsController {
  final ValueNotifier<Set<NameFieldType>> visibleNameFields;

  NameFieldsController({Set<NameFieldType>? initialNameFields})
    : visibleNameFields = ValueNotifier(initialNameFields ?? {});

  bool isNameFieldVisible(NameFieldType field) {
    return visibleNameFields.value.contains(field);
  }

  void setVisibleNameFields(Set<NameFieldType> fields) {
    visibleNameFields.value = Set.from(fields);
  }

  void dispose() {
    visibleNameFields.dispose();
  }
}
