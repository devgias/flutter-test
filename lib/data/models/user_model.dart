import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String login;
  final String type;
  final String avatarUrl;

  const UserModel({
    required this.id,
    required this.login,
    required this.type,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      login: json['login'] as String,
      type: json['type'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        login,
        type,
        avatarUrl,
      ];
}