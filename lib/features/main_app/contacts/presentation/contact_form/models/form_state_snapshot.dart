// lib/features/main_app/contacts/presentation/contact_form/models/form_state_snapshot.dart

import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart';

class FormStateSnapshot {
  final String prefix;
  final String firstName;
  final String middleName;
  final String lastName;
  final String suffix;
  final String nickname;
  final String company;
  final String department;
  final String jobTitle;
  final String notes;
  final List<RecordSnapshot> phones;
  final List<RecordSnapshot> emails;
  final List<RecordSnapshot> addresses;
  final List<RecordSnapshot> links;
  final List<RecordSnapshot> dates;
  final Set<NameFieldType> visibleNameFields;

  FormStateSnapshot({
    required this.prefix,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.nickname,
    required this.company,
    required this.department,
    required this.jobTitle,
    required this.notes,
    required this.phones,
    required this.emails,
    required this.addresses,
    required this.links,
    required this.dates,
    required this.visibleNameFields,
  });

  factory FormStateSnapshot.empty() {
    return FormStateSnapshot(
      prefix: '',
      firstName: '',
      middleName: '',
      lastName: '',
      suffix: '',
      nickname: '',
      company: '',
      department: '',
      jobTitle: '',
      notes: '',
      phones: [],
      emails: [],
      addresses: [],
      links: [],
      dates: [],
      visibleNameFields: {},
    );
  }
}

class RecordSnapshot {
  final String type;
  final String text;

  RecordSnapshot({required this.type, required this.text});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RecordSnapshot && other.type == type && other.text == text;
  }

  @override
  int get hashCode => Object.hash(type, text);
}
