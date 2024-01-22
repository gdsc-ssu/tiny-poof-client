class Diary {
  final String content;
  final DateTime date;

  Diary({required this.content, required this.date});

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      content: json['content'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'date': date.toIso8601String(),
      };
}
