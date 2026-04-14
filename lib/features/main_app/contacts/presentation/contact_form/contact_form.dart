// lib/features/main_app/contacts/presentation/contact_form/contact_form.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../core/theme/app_theme.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'handlers/form_navigation_handler.dart';
import 'handlers/form_save_handler.dart';
import 'hooks/use_contact_form_state.dart';
import 'hooks/use_form_initialization.dart';
import 'providers/form_scroll_controller_provider.dart';
import 'widgets/header.dart';
import 'widgets/sections/address_section.dart';
import 'widgets/sections/company_section.dart';
import 'widgets/sections/date_section.dart';
import 'widgets/sections/email_section.dart';
import 'widgets/sections/link_section.dart';
import 'widgets/sections/name_photo/name_photo_section.dart';
import 'widgets/sections/notes_section.dart';
import 'widgets/sections/phone_section.dart';

class ContactForm extends HookConsumerWidget {
  final Contact? contact;
  final bool forceCreateMode;
  final List<String> deleteOnSaveIds;

  const ContactForm({
    super.key,
    this.contact,
    this.forceCreateMode = false,
    this.deleteOnSaveIds = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final scrollController = useScrollController();
    final isEditing = contact != null && !forceCreateMode;
    final shouldPrefillFromContact = contact != null;

    // Initialize form state using custom hook
    final formState = useContactFormState(contact);

    // Initialize form data (populate fields for editing)
    useFormInitialization(
      context: context,
      contact: contact,
      isEditing: shouldPrefillFromContact,
      phoneController: formState.phoneController,
      emailController: formState.emailController,
      addressController: formState.addressController,
      linkController: formState.linkController,
      dateController: formState.dateController,
      formState: formState,
    );

    // Block barrier/drag dismissal for a short window after the form mounts.
    // On iPad, the touch that triggered the edit button can bleed through to the
    // barrier overlay and dismiss the sheet within ~350ms of it opening. We use
    // an AnimationController (vsync-tied to Flutter's render loop, NOT a wall-
    // clock timer) to cover both the 250ms sheet open animation and the observed
    // ~150ms post-animation bleed-through window (total: 500ms from mount).
    final dismissGuard = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final isReadyForDismissal = useState(false);
    useEffect(() {
      void onStatus(AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          isReadyForDismissal.value = true;
        }
      }
      dismissGuard.addStatusListener(onStatus);
      dismissGuard.forward();
      return () => dismissGuard.removeStatusListener(onStatus);
    }, []);

    // Handlers
    final saveHandler = useMemoized(
      () => FormSaveHandler(
        formKey: formKey,
        formState: formState,
        contact: contact,
        isEditingMode: isEditing,
        deleteOnSaveIds: deleteOnSaveIds,
        ref: ref,
      ),
    );

    final navigationHandler = useMemoized(
      () =>
          FormNavigationHandler(hasUnsavedChanges: formState.hasUnsavedChanges),
    );

    final mediaQuery = MediaQuery.of(context);
    final viewPadding = mediaQuery.viewPadding;
    final viewInsets = mediaQuery.viewInsets;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: isReadyForDismissal.value && !formState.hasUnsavedChanges.value,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          // Pop was blocked: guard window still active (bleed-through touch) —
          // ignore silently rather than showing the unsaved-changes dialog.
          if (!isReadyForDismissal.value) return;
          await navigationHandler.handlePopWithUnsavedChanges(context);
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(bottom: viewInsets.bottom),
            child: FormScrollController(
              controller: scrollController,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: CustomScrollView(
                  controller: scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    // Sticky Header
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyHeaderDelegate(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.spacing.screenPaddingH,
                          ),
                          child: Header(
                            prefixController: formState.prefixController,
                            firstNameController: formState.firstNameController,
                            middleNameController: formState.middleNameController,
                            lastNameController: formState.lastNameController,
                            suffixController: formState.suffixController,
                            nameFieldsController: formState.nameFieldsController,
                            isEditing: isEditing,
                            onSave: () => saveHandler.handleSave(context),
                            onClose: () => navigationHandler.handleClose(context),
                          ),
                        ),
                      ),
                    ),

                    // Scrollable Content
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.screenPaddingH,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          NamePhotoSection(
                            prefixController: formState.prefixController,
                            firstNameController: formState.firstNameController,
                            middleNameController: formState.middleNameController,
                            lastNameController: formState.lastNameController,
                            suffixController: formState.suffixController,
                            nicknameController: formState.nicknameController,
                            nameFieldsController: formState.nameFieldsController,
                            imageNotifier: formState.imageNotifier,
                            imageRemovedNotifier: formState.imageRemovedNotifier,
                            existingContactId: contact?.id,
                            existingImageFilename: contact?.imageFilename,
                          ),
                          const SizedBox(height: 32),
                          CompanySection(
                            companyController: formState.companyController,
                            departmentController: formState.departmentController,
                            jobTitleController: formState.jobTitleController,
                          ),
                          const SizedBox(height: 32),
                          PhoneSection(controller: formState.phoneController),
                          const SizedBox(height: 32),
                          EmailSection(controller: formState.emailController),
                          const SizedBox(height: 32),
                          AddressSection(controller: formState.addressController),
                          const SizedBox(height: 32),
                          LinkSection(controller: formState.linkController),
                          const SizedBox(height: 32),
                          DateSection(controller: formState.dateController),
                          const SizedBox(height: 32),
                          NotesSection(controller: formState.notesController),
                          SizedBox(
                            height: max(
                              viewPadding.bottom,
                              context.spacing.screenPaddingV,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  double get minExtent => 80.0;

  @override
  double get maxExtent => 80.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
