// lib/features/main_app/contacts/presentation/contact_form/utils/contact_mapper.dart

import 'package:intl/intl.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import '../controllers/records_controller.dart';
import '../hooks/use_contact_form_state.dart';
import 'date_field_helper.dart';

class ContactMapper {
  ContactMapper._();

  static Contact fromFormState({
    required ContactFormState formState,
    required String contactId,
    String? imageFilename,
    required String localeName,
  }) {
    return Contact(
      id: contactId,
      prefix: formState.prefixController.text.trim(),
      firstName: formState.firstNameController.text.trim(),
      middleName: formState.middleNameController.text.trim(),
      lastName: formState.lastNameController.text.trim(),
      suffix: formState.suffixController.text.trim(),
      nickname: formState.nicknameController.text.trim(),
      company: formState.companyController.text.trim(),
      department: formState.departmentController.text.trim(),
      jobTitle: formState.jobTitleController.text.trim(),
      phones: mapPhones(formState.phoneController),
      emails: mapEmails(formState.emailController),
      addresses: mapAddresses(formState.addressController),
      links: mapLinks(formState.linkController),
      dates: mapDates(formState.dateController, localeName),
      note: formState.notesController.text.trim(),
      imageFilename: imageFilename,
    );
  }

  static List<Phone> mapPhones(RecordsController controller) {
    return controller
        .getNotEmptyRecords()
        .map((r) => Phone(label: r.type, number: r.textEditingController.text))
        .toList();
  }

  static List<Email> mapEmails(RecordsController controller) {
    return controller
        .getNotEmptyRecords()
        .map((r) => Email(label: r.type, address: r.textEditingController.text))
        .toList();
  }

  static List<Address> mapAddresses(RecordsController controller) {
    return controller
        .getNotEmptyRecords()
        .map(
          (r) => Address(label: r.type, address: r.textEditingController.text),
        )
        .toList();
  }

  static List<Link> mapLinks(RecordsController controller) {
    return controller
        .getNotEmptyRecords()
        .map((r) => Link(label: r.type, url: r.textEditingController.text))
        .toList();
  }

  static List<Date> mapDates(RecordsController controller, String localeName) {
    final fmt = DateFormat(DateFieldHelper.dateFormat, localeName);
    return controller
        .getNotEmptyRecords()
        .map((r) {
          try {
            final date = fmt.parse(r.textEditingController.text);
            return Date(label: r.type, date: date);
          } catch (e) {
            return null;
          }
        })
        .whereType<Date>()
        .toList();
  }
}
