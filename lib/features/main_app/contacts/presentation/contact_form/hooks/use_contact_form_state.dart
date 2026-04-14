// lib/features/main_app/contacts/presentation/contact_form/hooks/use_contact_form_state.dart

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import '../../../domain/constants/field_types.dart';
import '../utils/field_type_l10n.dart';
import '../controllers/name_fields_controller.dart';
import '../controllers/records_controller.dart';
import '../hooks/use_records.dart';
import '../models/form_state_snapshot.dart';
import '../utils/form_state_comparator.dart';

class ContactFormState {
  // Name fields
  final TextEditingController prefixController;
  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController lastNameController;
  final TextEditingController suffixController;
  final TextEditingController nicknameController;

  // Company fields
  final TextEditingController companyController;
  final TextEditingController departmentController;
  final TextEditingController jobTitleController;

  // Notes
  final TextEditingController notesController;

  // Records controllers
  final RecordsController phoneController;
  final RecordsController emailController;
  final RecordsController addressController;
  final RecordsController linkController;
  final RecordsController dateController;

  // Sections controller
  final NameFieldsController nameFieldsController;

  // Picked image bytes (null = no change this session)
  final ValueNotifier<Uint8List?> imageNotifier;

  // True when the user explicitly removed the image
  final ValueNotifier<bool> imageRemovedNotifier;

  // True when the original contact already had an image
  final bool initialHasImage;

  // Unsaved changes tracker
  final ValueNotifier<bool> hasUnsavedChanges;

  // Initial state snapshot
  final ValueNotifier<FormStateSnapshot?> initialSnapshot;

  ContactFormState({
    required this.prefixController,
    required this.firstNameController,
    required this.middleNameController,
    required this.lastNameController,
    required this.suffixController,
    required this.nicknameController,
    required this.companyController,
    required this.departmentController,
    required this.jobTitleController,
    required this.notesController,
    required this.phoneController,
    required this.emailController,
    required this.addressController,
    required this.linkController,
    required this.dateController,
    required this.nameFieldsController,
    required this.imageNotifier,
    required this.imageRemovedNotifier,
    required this.initialHasImage,
    required this.hasUnsavedChanges,
    required this.initialSnapshot,
  });

  void captureInitialState() {
    initialSnapshot.value = FormStateComparator.captureSnapshot(
      prefixController: prefixController,
      firstNameController: firstNameController,
      middleNameController: middleNameController,
      lastNameController: lastNameController,
      suffixController: suffixController,
      nicknameController: nicknameController,
      companyController: companyController,
      departmentController: departmentController,
      jobTitleController: jobTitleController,
      notesController: notesController,
      phoneController: phoneController,
      emailController: emailController,
      addressController: addressController,
      linkController: linkController,
      dateController: dateController,
      nameFieldsController: nameFieldsController,
    );
  }

  void updateUnsavedChanges() {
    if (initialSnapshot.value == null) {
      hasUnsavedChanges.value = false;
      return;
    }

    final hasFormChanges = FormStateComparator.hasChanges(
      snapshot: initialSnapshot.value!,
      prefixController: prefixController,
      firstNameController: firstNameController,
      middleNameController: middleNameController,
      lastNameController: lastNameController,
      suffixController: suffixController,
      nicknameController: nicknameController,
      companyController: companyController,
      departmentController: departmentController,
      jobTitleController: jobTitleController,
      notesController: notesController,
      phoneController: phoneController,
      emailController: emailController,
      addressController: addressController,
      linkController: linkController,
      dateController: dateController,
      nameFieldsController: nameFieldsController,
    );

    // Image changes are not part of the text/records snapshot, so we track
    // them separately and OR them into the overall dirty state.
    bool hasImageChange = false;
    if (initialHasImage) {
      // Originally had an image: either picking a new one or removing it
      // counts as a change.
      if (imageRemovedNotifier.value) {
        hasImageChange = true;
      } else if (imageNotifier.value != null) {
        hasImageChange = true;
      }
    } else {
      // Originally had no image: picking a new one counts as a change.
      if (imageNotifier.value != null) {
        hasImageChange = true;
      }
    }

    hasUnsavedChanges.value = hasFormChanges || hasImageChange;
  }

  // Add listeners to all text controllers within records
  void attachRecordTextListeners(VoidCallback listener) {
    for (final record in phoneController.records.value) {
      record.textEditingController.addListener(listener);
    }
    for (final record in emailController.records.value) {
      record.textEditingController.addListener(listener);
    }
    for (final record in addressController.records.value) {
      record.textEditingController.addListener(listener);
    }
    for (final record in linkController.records.value) {
      record.textEditingController.addListener(listener);
    }
    for (final record in dateController.records.value) {
      record.textEditingController.addListener(listener);
    }
  }

  // Remove listeners from all text controllers within records
  void detachRecordTextListeners(VoidCallback listener) {
    for (final record in phoneController.records.value) {
      record.textEditingController.removeListener(listener);
    }
    for (final record in emailController.records.value) {
      record.textEditingController.removeListener(listener);
    }
    for (final record in addressController.records.value) {
      record.textEditingController.removeListener(listener);
    }
    for (final record in linkController.records.value) {
      record.textEditingController.removeListener(listener);
    }
    for (final record in dateController.records.value) {
      record.textEditingController.removeListener(listener);
    }
  }
}

