class Date {
  final String label;
  final DateTime date;

  const Date({required this.label, required this.date});

  Map<String, dynamic> toJson() => {
    'label': label,
    'date': date.toIso8601String(),
  };

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    label: json['label'] as String? ?? '',
    date: DateTime.parse(json['date'] as String),
  );
}
