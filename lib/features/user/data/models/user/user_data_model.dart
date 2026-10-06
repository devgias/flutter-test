import 'package:flutter_test_quiz/features/user/user.dart';

/// Item of `GET /users`.
class UserDataModel {
  final int? id;
  final String? login;
  final String? avatarUrl;
  final String? type;

  const UserDataModel({
    this.id,
    this.login,
    this.avatarUrl,
    this.type,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json['id'] as int?,
        login: json['login'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'login': login,
        'avatar_url': avatarUrl,
        'type': type,
      };

  UserEntity toEntity() => UserEntity(
        id: id ?? 0,
        login: login ?? '-',
        avatarUrl: avatarUrl ?? '',
        type: type ?? '-',
      );
}
