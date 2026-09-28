import 'package:equatable/equatable.dart';

class UserDetailModel extends Equatable {
  const UserDetailModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
    this.name,
    this.email,
    this.company,
  });

  final int id;
  final String login;
  final String avatarUrl;
  final String? name;
  final String? email;
  final String? company;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      id: json['id'] as int? ?? 0,
      login: json['login'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String? ?? '',
      name: json['name'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, login, avatarUrl, name, email, company];
}