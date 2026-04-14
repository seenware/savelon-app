import 'dart:typed_data';

import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/input.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/sections/name_photo/add_more_button.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/sections/name_photo/photo_picker.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NamePhotoSection extends HookWidget {
  final TextEditingController? prefixController;
  final TextEditingController firstNameController;
  final TextEditingController? middleNameController;
  final TextEditingController lastNameController;
  final TextEditingController? suffixController;
  final TextEditingController? nicknameController;
  final NameFieldsController nameFieldsController;
  final ValueNotifier<Uint8List?> imageNotifier;
  final ValueNotifier<bool> imageRemovedNotifier;
  final String? existingContactId;
  final String? existingImageFilename;

  const NamePhotoSection({
    super.key,
    this.prefixController,
    required this.firstNameController,
    this.middleNameController,
    required this.lastNameController,
    this.suffixController,
    this.nicknameController,
    required this.nameFieldsController,
    required this.imageNotifier,
    required this.imageRemovedNotifier,
    this.existingContactId,
    this.existingImageFilename,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final visibleNameFields = useListenable(
      nameFieldsController.visibleNameFields,
    );

    return Row(
      children: [
        PhotoPicker(
          imageNotifier: imageNotifier,
          imageRemovedNotifier: imageRemovedNotifier,
          existingContactId: existingContactId,
          existingImageFilename: existingImageFilename,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Prefix
              if (visibleNameFields.value.contains(NameFieldType.prefix) &&
                  prefixController != null) ...[
                Input(
                  controller: prefixController!,
                  hintText: l10n.formPrefix,
                  textCapitalization: TextCapitalization.words,
                ),
                const Divider(),
              ],

              // First Name
              Input(
                controller: firstNameController,
                hintText: l10n.formFirstName,
                textCapitalization: TextCapitalization.words,
              ),
              const Divider(),

              // Middle Name
              if (visibleNameFields.value.contains(NameFieldType.middleName) &&
                  middleNameController != null) ...[
                Input(
                  controller: middleNameController!,
                  hintText: l10n.formMiddleName,
                  textCapitalization: TextCapitalization.words,
                ),
                const Divider(),
              ],

              // Last Name
              Input(
                controller: lastNameController,
                hintText: l10n.formLastName,
                textCapitalization: TextCapitalization.words,
              ),

              // Suffix
              if (visibleNameFields.value.contains(NameFieldType.suffix) &&
                  suffixController != null) ...[
                const Divider(),
                Input(
                  controller: suffixController!,
                  hintText: l10n.formSuffix,
                  textCapitalization: TextCapitalization.words,
                ),
              ],

              // Nickname
              if (visibleNameFields.value.contains(NameFieldType.nickname) &&
                  nicknameController != null) ...[
                const Divider(),
                Input(
                  controller: nicknameController!,
                  hintText: l10n.formNickname,
                  textCapitalization: TextCapitalization.words,
                ),
              ],

              const SizedBox(height: 8),
              AddMoreButton(
                nameFieldsController: nameFieldsController,
                onFieldsHidden: (removedFields) {
                  if (removedFields.contains(NameFieldType.prefix)) {
                    prefixController?.clear();
                  }
                  if (removedFields.contains(NameFieldType.middleName)) {
                    middleNameController?.clear();
                  }
                  if (removedFields.contains(NameFieldType.suffix)) {
                    suffixController?.clear();
                  }
                  if (removedFields.contains(NameFieldType.nickname)) {
                    nicknameController?.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
