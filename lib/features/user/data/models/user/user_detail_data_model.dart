import 'package:flutter_test_quiz/features/user/user.dart';

/// Response of `GET /users/{login}`.
class UserDetailDataModel {
  final int? id;
  final String? login;
  final String? avatarUrl;
  final String? type;
  final String? name;
  final String? email;
  final String? company;
  final bool isLocal;

  const UserDetailDataModel({
    this.id,
    this.login,
    this.avatarUrl,
    this.type,
    this.name,
    this.email,
    this.company,
    this.isLocal = false,
  });

  factory UserDetailDataModel.fromJson(Map<String, dynamic> json) =>
      UserDetailDataModel(
        id: json['id'] as int?,
        login: json['login'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        company: json['company'] as String?,
      );

  factory UserDetailDataModel.fromEntity(UserDetailEntity entity) =>
      UserDetailDataModel(
        id: entity.id,
        login: entity.login,
        avatarUrl: entity.avatarUrl,
        type: entity.type,
        name: entity.name,
        email: entity.email,
        company: entity.company,
        isLocal: entity.isLocal,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'login': login,
        'avatar_url': avatarUrl,
        'type': type,
        'name': name,
        'email': email,
        'company': company,
      };

  /// Applies the submitted form values on top of this user.
  UserDetailDataModel applyForm(UserFormEntity form) => UserDetailDataModel(
        id: id,
        login: login,
        avatarUrl: avatarUrl,
        type: type,
        name: form.name,
        email: form.email,
        company: form.company,
        isLocal: isLocal,
      );

  UserDetailEntity toEntity() => UserDetailEntity(
        id: id ?? 0,
        login: login ?? '-',
        avatarUrl: avatarUrl ?? '',
        type: type ?? '-',
        name: name,
        email: email,
        company: company,
        isLocal: isLocal,
      );

  UserEntity toUserEntity() => UserEntity(
        id: id ?? 0,
        login: login ?? '-',
        avatarUrl: avatarUrl ?? '',
        type: type ?? '-',
        isLocal: isLocal,
      );
}
