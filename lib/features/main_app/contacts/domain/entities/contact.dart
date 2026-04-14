import 'address.dart';
import 'date.dart';
import 'email.dart';
import 'link.dart';
import 'phone.dart';

class Contact {
  final String id;
  final String prefix;
  final String firstName;
  final String middleName;
  final String lastName;
  final String suffix;
  final String nickname;
  final String company;
  final String department;
  final String jobTitle;
  final List<Phone> phones;
  final List<Email> emails;
  final List<Address> addresses;
  final List<Link> links;
  final List<Date> dates;
  final String note;
  final String? imageFilename;

  const Contact({
    required this.id,
    required this.prefix,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.nickname,
    required this.company,
    required this.department,
    required this.jobTitle,
    required this.phones,
    required this.emails,
    required this.addresses,
    required this.links,
    required this.dates,
    required this.note,
    this.imageFilename,
  });

  String get fullName {
    final parts = [
      if (prefix.isNotEmpty) prefix,
      if (firstName.isNotEmpty) firstName,
      if (middleName.isNotEmpty) middleName,
      if (lastName.isNotEmpty) lastName,
      if (suffix.isNotEmpty) suffix,
    ];
    return parts.join(' ').trim();
  }

  String get sortKey {
    if (firstName.isNotEmpty) return firstName;
    if (lastName.isNotEmpty) return lastName;
    if (company.isNotEmpty) return company;
    if (nickname.isNotEmpty) return nickname;
    if (emails.isNotEmpty) return emails.first.address;
    return '';
  }

  ({String type, String value})? get primaryInfo {
    if (phones.isNotEmpty) return (type: 'phone', value: phones.first.number);
    if (emails.isNotEmpty) return (type: 'email', value: emails.first.address);
    if (company.isNotEmpty) return (type: 'company', value: company);
    if (department.isNotEmpty) return (type: 'department', value: department);
    if (jobTitle.isNotEmpty) return (type: 'jobTitle', value: jobTitle);
    return null;
  }

  Contact copyWith({
    String? id,
    String? prefix,
    String? firstName,
    String? middleName,
    String? lastName,
    String? suffix,
    String? nickname,
    String? company,
    String? department,
    String? jobTitle,
    List<Phone>? phones,
    List<Email>? emails,
    List<Address>? addresses,
    List<Link>? links,
    List<Date>? dates,
    String? note,
    Object? imageFilename = _sentinel,
  }) {
    return Contact(
      id: id ?? this.id,
      prefix: prefix ?? this.prefix,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      suffix: suffix ?? this.suffix,
      nickname: nickname ?? this.nickname,
      company: company ?? this.company,
      department: department ?? this.department,
      jobTitle: jobTitle ?? this.jobTitle,
      phones: phones ?? this.phones,
      emails: emails ?? this.emails,
      addresses: addresses ?? this.addresses,
      links: links ?? this.links,
      dates: dates ?? this.dates,
      note: note ?? this.note,
      imageFilename: imageFilename == _sentinel
          ? this.imageFilename
          : imageFilename as String?,
    );
  }
}

const Object _sentinel = Object();
