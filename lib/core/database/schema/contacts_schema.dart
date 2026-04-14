// lib/core/database/schema/contacts_schema.dart

class ContactsSchema {
  ContactsSchema._();

  static const String tableName = 'contacts';

  // Column names
  static const String columnId = 'id';
  static const String columnPrefix = 'prefix';
  static const String columnFirstName = 'first_name';
  static const String columnMiddleName = 'middle_name';
  static const String columnLastName = 'last_name';
  static const String columnSuffix = 'suffix';
  static const String columnNickname = 'nickname';
  static const String columnCompany = 'company';
  static const String columnDepartment = 'department';
  static const String columnJobTitle = 'job_title';
  static const String columnPhones = 'phones';
  static const String columnEmails = 'emails';
  static const String columnAddresses = 'addresses';
  static const String columnLinks = 'links';
  static const String columnDates = 'dates';
  static const String columnNote = 'note';
  static const String columnImageFilename = 'image_filename';

  // Create table SQL
  static const String createTableSql =
      '''
    CREATE TABLE $tableName (
      $columnId TEXT PRIMARY KEY,
      $columnPrefix TEXT,
      $columnFirstName TEXT,
      $columnMiddleName TEXT,
      $columnLastName TEXT,
      $columnSuffix TEXT,
      $columnNickname TEXT,
      $columnCompany TEXT,
      $columnDepartment TEXT,
      $columnJobTitle TEXT,
      $columnPhones TEXT,
      $columnEmails TEXT,
      $columnAddresses TEXT,
      $columnLinks TEXT,
      $columnDates TEXT,
      $columnNote TEXT,
      $columnImageFilename TEXT
    )
  ''';

  // Index for search performance
  static const String createSearchIndexSql =
      '''
    CREATE INDEX idx_search ON $tableName($columnFirstName, $columnLastName, $columnCompany)
  ''';
}
