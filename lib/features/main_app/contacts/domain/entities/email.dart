

class Email {
  final String label;
  final String address;

  const Email({required this.label, required this.address});

  Map<String, dynamic> toJson() => {'label': label, 'address': address};

  factory Email.fromJson(Map<String, dynamic> json) =>
      Email(label: json['label'] as String, address: json['address'] as String);
}
