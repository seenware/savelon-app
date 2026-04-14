class Address {
  final String label;
  final String address;

  const Address({required this.label, required this.address});

  Map<String, dynamic> toJson() => {'label': label, 'address': address};

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    label: json['label'] as String? ?? '',
    address: json['address'] as String? ?? '',
  );
}
