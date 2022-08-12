import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? company;
  final String? userType;
  final String? avatar;
  final String? url;
  final String? login;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.company,
    required this.userType,
    required this.avatar,
    required this.url,
    required this.login,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['Tom Preston-Werner'],
      email: json['email'],
      company: json['company'],
      userType: json['type'],
      avatar: json['avatar_url'],
      url: json['url'],
      login: json['login'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        company,
        userType,
        avatar,
        url,
        login,
      ];
}
