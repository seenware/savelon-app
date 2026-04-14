// features/main_app/contacts/data/datasources/device_contacts_datasource.dart

import 'dart:typed_data';

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';

/// A contact paired with its optional raw photo bytes from the device.
class ContactWithPhoto {
  final Contact contact;
  final Uint8List? photoBytes;

  const ContactWithPhoto({required this.contact, this.photoBytes});
}

/// Abstract interface for accessing device contacts
/// Implementation will use platform-specific packages
abstract class DeviceContactsDataSource {
  /// Request permission to access device contacts
  /// Returns true if permission granted
  Future<bool> requestPermission();

  /// Fetch all contacts from device (without photos)
  /// Returns empty list if permission denied
  Future<List<Contact>> fetchContacts();

  /// Fetch all contacts together with their photo bytes.
  /// Returns empty list if permission denied.
  Future<List<ContactWithPhoto>> fetchContactsWithPhotos();
}
