class User {
  int id;
  String type;
  String login;
  String avatarUrl;

  User({
    required this.type,
    required this.login,
    required this.avatarUrl,
    required this.id
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'] as int,
      type: json['type'] as String,
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  @override
  String toString(){
    return "\"$type, $login, $avatarUrl\"";
  }
}

