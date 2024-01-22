class User {
  final String name;
  final DateTime birth;

  User({required this.name, required this.birth});

  User copyWith({String? name, DateTime? birth}) {
    return User(
      name: name ?? this.name,
      birth: birth ?? this.birth,
    );
  }

  @override
  String toString() => 'User(name: $name, birth: $birth)';

  // toJson fromJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birth': birth,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      birth: json['birth'],
    );
  }
}