ContactFormState useContactFormState(Contact? contact) {
  final isEditing = contact != null;

  // Name fields
  final prefixController = useTextEditingController(
    text: contact?.prefix ?? '',
  );
  final firstNameController = useTextEditingController(
    text: contact?.firstName ?? '',
  );
  final middleNameController = useTextEditingController(
    text: contact?.middleName ?? '',
  );
  final lastNameController = useTextEditingController(
    text: contact?.lastName ?? '',
  );
  final suffixController = useTextEditingController(
    text: contact?.suffix ?? '',
  );
  final nicknameController = useTextEditingController(
    text: contact?.nickname ?? '',
  );

  // Company fields
  final companyController = useTextEditingController(
    text: contact?.company ?? '',
  );
  final departmentController = useTextEditingController(
    text: contact?.department ?? '',
  );
  final jobTitleController = useTextEditingController(
    text: contact?.jobTitle ?? '',
  );

  // Notes
  final notesController = useTextEditingController(text: contact?.note ?? '');

  // Records controllers
  final phoneController = useRecords(
    ContactFieldTypes.phone,
    FieldKind.phone,
  );
  final emailController = useRecords(
    ContactFieldTypes.email,
    FieldKind.email,
  );
  final addressController = useRecords(
    ContactFieldTypes.address,
    FieldKind.address,
  );
  final linkController = useRecords(ContactFieldTypes.link, FieldKind.link);
  final dateController = useRecords(ContactFieldTypes.date, FieldKind.date);

  // Sections controller
  final nameFieldsController = useMemoized(() {
    final initialNameFields = <NameFieldType>{};

    if (isEditing) {
      if (contact.prefix.isNotEmpty) {
        initialNameFields.add(NameFieldType.prefix);
      }
      if (contact.middleName.isNotEmpty) {
        initialNameFields.add(NameFieldType.middleName);
      }
      if (contact.suffix.isNotEmpty) {
        initialNameFields.add(NameFieldType.suffix);
      }
      if (contact.nickname.isNotEmpty) {
        initialNameFields.add(NameFieldType.nickname);
      }
    }

    return NameFieldsController(initialNameFields: initialNameFields);
  });

  final imageNotifier = useState<Uint8List?>(null);
  final imageRemovedNotifier = useState(false);
  final hasUnsavedChanges = useState(false);
  final initialSnapshot = useState<FormStateSnapshot?>(null);
  final initialHasImage = contact?.imageFilename != null;

  final formState = useMemoized(
    () => ContactFormState(
      prefixController: prefixController,
      firstNameController: firstNameController,
      middleNameController: middleNameController,
      lastNameController: lastNameController,
      suffixController: suffixController,
      nicknameController: nicknameController,
      companyController: companyController,
      departmentController: departmentController,
      jobTitleController: jobTitleController,
      notesController: notesController,
      phoneController: phoneController,
      emailController: emailController,
      addressController: addressController,
      linkController: linkController,
      dateController: dateController,
      nameFieldsController: nameFieldsController,
      imageNotifier: imageNotifier,
      imageRemovedNotifier: imageRemovedNotifier,
      initialHasImage: initialHasImage,
      hasUnsavedChanges: hasUnsavedChanges,
      initialSnapshot: initialSnapshot,
    ),
  );

  // Listen to changes
  useEffect(() {
    void listener() => formState.updateUnsavedChanges();

    // Name fields
    prefixController.addListener(listener);
    firstNameController.addListener(listener);
    middleNameController.addListener(listener);
    lastNameController.addListener(listener);
    suffixController.addListener(listener);
    nicknameController.addListener(listener);

    // Company fields
    companyController.addListener(listener);
    departmentController.addListener(listener);
    jobTitleController.addListener(listener);

    // Notes
    notesController.addListener(listener);

    // Records list changes (add/remove)
    phoneController.records.addListener(listener);
    emailController.records.addListener(listener);
    addressController.records.addListener(listener);
    linkController.records.addListener(listener);
    dateController.records.addListener(listener);

    // Name fields visibility
    nameFieldsController.visibleNameFields.addListener(listener);

    // Attach listeners to text controllers inside records
    formState.attachRecordTextListeners(listener);

    return () {
      prefixController.removeListener(listener);
      firstNameController.removeListener(listener);
      middleNameController.removeListener(listener);
      lastNameController.removeListener(listener);
      suffixController.removeListener(listener);
      nicknameController.removeListener(listener);
      companyController.removeListener(listener);
      departmentController.removeListener(listener);
      jobTitleController.removeListener(listener);
      notesController.removeListener(listener);
      phoneController.records.removeListener(listener);
      emailController.records.removeListener(listener);
      addressController.records.removeListener(listener);
      linkController.records.removeListener(listener);
      dateController.records.removeListener(listener);
      nameFieldsController.visibleNameFields.removeListener(listener);

      // Detach listeners from text controllers inside records
      formState.detachRecordTextListeners(listener);
    };
  }, []);

  // Listen to image changes
  useEffect(() {
    void listener() => formState.updateUnsavedChanges();

    imageNotifier.addListener(listener);
    imageRemovedNotifier.addListener(listener);

    return () {
      imageNotifier.removeListener(listener);
      imageRemovedNotifier.removeListener(listener);
    };
  }, []);

  // Listen for records list changes to update text controller listeners
  useEffect(() {
    void onRecordsChanged() {
      // When records are added/removed, we need to update listeners
      // First remove old listeners, then add new ones
      void listener() => formState.updateUnsavedChanges();

      formState.detachRecordTextListeners(listener);
      formState.attachRecordTextListeners(listener);
    }

    phoneController.records.addListener(onRecordsChanged);
    emailController.records.addListener(onRecordsChanged);
    addressController.records.addListener(onRecordsChanged);
    linkController.records.addListener(onRecordsChanged);
    dateController.records.addListener(onRecordsChanged);

    return () {
      phoneController.records.removeListener(onRecordsChanged);
      emailController.records.removeListener(onRecordsChanged);
      addressController.records.removeListener(onRecordsChanged);
      linkController.records.removeListener(onRecordsChanged);
      dateController.records.removeListener(onRecordsChanged);
    };
  }, []);

  return formState;
}
