// lib/core/image_storage/image_storage_provider.dart

import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'image_storage_service.dart';

class ImageStorageNotifier extends Notifier<ImageStorageService?> {
  @override
  ImageStorageService? build() => null;

  void initialize(Uint8List encryptionKey) {
    if (state != null) return;
    state = ImageStorageService(encryptionKey: encryptionKey);
  }

  void reset() {
    state = null;
  }
}

final imageStorageProvider =
    NotifierProvider<ImageStorageNotifier, ImageStorageService?>(
      ImageStorageNotifier.new,
    );

/// Loads and decrypts an image from disk, returning null if no image is set.
///
/// Usage: ref.watch(contactImageProvider((contactId: id, imageFilename: fn)))
final contactImageProvider = FutureProvider.autoDispose
    .family<Uint8List?, ({String contactId, String? imageFilename})>((
      ref,
      args,
    ) async {
      if (args.imageFilename == null) return null;

      final service = ref.watch(imageStorageProvider);
      if (service == null) return null;

      return service.loadImage(args.contactId, args.imageFilename!);
    });
