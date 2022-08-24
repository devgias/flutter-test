class EditUser {
  String? name;
  String? email;
  String? company;

  EditUser({
    required this.name,
    required this.email,
    required this.company,
  });

  factory EditUser.fromJson(dynamic json) {
    return EditUser(
      name: json['name'] == null? "" : json['name'] as String,
      email: json['email'] == null ? "" : json['email'] as String,
      company: json['company'] == null ? "" : json['company'] as String
    );
  }
}