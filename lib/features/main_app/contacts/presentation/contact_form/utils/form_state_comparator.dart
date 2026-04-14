// lib/features/main_app/contacts/presentation/contact_form/utils/form_state_comparator.dart

import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/records_controller.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/models/form_state_snapshot.dart';
import 'package:flutter/material.dart';

class FormStateComparator {
  static FormStateSnapshot captureSnapshot({
    required TextEditingController prefixController,
    required TextEditingController firstNameController,
    required TextEditingController middleNameController,
    required TextEditingController lastNameController,
    required TextEditingController suffixController,
    required TextEditingController nicknameController,
    required TextEditingController companyController,
    required TextEditingController departmentController,
    required TextEditingController jobTitleController,
    required TextEditingController notesController,
    required RecordsController phoneController,
    required RecordsController emailController,
    required RecordsController addressController,
    required RecordsController linkController,
    required RecordsController dateController,
    required NameFieldsController nameFieldsController,
  }) {
    return FormStateSnapshot(
      prefix: prefixController.text,
      firstName: firstNameController.text,
      middleName: middleNameController.text,
      lastName: lastNameController.text,
      suffix: suffixController.text,
      nickname: nicknameController.text,
      company: companyController.text,
      department: departmentController.text,
      jobTitle: jobTitleController.text,
      notes: notesController.text,
      phones: _captureRecords(phoneController),
      emails: _captureRecords(emailController),
      addresses: _captureRecords(addressController),
      links: _captureRecords(linkController),
      dates: _captureRecords(dateController),
      visibleNameFields: Set.from(nameFieldsController.visibleNameFields.value),
    );
  }

  static List<RecordSnapshot> _captureRecords(RecordsController controller) {
    return controller.records.value
        .where(
          (record) => record.textEditingController.text.trim().isNotEmpty,
        )
        .map(
          (record) => RecordSnapshot(
            type: record.type,
            text: record.textEditingController.text,
          ),
        )
        .toList();
  }

  static bool hasChanges({
    required FormStateSnapshot snapshot,
    required TextEditingController prefixController,
    required TextEditingController firstNameController,
    required TextEditingController middleNameController,
    required TextEditingController lastNameController,
    required TextEditingController suffixController,
    required TextEditingController nicknameController,
    required TextEditingController companyController,
    required TextEditingController departmentController,
    required TextEditingController jobTitleController,
    required TextEditingController notesController,
    required RecordsController phoneController,
    required RecordsController emailController,
    required RecordsController addressController,
    required RecordsController linkController,
    required RecordsController dateController,
    required NameFieldsController nameFieldsController,
  }) {
    // Compare text fields
    if (prefixController.text != snapshot.prefix) return true;
    if (firstNameController.text != snapshot.firstName) return true;
    if (middleNameController.text != snapshot.middleName) return true;
    if (lastNameController.text != snapshot.lastName) return true;
    if (suffixController.text != snapshot.suffix) return true;
    if (nicknameController.text != snapshot.nickname) return true;
    if (companyController.text != snapshot.company) return true;
    if (departmentController.text != snapshot.department) return true;
    if (jobTitleController.text != snapshot.jobTitle) return true;
    if (notesController.text != snapshot.notes) return true;

    // Compare records
    if (_recordsChanged(phoneController, snapshot.phones)) return true;
    if (_recordsChanged(emailController, snapshot.emails)) return true;
    if (_recordsChanged(addressController, snapshot.addresses)) return true;
    if (_recordsChanged(linkController, snapshot.links)) return true;
    if (_recordsChanged(dateController, snapshot.dates)) return true;

    // Compare visible name fields
    if (!_setsEqual(
      nameFieldsController.visibleNameFields.value,
      snapshot.visibleNameFields,
    )) {
      return true;
    }

    return false;
  }

  static bool _recordsChanged(
    RecordsController controller,
    List<RecordSnapshot> snapshot,
  ) {
    final current = _captureRecords(controller);

    if (current.length != snapshot.length) return true;

    for (int i = 0; i < current.length; i++) {
      if (current[i] != snapshot[i]) return true;
    }

    return false;
  }

  static bool _setsEqual<T>(Set<T> set1, Set<T> set2) {
    if (set1.length != set2.length) return false;
    return set1.containsAll(set2) && set2.containsAll(set1);
  }
}
