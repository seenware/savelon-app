

class Phone {
  final String label;
  final String number;

  const Phone({required this.label, required this.number});

  Map<String, dynamic> toJson() => {'label': label, 'number': number};

  factory Phone.fromJson(Map<String, dynamic> json) =>
      Phone(label: json['label'] as String, number: json['number'] as String);
}
