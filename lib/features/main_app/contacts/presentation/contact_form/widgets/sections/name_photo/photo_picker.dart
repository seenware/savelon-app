// lib/features/contacts/presentation/contact_form/widgets/sections/name_photo/photo_picker.dart

import 'dart:typed_data';

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends HookConsumerWidget {
  /// Holds the in-memory bytes of the image the user just picked/cropped.
  /// Null means "no new image selected this session."
  final ValueNotifier<Uint8List?> imageNotifier;

  /// Set to true when the user explicitly removes the image.
  final ValueNotifier<bool> imageRemovedNotifier;

  /// For editing: show the already-stored image when no new one is picked.
  final String? existingContactId;
  final String? existingImageFilename;

  const PhotoPicker({
    super.key,
    required this.imageNotifier,
    required this.imageRemovedNotifier,
    this.existingContactId,
    this.existingImageFilename,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useListenable(imageNotifier);
    useListenable(imageRemovedNotifier);
    final pickedBytes = imageNotifier.value;
    final isRemoved = imageRemovedNotifier.value;

    // Load existing image from encrypted storage when editing and
    // neither a new image was picked nor the image was removed.
    final existingImageAsync = ref.watch(
      contactImageProvider((
        contactId: existingContactId ?? '',
        imageFilename: (pickedBytes == null && !isRemoved)
            ? existingImageFilename
            : null,
      )),
    );
    final existingBytes = existingImageAsync.asData?.value;
    final displayBytes = pickedBytes ?? existingBytes;
    final hasImage = displayBytes != null;

    // Whether the avatar currently shows an image (to decide tap behaviour)
    final hasExistingImage =
        hasImage || (existingImageFilename != null && !isRemoved);

    return GestureDetector(
      onTap: () => hasExistingImage ? _showImageOptions(context) : _pickImage(),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _buildAvatar(context, displayBytes),
          _buildEditBadge(context),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, Uint8List? displayBytes) {
    return CircleAvatar(
      radius: 48,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      backgroundImage: displayBytes != null ? MemoryImage(displayBytes) : null,
      child: displayBytes == null
          ? Icon(
              Icons.person_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          : null,
    );
  }

  Widget _buildEditBadge(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 2,
        ),
      ),
      child: Icon(
        Icons.edit,
        size: 14,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  // ==================== Actions ====================

  Future<void> _showImageOptions(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final action = await showModalBottomSheet<_ImageAction>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.photoPickerNewImage),
              onTap: () => Navigator.pop(ctx, _ImageAction.pick),
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.red),
              title: Text(
                l10n.photoPickerRemoveImage,
                style: TextStyle(color: Colors.red),
              ),
              onTap: () => Navigator.pop(ctx, _ImageAction.remove),
            ),
          ],
        ),
      ),
    );

    if (action == null) return;
    if (action == _ImageAction.remove) {
      imageNotifier.value = null;
      imageRemovedNotifier.value = true;
    } else {
      await _pickImage();
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      // Keep the original photo quality; we'll handle a balanced
      // compression step after cropping.
      imageQuality: 100,
    );
    if (picked == null) return;

    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop photo',
          lockAspectRatio: true,
          hideBottomControls: true,
          showCropGrid: false,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [],
        ),
        IOSUiSettings(
          title: 'Crop photo',
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
          resetButtonHidden: true,
          rotateClockwiseButtonHidden: true,
          rotateButtonsHidden: true,
          aspectRatioPickerButtonHidden: true,
          cropStyle: CropStyle.circle,
        ),
      ],
    );
    if (cropped == null) return;

    final compressed = await FlutterImageCompress.compressWithFile(
      cropped.path,
      // Store at a higher resolution so full-screen views stay sharp
      // on modern devices, while still downscaling huge originals.
      minWidth: 800,
      minHeight: 800,
      quality: 90,
      format: CompressFormat.jpeg,
    );
    if (compressed == null) return;

    imageNotifier.value = compressed;
    imageRemovedNotifier.value = false;
  }
}

enum _ImageAction { pick, remove }
