class Quote {
  final String id;
  final String text;
  final String author;
  final bool isFavorite;
  final DateTime createdAt;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    this.isFavorite = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
      'isFavorite': isFavorite,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      author: json['author'],
      isFavorite: json['isFavorite'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Quote copyWith({bool? isFavorite}) {
    return Quote(
      id: id,
      text: text,
      author: author,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt,
    );
  }
}