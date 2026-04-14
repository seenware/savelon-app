

class Link {
  final String label;
  final String url;

  const Link({required this.label, required this.url});

  Map<String, dynamic> toJson() => {'label': label, 'url': url};

  factory Link.fromJson(Map<String, dynamic> json) =>
      Link(label: json['label'] as String, url: json['url'] as String);
}
