import 'package:equatable/equatable.dart';

class UserDetailModel extends Equatable {
  final int id;
  final String login;
  final String? name;
  final String? email;
  final String? company;

  const UserDetailModel({
    required this.id,
    required this.login,
    this.name,
    this.email,
    this.company,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      id: json['id'] as int,
      login: json['login'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, login, name, email, company];
}
